part of 'replace_email_cubit.dart';

@freezed
class ReplaceEmailState with _$ReplaceEmailState {
  const factory ReplaceEmailState.initial({
    bool? isVerSent, // 是否已经发送验证码
    int? countdown, // 验证码倒计时
    bool? hasFocus, // 是否获取焦点
    bool? showPassword, // 是否显示密码
    bool? showPassword1, // 是否显示密码1
    bool? showPassword2, // 是否显示密码2
    bool? showPassword3, // 是否显示密码3
    String? areaCode, // 区号
    String? oldOrderId, // 旧orderid
    String? newOrderId, // 新orderid
    String? orderId,// 验证码的orderid
    bool? changePassword,// 验证码的orderid
    bool? bindPhoneSuccess,// 绑定手机号是否成功
  }) = _Initial;
}

// 安全中心安全验证类型
enum SafeNeedVerType{
  /// 绑定手机号
  bindPhone,
  /// 绑定邮箱
  bindEmail,
  /// 更换绑定手机
  replacePhone,
  /// 更换绑定邮箱
  replaceEmail,
  /// 更换资金密码
  moneyPassword,
}
