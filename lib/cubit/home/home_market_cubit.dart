import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:ceex_flutter/components/symbol_market2_cell.dart';
import 'package:ceex_flutter/repository/repository.dart';
import 'package:ceex_flutter/repository/user_repository.dart';
import 'package:ceex_flutter/utils/config.dart';
import 'package:ceex_flutter/utils/enums.dart';
import 'package:ceex_flutter/model/model.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ceex_flutter/utils/ws_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:retrofit/retrofit.dart';
part 'home_market_state.dart';
part 'home_market_cubit.freezed.dart';

class HomeMarketCubit extends Cubit<HomeMarketState> with WsResponseMixin {
  final _userRepo = GetIt.I.get<UserRepository>();
  List<SymbolModel>? symbols;
  final int limit = 6;
  int? topnId;
  int? slowBrokerId;
  final Map<String, bool> _requestMap = {};
  HomeMarketCubit({
    this.symbols,
    HomeTabType type = HomeTabType.hot,
  }) : super(HomeMarketState.initial(type: type));

  setupSymbols({
    List<SymbolModel>? allSymbols,
    List<SymbolModel>? hotSymbols,
    List<SymbolModel>? newSymbols,
  }) {
    this.symbols = allSymbols;
    final newState = state.copyWith(
      hotList: hotSymbols
          ?.sublist(0, min(limit, hotSymbols.length))
          .map((e) => SymbolMarketCellModel(symbolModel: e))
          .toList(),
      newList: newSymbols
          ?.sublist(0, min(limit, newSymbols.length))
          .map((e) => SymbolMarketCellModel(symbolModel: e))
          .toList(),
    );
    emit(newState);
    subscribe();
  }

  changeType(HomeTabType type) {
    if (type == state.type) {
      return;
    }
    final newState = state.copyWith(type: type);
    emit(newState);
    requestFavoriteList();
  }

  @override
  void subscribe() {
    if (slowBrokerId == null) {
      subscribeSlowBroker();
    }
    if (topnId == null) {
      subscribeTopN();
    }
  }

  void subscribeSlowBroker() {
    WsManager.shared.openConnect().then((value) {
      if (slowBrokerId != null) {
        cancelById(slowBrokerId!);
        slowBrokerId = null;
      }
      final model = WsRequestModel(
        event: WsEventType.sub.value,
        topic: WsTopicType.slowBroker.value,
        params: WsRequestParamsModel(
          binary: "false",
          org: kOrgId,
          realtimeInterval: "24h",
        ),
      );
      final req = WsRequestAdapter(
        model: model,
        responseCallback: onWebsocketResponse,
        errorCallback: onWebsocketError,
      );
      slowBrokerId = WsManager.shared.subscribe(req);
      addSubscriptionId(slowBrokerId!);
    });
  }

  // @override
  // void subscribe() {
  //   if (state.type == HomeTabType.star && UserInfoManager.shared.isLogin) {
  //     requestFavoriteList().then(
  //       (value) {
  //         subscribeFavorite();
  //       },
  //     );
  //   } else {
  //     subscribeTopN();
  //   }
  // }

  subscribeFavorite() {
    WsManager.shared.openConnect().then((value) {
      cancelSubscriptions();
      final fvSymbols =
          (state.favoriteList ?? []).map((e) => e.symbolId).toList().join(",");
      final model = WsRequestModel(
        event: WsEventType.sub.value,
        topic: WsTopicType.realtimes.value,
        symbol: fvSymbols,
        params: WsRequestParamsModel(
          binary: "false",
          org: kOrgId,
          realtimeInterval: "24h",
          limit: "6",
        ),
      );
      final req = WsRequestAdapter(
        model: model,
        responseCallback: onWebsocketResponse,
        errorCallback: onWebsocketError,
      );
      addSubscriptionId(WsManager.shared.subscribe(req));
    });
  }

  subscribeTopN() {
    WsManager.shared.openConnect().then((value) {
      if (topnId != null) {
        cancelById(topnId!);
        topnId = null;
      }
      final model = WsRequestModel(
        event: WsEventType.sub.value,
        topic: WsTopicType.topN.value,
        params: WsRequestParamsModel(
          binary: "false",
          org: kOrgId,
          realtimeInterval: "24h",
          limit: "${limit}",
        ),
      );
      final req = WsRequestAdapter(
        model: model,
        responseCallback: onWebsocketResponse,
        errorCallback: onWebsocketError,
      );
      topnId = WsManager.shared.subscribe(req);
      addSubscriptionId(topnId!);
    });
  }

