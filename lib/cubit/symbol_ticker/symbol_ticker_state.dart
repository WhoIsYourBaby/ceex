part of 'symbol_ticker_cubit.dart';

@freezed
class SymbolTickerState with _$SymbolTickerState {
  const factory SymbolTickerState.initial({
    KlineModel? model
  }) = _Initial;
}
