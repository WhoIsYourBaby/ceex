// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountriesModelImpl _$$CountriesModelImplFromJson(Map<String, dynamic> json) =>
    _$CountriesModelImpl(
      id: json['id'] as String?,
      nationalCode: json['nationalCode'] as String?,
      shortName: json['shortName'] as String?,
      countryName: json['countryName'] as String?,
      indexName: json['indexName'] as String?,
      allowRegister: json['allowRegister'] as int?,
      allowLogin: json['allowLogin'] as int?,
      allowKyc: json['allowKyc'] as int?,
      allowBindMobile: json['allowBindMobile'] as int?,
    );

Map<String, dynamic> _$$CountriesModelImplToJson(
        _$CountriesModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nationalCode': instance.nationalCode,
      'shortName': instance.shortName,
      'countryName': instance.countryName,
      'indexName': instance.indexName,
      'allowRegister': instance.allowRegister,
      'allowLogin': instance.allowLogin,
      'allowKyc': instance.allowKyc,
      'allowBindMobile': instance.allowBindMobile,
    };
