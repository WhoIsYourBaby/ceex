import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:ceex_flutter/cubit/contract/contract_state.dart';
import 'package:ceex_flutter/model/appconfig/symbol_model.dart';
import 'package:ceex_flutter/model/order/order_model.dart';
import 'package:ceex_flutter/model/websocket/ws_diff_depth_model.dart';
import 'package:ceex_flutter/model/websocket/ws_model.dart';
import 'package:ceex_flutter/repository/repository.dart';
import 'package:ceex_flutter/utils/config.dart';
import 'package:ceex_flutter/utils/enums.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:ceex_flutter/utils/ws_manager.dart';
import 'package:ceex_flutter/views/kline/kline_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ceex_flutter/utils/ext.dart';

import 'package:get_it/get_it.dart';
import 'package:oktoast/oktoast.dart';

class ContractCubit extends Cubit<ContractState> with WsResponseMixin {
  ContractCubit() : super(ContractState.initialState());
  Timer? tickerTimer;
  List<String> digitMergeNameList = [];

  initView(List<SymbolModel> list,
      {KlineViewParams? klineViewParams,
      required BbChooseType contractViewType}) {
    if (list.isNotEmpty) {
      if (klineViewParams == null) {
        updateSymbol(
            symbolName: list[0].symbolName ?? "",
            symbolId: list[0].symbolId ?? "",
            baseTokenId: list[0].baseTokenId ?? "",
            digitMerge: list[0].digitMerge ?? "",
            exchangeId: list[0].exchangeId ?? "");
      } else {
        // updateSymbol(
        //     symbolName: klineViewParams.symbolName,
        //     symbolId: klineViewParams.symbolId,
        //     baseTokenId: klineViewParams.baseTokenId,
        //     digitMerge: klineViewParams.digitMerge,
        //     exchangeId: klineViewParams.exchangeId);
      }
      emit(state.copyWith(bbChooseType: contractViewType));
      orderTradeOrders();
    }
  }

  void changeBbChooseType(BbChooseType bbChooseType) {
    emit(state.copyWith(bbChooseType: bbChooseType));
  }

  // 买币
  void buyBB(
      {required BbChooseType bbChooseType,
      required String price,
      required String number}) {
    if (!UserInfoManager.shared.isLogin) {
      showMsg("请登录");
      return;
    }
    if (price == "" || number == "") {
      showMsg("请填写完整信息");
      return;
    }
    showLoading();
    final repo = GetIt.I.get<ContractRepository>();
    final formData = FormData.fromMap({
      "account_id": UserInfoManager.shared.userInfo!.defaultAccountId,
      "exchange_id": state.exchangeId,
      "client_order_id": DateTime.now().millisecondsSinceEpoch,
      "symbol_id": state.symbolId,
      "side": state.bbChooseType == BbChooseType.buy ? "buy" : "sell",
      "type": state.limitType,
      "price": price,
      "quantity": number,
    });
    final resp = repo.orderCreate(formData);
    resp.then((value) {
      showMsg("下单成功");
      orderTradeOrders();
    });
  }

  // 更新价格
  void sendPrice(String price) {
    emit(state.copyWith(price: price));
  }

  void changeLimit(int value) {
    switch (value) {
      case 0: // 限价
        emit(state.copyWith(limitType: "limit"));
        break;
      case 1: // 市价
        emit(state.copyWith(limitType: "market"));
        break;
      default:
    }
  }

  // 获取历史委托
  void orderTradeOrders() {
    emit(state.copyWith(isShowOnly: false));
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({});
    final resp = repo.orderOpenOrders(formData);
    resp.then((value) {
      emit(state.copyWith(orderList: value.data));
      dismissAllToast();
    });
  }

  // 只看当前
  onlyShowNew() {
    emit(state.copyWith(isShowOnly: true));
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({"symbol_id": state.symbolId});
    final resp = repo.orderOpenOrders(formData);
    resp.then((value) {
      emit(state.copyWith(orderList: value.data));
      dismissAllToast();
    });
  }

