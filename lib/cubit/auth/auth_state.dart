part of 'auth_cubit.dart';

enum LoginStatus {
  unknown,
  login,
  logout,
}

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.initial({
    UserBaseInfoModel? userBaseInfo,
    bool? needForceUpdate,
  }) = _Initial;

  /// 使用用户信息null来判断是否登录?
  /// 还是使用token来判断是否登录?
  /// 后续待重构
  bool isLogin() {
    return UserInfoManager.shared.isLogin;
  }

  /// userBaseInfo退出登录、登录 会经历从无到有/从有到无的状态
  bool listenerShouldChange(AuthState another) {
    return true;
    if (userBaseInfo != null && another.userBaseInfo != null) {
      return false;
    }
    return true;
  }
}
