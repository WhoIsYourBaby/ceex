import 'package:bloc/bloc.dart';
import 'package:ceex_flutter/model/model.dart';
import 'package:ceex_flutter/repository/basic_repository.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

part 'token_info_state.dart';
part 'token_info_cubit.freezed.dart';

class TokenInfoCubit extends Cubit<TokenInfoState> {
  final String tokenId;
  final BasicRepository basicRepository = GetIt.I.get<BasicRepository>();
  TokenInfoCubit({
    required this.tokenId,
  }) : super(
          TokenInfoState.initial(),
        );

  Future requestTokenInfo() async {
    try {
      final resp = await basicRepository.tokenInfo(tokenId);
      final data = resp.data;
      emit(state.copyWith(tokenInfoModel: data));
    } catch (e) {
      showMsg("网络请求错误，请重试");
    }
  }
}
