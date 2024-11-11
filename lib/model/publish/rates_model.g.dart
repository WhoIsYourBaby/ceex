// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rates_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RatesModelImpl _$$RatesModelImplFromJson(Map<String, dynamic> json) =>
    _$RatesModelImpl(
      code: json['code'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => DataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RatesModelImplToJson(_$RatesModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

_$DataModelImpl _$$DataModelImplFromJson(Map<String, dynamic> json) =>
    _$DataModelImpl(
      token: json['token'] as String,
      rates: RatesDataModel.fromJson(json['rates'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataModelImplToJson(_$DataModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'rates': instance.rates,
    };

_$RatesDataModelImpl _$$RatesDataModelImplFromJson(Map<String, dynamic> json) =>
    _$RatesDataModelImpl(
      CNY: json['CNY'] as String,
    );

Map<String, dynamic> _$$RatesDataModelImplToJson(
        _$RatesDataModelImpl instance) =>
    <String, dynamic>{
      'CNY': instance.CNY,
    };
