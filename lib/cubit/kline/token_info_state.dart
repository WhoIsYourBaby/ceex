part of 'token_info_cubit.dart';

@freezed
class TokenInfoState with _$TokenInfoState {
  
  const factory TokenInfoState.initial({
    TokenInfoModel? tokenInfoModel,
  }) = _Initial;
}