  //撤单
  cancelOrder(OrderModel orderModel) {
    showLoading();
    final repo = GetIt.I.get<ContractRepository>();
    final formData = FormData.fromMap({
      "client_order_id": orderModel.clientOrderId,
      "order_id": orderModel.orderId
    });
    final resp = repo.orderCancel(formData);
    resp.then((value) {
      assetsGet();
      if (state.isShowOnly ?? false) {
        onlyShowNew();
      } else {
        orderTradeOrders();
      }
    });
  }

  // 批量撤单
  orderBatchCancel() {
    showLoading();
    final repo = GetIt.I.get<ContractRepository>();
    final formData = FormData.fromMap({});
    final resp = repo.orderBatchCancel(formData);
    resp.then((value) {
      assetsGet();
      if (state.isShowOnly ?? false) {
        onlyShowNew();
      } else {
        orderTradeOrders();
      }
    });
  }

  void assetsGet() {
    if (!UserInfoManager.shared.isLogin) return;
    final repo = GetIt.I.get<UserRepository>();
    final resp = repo.assetGet();
    resp.then((value) {
      value.data.forEach((element) {
        if (element.tokenId == "USDT") {
          emit(state.copyWith(usdtNum: element.total));
        }
        emit(state.copyWith(assetsList: value.data));
      });
    });
  }

  // 获取汇率
  void getRates() {
    final repo = GetIt.I.get<PublishRepository>();
    final formData = FormData.fromMap({
      "tokens": "${state.baseTokenId},USDT",
      "legalCoins": "CNY",
    });
    final resp = repo.quoteV1Rates(formData);
    resp.then((value) {
      double res = double.parse(value.data.data[1].rates.CNY);
      emit(state.copyWith(rates: res));
    });
  }

  // 更新币对
  updateSymbol({
    required String symbolName,
    required String symbolId,
    required String baseTokenId,
    required String exchangeId,
    required String digitMerge,
  }) {
    ContractState.initialState();
    emit(state.copyWith(
        symbolName: symbolName,
        symbolId: symbolId,
        exchangeId: exchangeId,
        baseTokenId: baseTokenId,
        digitMerge: digitMerge));
    // 重新获取汇率
    getRates();
    // 重新订阅
    subscribe();
    assetsGet();
    startTickerTimer();
    showMegeDigitData();
  }

  showMegeDigitData() {
    if ((state.digitMerge ?? "").isNotEmpty) {
      List<String> digitsArray = state.digitMerge!.split(",");
      if (digitsArray.isNotEmpty) {
        emit(state.copyWith(
            digitMergeNameList: digitsArray,
            digitMergeConn: digitsArray[digitsArray.length - 1]));
      }
    }
  }

  upDataMegeDigitData(int num) {
    emit(
        state.copyWith(digitMergeConn: state.digitMergeNameList?[num] ?? "--"));
  }

  int numerName(String s) {
    if (s.isEmpty || !(s.contains("1"))) {
      return 0;
    } else {
      int dianIndex = s.contains(".") ? s.indexOf(".") : s.length;
      int yiIndex = s.indexOf("1");
      int diffValue = dianIndex - yiIndex;
      if (diffValue < 0) {
        return diffValue.abs();
      } else {
        return 0;
      }
    }
  }

