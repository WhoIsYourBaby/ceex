import 'package:bloc/bloc.dart';
import 'package:ceex_flutter/utils/config.dart';
import 'package:ceex_flutter/utils/enums.dart';
import 'package:ceex_flutter/utils/ws_manager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ceex_flutter/model/model.dart';
part 'kline_trade_state.dart';
part 'kline_trade_cubit.freezed.dart';
/**
  订阅--->{"id":"15","symbol":"301.JUPUSDT","topic":"trade","event":"sub","params":{"binary":true}}
 */

class KlineTradeCubit extends Cubit<KlineTradeState> with WsResponseMixin {
  final String exchangeId;
  final String symbolId;
  KlineTradeCubit({
    required this.exchangeId,
    required this.symbolId,
  }) : super(KlineTradeState.initial());

  @override
  void subscribe() {
    final req = WsRequestAdapter(
        model: WsRequestModel(
          symbol: "${exchangeId}.${symbolId}",
          event: WsEventType.sub.value,
          topic: WsTopicType.trade.value,
          params: WsRequestParamsModel(
            binary: "false",
            org: kOrgId,
          ),
        ),
        responseCallback: onWebsocketResponse,
        errorCallback: onWebsocketError);
    addSubscriptionId(WsManager.shared.subscribe(req));
  }

  @override
  void onWebsocketResponse(Map<String, dynamic> json) {
    final res = WsResponseModel.fromJson(
      json,
      (p0) {
        if (p0 is List) {
          final list =
              (p0 as List).map((e) => WsTradeModel.fromJson(e)).toList();
          return list;
        }
        return null;
      },
    );
    final tradeList = res.data;
    if (tradeList == null) {
      return;
    }
    // 最多保持20个交易记录
    const countLimit = 20;
    final List<WsTradeModel> newList = [...(state.tradeList ?? [])];
    newList.addAll(tradeList);
    if (newList.length > countLimit) {
      final moreThanLimit = newList.length - countLimit;
      newList.removeRange(0, moreThanLimit);
    }
    emit(state.copyWith(tradeList: newList));
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
}
