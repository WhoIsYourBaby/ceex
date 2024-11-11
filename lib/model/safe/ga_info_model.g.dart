// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ga_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GAInfoModelImpl _$$GAInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$GAInfoModelImpl(
      secretKey: json['secretKey'] as String?,
      authUrl: json['authUrl'] as String?,
      qrcode: json['qrcode'] as String?,
    );

Map<String, dynamic> _$$GAInfoModelImplToJson(_$GAInfoModelImpl instance) =>
    <String, dynamic>{
      'secretKey': instance.secretKey,
      'authUrl': instance.authUrl,
      'qrcode': instance.qrcode,
    };