  startTickerTimer() {
    if (tickerTimer != null) {
      tickerTimer?.cancel();
      tickerTimer == null;
    }
    tickerTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      schedule();
    });
    schedule(); // 立刻调用
  }

  schedule() async {
    final _repo = GetIt.I.get<QuoteRepository>();
    final resp =
        await _repo.getTicker("24h", "${state.exchangeId}.${state.symbolId}");
    final tickerModel = (resp.data.data ?? []).firstOrNull;
    if (tickerModel != null) {
      emit(state.copyWith(
        ticker: "${((tickerModel.m?.toNum() ?? 0) * 100).toStringAsFixed(2)}%",
      ));
    }
  }

  // 时间转换
  String dataTimeTran(String time) {
    if (time.isEmpty) return "";
    int timestamp = int.parse(time);
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String formattedDateTime =
        '${dateTime.year}-${_addLeadingZero(dateTime.month)}-${_addLeadingZero(dateTime.day)} ${_addLeadingZero(dateTime.hour)}:${_addLeadingZero(dateTime.minute)}:${_addLeadingZero(dateTime.second)}';
    return formattedDateTime;
  }

  String _addLeadingZero(int value) {
    return value < 10 ? '0$value' : '$value';
  }

  @override
  void subscribe() {
    WsManager.shared.openConnect().then((value) {
      cancelSubscriptions();
      final model = WsRequestModel(
        event: WsEventType.sub.value,
        topic: WsTopicType.diffDepth.value,
        symbol: "${state.exchangeId}.${state.symbolId}",
        params: const WsRequestParamsModel(
            binary: "false", org: kOrgId, limit: "10", realtimeInterval: "24h"),
      );
      final req = WsRequestAdapter(
        model: model,
        responseCallback: onWebsocketResponse,
        errorCallback: onWebsocketError,
      );
      addSubscriptionId(WsManager.shared.subscribe(req));
    });
  }

  @override
  void onWebsocketError(WsError error) {
  }

  @override
  void onWebsocketResponse(Map<String, dynamic> json) {
    final res = WsResponseModel.fromJson(
      json,
      (p0) {
        if (p0 is List) {
          final list =
              (p0 as List).map((e) => WsDiffDepthModel.fromJson(e)).toList();
          return list;
        }
        return null;
      },
    );
    final depthList = res.data;
    if (depthList == null) {
      return;
    }
    // 最多保持10个交易记录
    const countLimit = 10;
    List<List<String>?> newA = state.a ?? [];
    List<List<String>?> newB = state.a ?? [];
    for (var depthModel in depthList) {
      final remoteA = depthModel.a ?? [];
      newA = remoteA + newA;
      final remoteB = depthModel.b ?? [];
      newB = remoteB + newB;
    }

    if (newA.length - countLimit > 0) {
      newA = newA.where((element) => element![1] != "0").toList();
      newA = newA.sublist(0, countLimit);
    }
    if (newB.length - countLimit > 0) {
      newB = newB.where((element) => element![1] != "0").toList();
      newB = newB.sublist(0, countLimit);
    }
    double maxA = 0.0;
    newA.forEach((element) {
      final ea = double.tryParse(element![1]) ?? 0.0;
      //计算新的合并数量
      maxA = max(
          maxA,
          double.parse(
              ea.toStringAsFixed(numerName(state.digitMergeConn ?? ""))));
      element[0] = double.parse(element[0])
          .toStringAsFixed(numerName(state.digitMergeConn ?? ""));
    });
    double maxB = 0.0;
    newB.forEach((element) {
      final eb = double.tryParse(element![1]) ?? 0.0;
      maxB = max(maxB, eb);
      //计算新的合并数量
      maxB = max(
          maxB,
          double.parse(
              eb.toStringAsFixed(numerName(state.digitMergeConn ?? ""))));
      element[0] = double.parse(element[0])
          .toStringAsFixed(numerName(state.digitMergeConn ?? ""));
    });

    emit(state.copyWith(
      a: newA,
      aMax: maxA,
      b: newB,
      bMax: maxB,
    ));
  }

  @override
  Future<void> close() {
    cancelSubscriptions();
    return super.close();
  }

  String roundFormat3(String numStr, int len) {
    String temp = '';
    if (numStr.isEmpty) {
      return '';
    }
    try {
      double num = double.parse(numStr);

      if (num < 1000) {
        temp = _roundFormatDown(num, len).toString();
      } else if (num >= 1000 && num < 1000000) {
        temp = '${_roundFormatDown(num / 1000, len)}K';
      } else if (num >= 1000000 && num < 1000000000) {
        temp = '${_roundFormatDown(num / 1000000, len)}M';
      } else if (num >= 1000000000) {
        temp = '${_roundFormatDown(num / 1000000000, len)}B';
      }
    } catch (e) {}

    return temp;
  }

  double _roundFormatDown(double num, int len) {
    if (num.isNaN || num.isInfinite) {
      return 0.0;
    }
    num = (num * pow(10, len)).round() / pow(10, len); // 使用 pow 方法进行幂运算
    return num;
  }
}
