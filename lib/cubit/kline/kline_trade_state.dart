part of 'kline_trade_cubit.dart';

@freezed
class KlineTradeState with _$KlineTradeState {
  const factory KlineTradeState.initial({
    List<WsTradeModel>? tradeList,
  }) = _Initial;
}
