part of 'home_market_cubit.dart';

@freezed
class HomeMarketState with _$HomeMarketState {
  const HomeMarketState._();
  const factory HomeMarketState.initial({
    required HomeTabType type,
    List<KlineModel>? marketList,
    List<FavoriteModel>? favoriteList,
    List<KlineModel>? favoriteMarketList,

    // 收藏
    List<SymbolMarketCellModel>? favList,
    // 热门
    List<SymbolMarketCellModel>? hotList,
    // 涨幅
    List<SymbolMarketCellModel>? topList,
    // 新币
    List<SymbolMarketCellModel>? newList,
  }) = _Initial;

  List<SymbolMarketCellModel>? currentCellList() {
    switch (type) {
      case HomeTabType.star:
        return favList;
      case HomeTabType.hot:
        return hotList;
      case HomeTabType.top:
        return topList;
      case HomeTabType.newc:
        return newList;
    }
  }
}
