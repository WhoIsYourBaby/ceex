import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:ceex_flutter/cubit/contract/contract_state.dart';
import 'package:ceex_flutter/model/appconfig/symbol_model.dart';
import 'package:ceex_flutter/model/contract/contract_entrust_model.dart';
import 'package:ceex_flutter/model/order/order_model.dart';
import 'package:ceex_flutter/model/user/user_account_money_model.dart';
import 'package:ceex_flutter/model/websocket/ws_diff_depth_model.dart';
import 'package:ceex_flutter/model/websocket/ws_model.dart';
import 'package:ceex_flutter/repository/repository.dart';
import 'package:ceex_flutter/utils/config.dart';
import 'package:ceex_flutter/utils/enums.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:ceex_flutter/utils/ws_manager.dart';
import 'package:ceex_flutter/views/kline/kline_view.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:oktoast/oktoast.dart';
import 'package:ceex_flutter/utils/ext.dart';

part 'contract_view_state.dart';
part 'contract_view_cubit.freezed.dart';

class ContractViewCubit extends Cubit<ContractViewState> with WsResponseMixin {
  ContractViewCubit()
      : super(const ContractViewState.initial(
            ticker: "--", limitType: "limit", changePrice: false));

  Timer? tickerTimer;
  List<String> digitMergeNameList = [];
  List<TokenModel> tokenModeList = [];

