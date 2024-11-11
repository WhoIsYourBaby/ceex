part of 'market_view_cubit.dart';

@freezed
class MarketViewState with _$MarketViewState {
  const MarketViewState._();
  const factory MarketViewState.initial({
    @Default(MarketTabType.star) MarketTabType type,
    List<SymbolMarketCellModel>? coinPairList,
    List<SymbolMarketCellModel>? starList,
    @Default({}) Map<String, bool> selectMap,
  }) = _Initial;

  List<SymbolMarketCellModel> currentList() {
    if (type == MarketTabType.star) {
      return starList ?? [];
    } else {
      return coinPairList ?? [];
    }
  }
}
