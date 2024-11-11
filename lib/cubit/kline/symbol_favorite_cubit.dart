import 'package:bloc/bloc.dart';
import 'package:ceex_flutter/model/model.dart';
import 'package:ceex_flutter/repository/repository.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

part 'symbol_favorite_state.dart';
part 'symbol_favorite_cubit.freezed.dart';

class SymbolFavoriteCubit extends Cubit<SymbolFavoriteState> {
  final _repo = GetIt.I.get<UserRepository>();
  final String symbolId;
  final String exchangeId;
  List<FavoriteModel>? favoriteList;
  SymbolFavoriteCubit({
    required this.symbolId,
    required this.exchangeId,
  }) : super(SymbolFavoriteState.initial());

  refresh() async {
    try {
      final resp = await _repo.favoriteList();
      favoriteList = resp.data;
      final index =
          favoriteList?.indexWhere((element) => element.symbolId == symbolId);
      final isFav = (index ?? -1) >= 0;
      emit(state.copyWith(isFavorite: isFav));
    } catch (e) {
      showMsg(e.toString());
    }
  }

  favorite() async {
    try {
      await _repo.createFavorite(exchangeId, symbolId);
      await refresh();
    } catch (e) {
      showMsg(e.toString());
    }
  }

  unfavorite() async {
    try {
      await _repo.cancelFavorite(exchangeId, symbolId);
      await refresh();
    } catch (e) {
      showMsg(e.toString());
    }
  }
}
