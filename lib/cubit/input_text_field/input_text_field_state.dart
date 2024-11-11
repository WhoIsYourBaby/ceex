part of 'input_text_field_cubit.dart';

@freezed
class InputTextFieldState with _$InputTextFieldState {
  const factory InputTextFieldState.initial({
    bool? isVerSent, // 是否已经发送验证码
    int? countdown, // 验证码倒计时
    bool? hasFocus, // 是否获取焦点
    bool? showPassword, // 是否显示密码
  }) = _Initial;
}
