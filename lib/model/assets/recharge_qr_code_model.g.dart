// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recharge_qr_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RechargeQrCodeModelImpl _$$RechargeQrCodeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RechargeQrCodeModelImpl(
      allowDeposit: json['allowDeposit'] as bool?,
      address: json['address'] as String?,
      addressExt: json['addressExt'] as String?,
      qrcode: json['qrcode'] as String?,
      minQuantity: json['minQuantity'] as String?,
      isEOS: json['isEOS'] as bool?,
      requiredConfirmNum: json['requiredConfirmNum'] as int?,
      canWithdrawConfirmNum: json['canWithdrawConfirmNum'] as int?,
      tokenType: json['tokenType'] as String?,
    );

Map<String, dynamic> _$$RechargeQrCodeModelImplToJson(
        _$RechargeQrCodeModelImpl instance) =>
    <String, dynamic>{
      'allowDeposit': instance.allowDeposit,
      'address': instance.address,
      'addressExt': instance.addressExt,
      'qrcode': instance.qrcode,
      'minQuantity': instance.minQuantity,
      'isEOS': instance.isEOS,
      'requiredConfirmNum': instance.requiredConfirmNum,
      'canWithdrawConfirmNum': instance.canWithdrawConfirmNum,
      'tokenType': instance.tokenType,
    };
