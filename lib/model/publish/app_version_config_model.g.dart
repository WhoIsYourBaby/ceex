// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_version_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppVersionCongfigModelImpl _$$AppVersionCongfigModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AppVersionCongfigModelImpl(
      needUpdate: json['needUpdate'] as bool?,
      needForceUpdate: json['needForceUpdate'] as bool?,
      downloadUrl: json['downloadUrl'] as String?,
      newVersion: json['newVersion'] as String?,
    );

Map<String, dynamic> _$$AppVersionCongfigModelImplToJson(
        _$AppVersionCongfigModelImpl instance) =>
    <String, dynamic>{
      'needUpdate': instance.needUpdate,
      'needForceUpdate': instance.needForceUpdate,
      'downloadUrl': instance.downloadUrl,
      'newVersion': instance.newVersion,
    };
