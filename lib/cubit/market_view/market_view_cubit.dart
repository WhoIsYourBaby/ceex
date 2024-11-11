import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ceex_flutter/components/symbol_market2_cell.dart';
import 'package:ceex_flutter/model/model.dart';
import 'package:ceex_flutter/repository/repository.dart';
import 'package:ceex_flutter/utils/config.dart';
import 'package:ceex_flutter/utils/enums.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/utils/ws_manager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:oktoast/oktoast.dart';

part 'market_view_state.dart';
part 'market_view_cubit.freezed.dart';

enum MarketTabType {
  // 自选
  star,
  // 币币
  coinPair,
}

class MarketViewCubit extends Cubit<MarketViewState> with WsResponseMixin {
  MarketViewCubit() : super(MarketViewState.initial());

  final _repo = GetIt.I.get<UserRepository>();
  final Map<String, bool> _requestMap = {};

  List<SymbolModel>? storedSymbols;

  @override
  void subscribe() {
    cancelSubscriptions();
    if (storedSymbols == null) {
      return;
    }
    final symbolString = storedSymbols!
        .map((e) => "${e.exchangeId}.${e.symbolId}")
        .toList()
        .join(",");
    final reqModel = WsRequestModel(
      event: WsEventType.sub.value,
      topic: WsTopicType.realtimes.value,
      symbol: symbolString,
      params: const WsRequestParamsModel(
        binary: "false",
        org: kOrgId,
        realtimeInterval: "24h",
        limit: "300",
      ),
    );
    final req = WsRequestAdapter(
      model: reqModel,
      responseCallback: onWebsocketResponse,
      errorCallback: onWebsocketError,
    );
    addSubscriptionId(WsManager.shared.subscribe(req));
  }

  @override
  void onWebsocketResponse(Map<String, dynamic> json) {
    final res = WsResponseModel.fromJson(
      json,
      (p0) {
        if (p0 is List) {
          final list = (p0 as List).map((e) => KlineModel.fromJson(e)).toList();
          return list;
        }
        return null;
      },
    );
    final klineList = res.data ?? [];
    if (klineList.isEmpty) {
      return;
    }
    final starList = fillTypeList(klineList, state.starList ?? []);
    final coinPairList = fillTypeList(klineList, state.coinPairList ?? []);
    emit(state.copyWith(
      starList: starList,
      coinPairList: coinPairList,
    ));
  }

  @override
  void onWebsocketError(WsError error) {
    // TODO: implement onWebsocketError
  }

  @override
  Future<void> close() {
    cancelSubscriptions();
    return super.close();
  }

  setup(
    List<SymbolModel> starSymbols,
    List<SymbolModel> coinPairSymbols,
  ) {
    // 保留原有kline
    final starCellModels = starSymbols.map((e) {
      late SymbolMarketCellModel smModel;
      final klIndex = state.starList?.indexWhere(
              (element) => element.symbolModel?.baseTokenId == e.baseTokenId) ??
          -1;
      if (klIndex >= 0) {
        smModel = SymbolMarketCellModel(
          symbolModel: e,
          klineModel: state.starList![klIndex].klineModel,
        );
      } else {
        smModel = SymbolMarketCellModel(
          symbolModel: e,
        );
      }
      return smModel;
    }).toList();
    final coinPairCellModels = coinPairSymbols.map((e) {
      late SymbolMarketCellModel smModel;
      final klIndex = state.coinPairList?.indexWhere(
              (element) => element.symbolModel?.baseTokenId == e.baseTokenId) ??
          -1;
      if (klIndex >= 0) {
        smModel = SymbolMarketCellModel(
          symbolModel: e,
          klineModel: state.coinPairList![klIndex].klineModel,
        );
      } else {
        smModel = SymbolMarketCellModel(
          symbolModel: e,
        );
      }
      return smModel;
    }).toList();
    emit(
      state.copyWith(
        starList: starCellModels,
        coinPairList: coinPairCellModels,
      ),
    );

    storedSymbols = starSymbols + coinPairSymbols;
    subscribe();
  }

  // v2
  selectType(MarketTabType type) {
    emit(state.copyWith(type: type));
  }

  List<SymbolMarketCellModel> fillTypeList(
    List<KlineModel> klineList,
    List<SymbolMarketCellModel> originList,
  ) {
    final targetList = [...originList];
    for (var i = 0; i < klineList.length; i++) {
      final kline = klineList[i];
      final targetIndex = targetList.indexWhere(
        (element) => element.symbol == kline.s,
      );
      if (targetIndex >= 0) {
        final target = targetList[targetIndex];
        targetList.replaceRange(
          targetIndex,
          targetIndex + 1,
          [target.copyWith(klineModel: kline)],
        );
      }
    }
    return targetList;
  }

  selectSymbol(String symbol, bool isSelect) {
    final newMap = {...state.selectMap};
    newMap[symbol] = isSelect;
    emit(state.copyWith(selectMap: newMap));
  }

  Future deleteSelectSymbols() async {
    try {
      showLoading();
      final list = state.starList
          ?.where((element) => state.selectMap[element.symbol] != true)
          .map((e) => {
                "symbolId": e.symbol,
                "exchangeId": e.exchangeId,
              })
          .toList();
      final jsonStr = json.encode(list);
      await _repo.sortFavorite(jsonStr);
      final newStarList = state.starList
          ?.where((element) => state.selectMap[element.symbol] != true)
          .toList();
      emit(state.copyWith(starList: newStarList));
      dismissAllToast();
    } catch (e) {
      showMsg(e.toString());
    }
  }

  Future requestHistory(SymbolMarketCellModel model) async {
    final isRequesting = _requestMap[model.symbol ?? ""] ?? false;
    if (model.history != null || isRequesting) {
      return;
    }
    _requestMap[model.symbol ?? ""] = true;
    final repo = GetIt.I.get<QuoteRepository>();
    repo
        .getKlines(
      KlineQuery(
        symbol: "${model.exchangeId}.${model.symbol}",
        interval: "4h",
        limit: 24,
        to: DateTime.now()
            .subtract(Duration(days: 2))
            .millisecondsSinceEpoch
            .toString(),
      ),
    )
        .then((value) {
      final newModel = model.copyWith(history: value.data.data);
      final index = state.coinPairList?.indexWhere((element) => element.symbol == model.symbol) ?? -1;
      if (index >= 0) {
        // model在coinPair
        final newList = [...state.coinPairList!];
        newList.replaceRange(index, index + 1, [newModel]);
        emit(state.copyWith(coinPairList: newList));
      }
      final starIndex = state.starList?.indexWhere((element) => element.symbol == model.symbol) ?? -1;
      if (starIndex >= 0) {
        // model在coinPair
        final newList = [...state.starList!];
        newList.replaceRange(starIndex, starIndex + 1, [newModel]);
        emit(state.copyWith(starList: newList));
      }
      _requestMap.remove(model.symbol ?? "");
    }, onError: (error) {
      _requestMap.remove(model.symbol ?? "");
    });
    return repo;
  }
}
