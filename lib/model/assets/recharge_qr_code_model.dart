import "package:freezed_annotation/freezed_annotation.dart";
import "package:flutter/foundation.dart";

part "recharge_qr_code_model.freezed.dart";
part "recharge_qr_code_model.g.dart";

@freezed
class RechargeQrCodeModel with _$RechargeQrCodeModel {
  const factory RechargeQrCodeModel({
    bool? allowDeposit,
    String? address,// 充币地址
    String? addressExt,
    String? qrcode, // 二维码base64编码
    String? minQuantity,// 最小充币入账数量
    bool? isEOS,
    int? requiredConfirmNum,//需要的网络确认数
    int? canWithdrawConfirmNum,// 提笔网络确认数
    String? tokenType,// token 类型
  }) = _RechargeQrCodeModel;

  factory RechargeQrCodeModel.fromJson(Map<String, Object?> json) =>
      _$RechargeQrCodeModelFromJson(json);
}