import 'package:ceex_flutter/components/fkline/fkline.dart';
import 'package:ceex_flutter/model/model.dart';
import 'package:ceex_flutter/utils/config.dart';
import 'package:ceex_flutter/utils/enums.dart';
import 'package:ceex_flutter/utils/ws_manager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kline_graph_state.dart';
part 'kline_graph_cubit.freezed.dart';

/**
 * {"id":"6","symbol":"301.BTCUSDT","topic":"kline_15m","event":"sub","params":{"limit":300,"realtimeInterval":"24h","binary":true}}
 * {"id":"5","event":"sub","topic":"kline_15m","symbol":"301.ANKRUSDT","params":{"binary":"false","limit":"300","org":"6066","realtimeInterval":"24h"}}
 */
class KlineGraphCubit extends KlineBloc with WsResponseMixin {
  final String exchangeId;
  final String symbol;
  List<Market> marketList = [];
  WsKlineTime klineType = WsKlineTime.hour1;
  KlineGraphCubit({
    required this.exchangeId,
    required this.symbol,
  });
  @override
  void periodSwitch(String period) {
    cancelSubscriptions();
    final newKlineType = WsKlineTimeExt.fromValue(period);
    klineType = newKlineType;
    marketList.clear();
    subscribe();
    super.periodSwitch(period);
  }

  @override
  void initData() {
    super.initData();
  }

  @override
  void subscribe() {
    showLoadingSinkAdd(true);
    WsManager.shared.openConnect().then((value) {
      final model = WsRequestModel(
        event: WsEventType.sub.value,
        topic: topicOfType(klineType),
        symbol: "${exchangeId}.${symbol}",
        params: WsRequestParamsModel(
          binary: "false",
          org: kOrgId,
          limit: "300",
          realtimeInterval: "24h",
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
    final klineList = res.data;
    if (klineList == null) {
      return;
    }
    final newMarketList =
        klineList.reversed.map((e) => Market.fromKlineModel(e)).toList();
    showLoadingSinkAdd(false);
    if (marketList.isEmpty) {
      marketList = newMarketList;
    } else {
      final first = marketList.first;
      final last = newMarketList.last;
      if (((last.id ?? 0) - (first.id ?? 0)) < klineType.inSeconds) {
        // 新旧数据有重叠
        marketList.removeAt(0);
        marketList = newMarketList + marketList;
      } else {
        // 完全是新元素
        marketList = newMarketList + marketList;
      }
    }
    refreshAllKlineData([...marketList]);
  }

  @override
  void onWebsocketError(WsError error) {
    // TODO: implement onWebsocketError
  }

  String topicOfType(WsKlineTime type) {
    return WsTopicType.kline.value + "_" + type.value;
  }

  @override
  void dispose() {
    cancelSubscriptions();
    super.dispose();
  }
}
