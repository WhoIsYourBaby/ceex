part of 'verify_second_cubit.dart';

@freezed
class VerifySecondState with _$VerifySecondState {
  // final bool hasFocus; // 是否获取焦点
  // final String orderId; // 验证码order_id
  // final bool verSuccess; // 验证成功
  // VerifySecondState({
  //   this.hasFocus = false,
  //   this.orderId = "",
  //   this.verSuccess = false,
  // });

  const factory VerifySecondState.initial({
    VerifyType? verifyType,
    // bool hasFocus = false,
    // bool verSuccess,
    // String orderId,

  }) = _Initial;
}

enum VerifyType {
  // 登录验证
  loginEmail,
  loginPhone,
  loginGoogle,
  // 添加提笔地址验证
  addAddressEmail,
  addAddressPhone,
  addAddressGoogle,
}
