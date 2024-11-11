// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_check_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyCheckModelImpl _$$VerifyCheckModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyCheckModelImpl(
      requestId: json['requestId'] as String?,
      need2FA: json['need2FA'] as bool?,
      authType: json['authType'] as String?,
    );

Map<String, dynamic> _$$VerifyCheckModelImplToJson(
        _$VerifyCheckModelImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'need2FA': instance.need2FA,
      'authType': instance.authType,
    };