  initView(List<SymbolModel> list, String symbolId,
      {KlineViewParams? klineViewParams,
      List<TokenModel>? tokenModel,
      required BbChooseType contractViewType}) {
    if ((tokenModel ?? []).isNotEmpty) {
      tokenModeList = tokenModel!;
    }
    if (list.isNotEmpty) {
      if (symbolId.isEmpty) {
        SymbolModel symbolModel = list[0];
        updateSymbol(
          symbolName:
              "${symbolModel.baseTokenName ?? ""}/${symbolModel.quoteTokenName ?? ""}",
          symbolId: symbolModel.symbolId ?? "",
          baseTokenId: symbolModel.baseTokenId ?? "",
          digitMerge: symbolModel.digitMerge ?? "",
          exchangeId: symbolModel.exchangeId ?? "",
          minPricePrecision: symbolModel.minPricePrecision ?? "",
          quotePrecision: symbolModel.quotePrecision ?? "",
          minTradeQuantity: symbolModel.minTradeQuantity ?? "",
          minTradeAmount: symbolModel.minTradeAmount ?? "",
          basePrecision: symbolModel.basePrecision ?? "",
        );
      } else {
        SymbolModel symbolModel =
            list.firstWhere((element) => element.symbolId == symbolId);
        updateSymbol(
          symbolName:
              "${symbolModel.baseTokenName ?? ""}/${symbolModel.quoteTokenName ?? ""}",
          symbolId: symbolModel.symbolId ?? "",
          baseTokenId: symbolModel.baseTokenId ?? "",
          digitMerge: symbolModel.digitMerge ?? "",
          exchangeId: symbolModel.exchangeId ?? "",
          minPricePrecision: symbolModel.minPricePrecision ?? "",
          quotePrecision: symbolModel.quotePrecision ?? "",
          minTradeQuantity: symbolModel.minTradeQuantity ?? "",
          minTradeAmount: symbolModel.minTradeAmount ?? "",
          basePrecision: symbolModel.basePrecision ?? "",
        );
      }
      emit(state.copyWith(bbChooseType: contractViewType, limitType: "limit"));
      scheduleDepth();
      orderTradeOrders();
      orderHistoryTradeOrders();
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
    if (state.limitType == "limit" && price.isEmpty) {
      showMsg("请输入价格");
      return;
    }
    if (number.isEmpty) {
      showMsg("请输入数量");
      return;
    }
    if (state.limitType == "limit" && price == "0") {
      showMsg("请输入正确的价格");
      return;
    }
    if (number == "0") {
      showMsg("请输入正确的数量");
      return;
    }
    if (double.parse(number) < double.parse(state.minTradeQuantity ?? "0")) {
      showMsg("交易不能低于${state.minTradeQuantity}${state.baseTokenId}");
      return;
    }
    if (state.isBuyIng ?? false) {
      return;
    }
    showLoading();
    emit(state.copyWith(isBuyIng: true));
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
      Future.delayed(Duration(milliseconds: 1000), () {
        dismissAllToast();
        assetsGet();
        orderTradeOrders();
        orderHistoryTradeOrders();
        showMsg("下单成功");
        emit(state.copyWith(needRefreshData: true, isBuyIng: false));
      });
    });
  }

  // 更新价格
  void sendPrice(String price) {
    emit(state.copyWith(changePrice: true));
    if (price.isNotEmpty && double.parse(price) < 0) {
      emit(state.copyWith(price: "0"));
      emit(state.copyWith(changePrice: false));
    } else {
      emit(state.copyWith(price: price));
      emit(state.copyWith(changePrice: false));
    }
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

  // 获取委托
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

  // 只看历史当前
  onlyShowHistoryNew() {
    emit(state.copyWith(isShowHistoryOnly: true));
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({"symbol_id": state.symbolId});
    final resp = repo.orderTradeOrders(formData);
    resp.then((value) {
      emit(state.copyWith(historyOrderList: value.data));
      dismissAllToast();
    });
  }

  // 获取历史委托
  void orderHistoryTradeOrders() {
    showLoading();
    emit(state.copyWith(isShowHistoryOnly: false));
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({});
    final resp = repo.orderTradeOrders(formData);
    resp.then((value) {
      emit(state.copyWith(historyOrderList: value.data));
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
      if (state.isShowHistoryOnly ?? false) {
        onlyShowHistoryNew();
      } else {
        orderHistoryTradeOrders();
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
      if (state.isShowHistoryOnly ?? false) {
        onlyShowHistoryNew();
      } else {
        orderHistoryTradeOrders();
      }
    });
  }

  void assetsGet() {
    if (!UserInfoManager.shared.isLogin) return;
    final repo = GetIt.I.get<UserRepository>();
    final resp = repo.assetGet();
    resp.then((value) {
      List<UserAccountMoneyModel> assetsList = [];
      List<UserAccountMoneyModel> assetsListFinal = [];
      Set<String> tokenIds = {}; // 存储 model 中的 Token ID
      value.data.forEach((element) async {
        if (element.tokenId == "USDT") {
          emit(state.copyWith(usdtNum: element.free));
          assetsList.add(element);
        }
        if (element.tokenId == state.baseTokenId) {
          emit(state.copyWith(baseTokenNum: element.free));
          assetsList.add(element);
        }
      });
      tokenModeList.forEach((element) {
        tokenIds.add(element.tokenId ?? "");
      });
      assetsList.forEach((element) {
        if (tokenIds.contains(element.tokenId)) {
          TokenModel tokenModel = tokenModeList.firstWhere(
            (modelElement) => modelElement.tokenId == element.tokenId,
          );
          assetsListFinal.add(element.copyWith(
              iconUrl: tokenModel.iconUrl,
              quotePrecision: "-1",
              tokenFullName: tokenModel.tokenFullName));
        }
      });
      emit(state.copyWith(assetsList: assetsListFinal));
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
    required String minPricePrecision,
    required String quotePrecision,
    required String minTradeQuantity,
    required String minTradeAmount,
    required String basePrecision,
  }) {
    ContractState.initialState();
    emit(state.copyWith(
      symbolName: symbolName,
      ticker: "--",
      symbolId: symbolId,
      exchangeId: exchangeId,
      baseTokenId: baseTokenId,
      digitMerge: digitMerge,
      minPricePrecision: minPricePrecision,
      quotePrecision: quotePrecision,
      minTradeQuantity: minTradeQuantity,
      minTradeAmount: minTradeAmount,
      basePrecision: basePrecision,
      marketPrice: "",
      price: "0",
      a: [],
      b: [],
      usdtNum: "0",
      baseTokenNum: "0",
    ));
    getRates();
    subscribe();
    assetsGet();
    schedule();
    scheduleDepth();
    showMegeDigitData();
    orderTradeOrders();
    orderHistoryTradeOrders();
  }

  needRefreshData(bool needRefreshData) {
    emit(state.copyWith(needRefreshData: needRefreshData));
  }

  // 展示小数位
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
    subscribe();
    scheduleDepth();
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

  String formatNumber(double number, int fractionDigits) {
    NumberFormat formatter = NumberFormat('0.' + '0' * fractionDigits);
    return formatter.format(number);
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

  scheduleDepth() async {
    final repo = GetIt.I.get<QuoteRepository>();
    final resp = await repo.getDepth(
      numerName(state.digitMergeConn ?? "0").toString(),
      20,
      "${state.exchangeId}.${state.symbolId}",
    );
    if ((resp.data.data?.length ?? 0) == 0) {
      return;
    }
    final depthModel = resp.data.data![0];
    const countLimit = 6;
    List<List<String>?> newA = depthModel.a ?? [];
    List<List<String>?> newB = depthModel.b ?? [];
    newA = newA.sublist(0, min(countLimit, newA.length));
    newA.sort((a, b) => double.parse(b![0]).compareTo(double.parse(a![0])));
    newB = newB.sublist(0, min(countLimit, newB.length));

    double maxA = 0.0;
    newA.forEach((element) {
      final ea = double.tryParse(element![1]) ?? 0.0;
      maxA = max(maxA, ea);
    });
    double maxB = 0.0;
    newB.forEach((element) {
      final eb = double.tryParse(element![1]) ?? 0.0;
      maxB = max(maxB, eb);
    });
    String maeketPrice = newA[newA.length - 1]?[0] ?? "0";
    emit(state.copyWith(
      a: newA,
      aMax: maxA,
      b: newB,
      bMax: maxB,
      marketPrice: maeketPrice,
    ));
  }

  @override
  void subscribe() {
    if (tickerTimer != null) {
      tickerTimer?.cancel();
      tickerTimer == null;
    }
    tickerTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      schedule();
      scheduleDepth();
    });
  }

  @override
  void onWebsocketError(WsError error) {
    // TODO: implement onWebsocketError
  }

  @override
  void onWebsocketResponse(Map<String, dynamic> json) {}

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

      if (num < 10000) {
        temp = _roundFormatDown(num, len).toString();
      } else if (num >= 10000 && num < 1000000) {
        temp = '${_roundFormatDown(num / 1000, len)}K';
      } else if (num >= 1000000 && num < 10000000) {
        temp = '${_roundFormatDown(num / 1000000, len)}M';
      } else if (num >= 100000000) {
        temp = '${_roundFormatDown(num / 100000000, len)}B';
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

  String handVolumeLength(String amountStr, int defaultDigit) {
    if (amountStr == null || amountStr.isEmpty) {
      return "0";
    } else {
      double amount = double.tryParse(amountStr) ?? 0.0;

      if (amount > 1000000000) {
        double result = amount / 1000000000;
        int digit = getBookVolumeDigit(result.toString(), defaultDigit, "B");
        return roundFormat(result, digit) + "B";
      }
      if (amount > 1000000) {
        double result = amount / 1000000;
        int digit = getBookVolumeDigit(result.toString(), defaultDigit, "M");
        return roundFormat(result, digit) + "M";
      }
      if (amount > 100000) {
        double result = amount / 1000;
        int digit = getBookVolumeDigit(result.toString(), defaultDigit, "K");
        return roundFormat(result, digit) + "K";
      }
      int digit = getBookVolumeDigit(amountStr, defaultDigit, "");
      return roundFormat(amount, digit);
    }
  }

  int getBookVolumeDigit(String amountStr, int defaultDigit, String unit) {
    int digit = defaultDigit;
    double amount = double.tryParse(amountStr) ?? 0.0;

    if (amount >= 10000) {
      digit = 0;
    } else if (amount >= 1000) {
      digit = 1;
    } else if (amount >= 100) {
      digit = 2;
    } else if (amount >= 10) {
      digit = 3;
    } else if (amount >= 1) {
      digit = 4;
    } else if (amount >= 0.1) {
      digit = 5;
    } else if (amount >= 0.01) {
      digit = 6;
    }

    if (unit == null || unit.isEmpty) {
      if (digit > defaultDigit) {
        digit = defaultDigit;
      }
    }

    return digit;
  }

  String roundFormat(double value, int digit) {
    return value.toStringAsFixed(digit);
  }
}
