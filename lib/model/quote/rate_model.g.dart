// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RateModelImpl _$$RateModelImplFromJson(Map<String, dynamic> json) =>
    _$RateModelImpl(
      token: json['token'] as String?,
      rates: json['rates'] == null
          ? null
          : RateMoneyModel.fromJson(json['rates'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RateModelImplToJson(_$RateModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'rates': instance.rates,
    };

_$RateMoneyModelImpl _$$RateMoneyModelImplFromJson(Map<String, dynamic> json) =>
    _$RateMoneyModelImpl(
      BTC: json['BTC'] as String?,
      USD: json['USD'] as String?,
      USDT: json['USDT'] as String?,
      CNY: json['CNY'] as String?,
    );

Map<String, dynamic> _$$RateMoneyModelImplToJson(
        _$RateMoneyModelImpl instance) =>
    <String, dynamic>{
      'BTC': instance.BTC,
      'USD': instance.USD,
      'USDT': instance.USDT,
      'CNY': instance.CNY,
    };