  Future<HttpResponse<List<FavoriteModel>>?> requestFavoriteList() async {
    if (state.type == HomeTabType.star && (state.favList?.isEmpty ?? true)) {
      if (UserInfoManager.shared.isLogin) {
        final resp = await _userRepo.favoriteList();
        final fvList = resp.data;
        if (!isClosed) {
          final favSymbolds = symbols?.where((element) {
            final index =
                fvList.indexWhere((fv) => fv.symbolId == element.symbolId);
            return index >= 0;
          }).toList();
          emit(
            state.copyWith(
              favList: favSymbolds
                  ?.sublist(0, min(limit, favSymbolds.length))
                  .map((e) => SymbolMarketCellModel(symbolModel: e))
                  .toList(),
            ),
          );
        }
        return resp;
      }
    }
    return null;
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
    final topic = json["topic"];
    final klineModelList = res.data ?? [];
    List<SymbolMarketCellModel> hotList = [...(state.hotList ?? [])];
    List<SymbolMarketCellModel> favList = [...(state.favList ?? [])];
    List<SymbolMarketCellModel> newList = [...(state.newList ?? [])];
    List<SymbolMarketCellModel> topList = [...(state.topList ?? [])];

    for (var i = 0; i < klineModelList.length; i++) {
      final klModel = klineModelList[i];
      // 处理fav，已经预填充了cellModel
      if (favList.isNotEmpty) {
        favList = fillCellListKline(favList, klModel);
      }
      if (hotList.isNotEmpty) {
        hotList = fillCellListKline(hotList, klModel);
      }
      if (newList.isNotEmpty) {
        newList = fillCellListKline(newList, klModel);
      }
      // topN的list是不会预填充的，需要ws数据实时填充
      if (topic == WsTopicType.topN.value) {
        topList = fillCellListKline(topList, klModel);
      }
    }
    if (!isClosed) {
      emit(
        state.copyWith(
          favList: favList,
          hotList: hotList,
          newList: newList,
          topList: topList,
        ),
      );
    }
  }

  List<SymbolMarketCellModel> fillCellListKline(
    List<SymbolMarketCellModel> cellList,
    KlineModel klModel,
  ) {
    final indexFound =
        cellList.indexWhere((element) => element.symbol == klModel.s);
    if (indexFound >= 0) {
      final newModel = cellList[indexFound].copyWith(klineModel: klModel);
      cellList.replaceRange(indexFound, indexFound + 1, [newModel]);
    } else {
      // 不存在则添加cellModel
      if (cellList.length < limit) {
        final sbIndex = (symbols ?? [])
            .indexWhere((element) => klModel.s == element.symbolId);
        if (sbIndex >= 0) {
          final cellModel =
              SymbolMarketCellModel(symbolModel: symbols![sbIndex]);
          cellList.add(cellModel);
        }
      }
    }
    return cellList;
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
      final hotList = replaceCellListWithHistory(state.hotList ?? [], newModel);
      final topList = replaceCellListWithHistory(state.topList ?? [], newModel);
      final newList = replaceCellListWithHistory(state.newList ?? [], newModel);
      final favList = replaceCellListWithHistory(state.favList ?? [], newModel);
      _requestMap.remove(model.symbol ?? "");
      emit(state.copyWith(
        hotList: hotList,
        favList: favList,
        topList: topList,
        newList: newList,
      ));
    }, onError: (error) {
      _requestMap.remove(model.symbol ?? "");
    });
    return repo;
  }

  List<SymbolMarketCellModel> replaceCellListWithHistory(
    List<SymbolMarketCellModel> cellList,
    SymbolMarketCellModel cellModel,
  ) {
    final index =
        cellList.indexWhere((element) => element.symbol == cellModel.symbol);
    if (index >= 0) {
      // model在该list中
      final newList = [...cellList];
      newList.replaceRange(index, index + 1, [cellModel]);
      return newList;
    }
    return cellList;
  }

  @override
  void onWebsocketError(WsError error) {}

  @override
  Future<void> close() {
    cancelSubscriptions();
    topnId = null;
    slowBrokerId = null;
    return super.close();
  }
}
