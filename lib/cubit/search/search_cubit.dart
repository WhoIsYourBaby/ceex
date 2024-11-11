import 'package:bloc/bloc.dart';
import 'package:ceex_flutter/model/model.dart';
import 'package:ceex_flutter/model/user/favorite_model.dart';
import 'package:ceex_flutter/repository/user_repository.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:oktoast/oktoast.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  List<SymbolModel>? fullSymbols;
  SearchCubit() : super(SearchState.initial());

  final _userRepo = GetIt.I.get<UserRepository>();

  setFullSymbols(List<SymbolModel> symbols) {
    fullSymbols = symbols;
    emit(state.copyWith(searchResults: symbols));
  }

  updateKeywords(String keywords) {
    final searchResults = (fullSymbols ?? [])
        .where(
          (element) =>
              element.symbolId
                  ?.toLowerCase()
                  .contains(keywords.toLowerCase()) ??
              false,
        )
        .toList();
    emit(state.copyWith(searchResults: searchResults));
  }

  createFavorite(String exchangeId, String symbolId) async {
    try {
      showLoading();
      await _userRepo.createFavorite(exchangeId, symbolId);
      await requestFavoriteList();
    } finally {
      dismissAllToast();
    }
  }

  cancelFavorite(String exchangeId, String symbolId) async {
    try {
      showLoading();
      await _userRepo.cancelFavorite(exchangeId, symbolId);
      await requestFavoriteList();
    } finally {
      dismissAllToast();
    }
  }

  Future requestFavoriteList() async {
    try {
      final resp = await _userRepo.favoriteList();
      final fvList = resp.data;
      emit(state.copyWith(favoriteList: fvList));
      return resp;
    } catch (e) {
      emit(state.copyWith(favoriteList: []));
    }
  }

  isSymbolStar(String symbolId) {
    return (state.favoriteList ?? [])
            .indexWhere((element) => element.symbolId == symbolId) >=
        0;
  }
}
