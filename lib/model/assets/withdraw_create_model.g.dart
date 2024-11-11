// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_create_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WithdrawCreateModelImpl _$$WithdrawCreateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WithdrawCreateModelImpl(
      requestId: json['requestId'] as String?,
      addressIsUserId: json['addressIsUserId'] as bool?,
      codeOrderId: json['codeOrderId'] as String?,
      timeLeft: json['timeLeft'] as String?,
      needCheckIdCardNo: json['needCheckIdCardNo'] as bool?,
      allowWithdraw: json['allowWithdraw'] as bool?,
      refuseReason: json['refuseReason'] as String?,
    );

Map<String, dynamic> _$$WithdrawCreateModelImplToJson(
        _$WithdrawCreateModelImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'addressIsUserId': instance.addressIsUserId,
      'codeOrderId': instance.codeOrderId,
      'timeLeft': instance.timeLeft,
      'needCheckIdCardNo': instance.needCheckIdCardNo,
      'allowWithdraw': instance.allowWithdraw,
      'refuseReason': instance.refuseReason,
    };
