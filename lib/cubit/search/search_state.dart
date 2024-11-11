part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial({
    List<SymbolModel>? searchResults,
    List<FavoriteModel>? favoriteList,
  }) = _Initial;
}
