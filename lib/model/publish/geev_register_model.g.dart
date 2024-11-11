// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geev_register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeevRegisterModelImpl _$$GeevRegisterModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GeevRegisterModelImpl(
      success: json['success'] as int?,
      new_captcha: json['new_captcha'] as bool?,
      challenge: json['challenge'] as String?,
      gt: json['gt'] as String?,
    );

Map<String, dynamic> _$$GeevRegisterModelImplToJson(
        _$GeevRegisterModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'new_captcha': instance.new_captcha,
      'challenge': instance.challenge,
      'gt': instance.gt,
    };
