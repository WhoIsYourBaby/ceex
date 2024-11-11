part of 'safe_ver_view_cubit.dart';

@freezed
class SafeVerViewState with _$SafeVerViewState {
  const factory SafeVerViewState.initial({
    bool? isEmailVerSent, // 是否已经发送验证码
    bool? isPhoneVerSent, // 是否已经发送验证码
    int? emailCountdown, // 邮箱验证码倒计时
    int? phoneCountdown, // 手机验证码倒计时
    String? oldEmailVerCode,// 旧邮箱输入的验证码
    String? oldPhoneVerCode,// 旧手机号输入的验证码
    String? googleVerCode,// 谷歌验证输入的验证码
    bool? hasFocus, // 是否获取焦点
    bool? showPassword, // 是否显示密码
    String? areaCode, // 区号
    String? emailOrderId, // email验证码的orderid
    String? phoneOrderId, // email验证码的orderid
    bool? changePassword, // 更改密码是否成功
    bool? bindPhoneSuccess, // 绑定手机号是否成功
    bool? needBack, // 绑定手机号是否成功
  }) = _Initial;
}
