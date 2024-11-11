part of 'safe_center_view_cubit.dart';

@freezed
class SafeCenterViewState with _$SafeCenterViewState {
  const factory SafeCenterViewState.initial({
    UserBaseInfoModel? userBaseInfoModel,
    bool? bindGA,
    String? email,
    String? phone,
    bool? bindTradePwd, // 资金密码
    bool? bindPassword, // 登录密码
    bool? bindFinger,
    SafeLavel? safeLavel,
  }) = _Initial;
}

enum RowClickType {
  loginPassword, // 登录密码
  moneyPassword, // 资金密码
}

enum SafeLavel {
  low,
  middle,
  height,
}

enum SafeVerType {
  finger, // 指纹验证
  google, // google验证
  phone, // 手机验证
  email, // email验证
}
