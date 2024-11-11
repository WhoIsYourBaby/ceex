// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KlineModelImpl _$$KlineModelImplFromJson(Map<String, dynamic> json) =>
    _$KlineModelImpl(
      t: json['t'] as num?,
      s: json['s'] as String?,
      c: json['c'] as String?,
      h: json['h'] as String?,
      l: json['l'] as String?,
      o: json['o'] as String?,
      v: json['v'] as String?,
      qv: json['qv'] as String?,
      m: json['m'] as String?,
      e: json['e'] as int?,
    );

Map<String, dynamic> _$$KlineModelImplToJson(_$KlineModelImpl instance) =>
    <String, dynamic>{
      't': instance.t,
      's': instance.s,
      'c': instance.c,
      'h': instance.h,
      'l': instance.l,
      'o': instance.o,
      'v': instance.v,
      'qv': instance.qv,
      'm': instance.m,
      'e': instance.e,
    };

_$MultiKlineQueryImpl _$$MultiKlineQueryImplFromJson(
        Map<String, dynamic> json) =>
    _$MultiKlineQueryImpl(
      symbol: json['symbol'] as String?,
      exchangeId: json['exchangeId'] as num?,
      interval: json['interval'] as String?,
      limit: json['limit'] as num?,
    );

Map<String, dynamic> _$$MultiKlineQueryImplToJson(
        _$MultiKlineQueryImpl instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'exchangeId': instance.exchangeId,
      'interval': instance.interval,
      'limit': instance.limit,
    };

_$KlineQueryImpl _$$KlineQueryImplFromJson(Map<String, dynamic> json) =>
    _$KlineQueryImpl(
      symbol: json['symbol'] as String?,
      interval: json['interval'] as String?,
      limit: json['limit'] as num? ?? 300,
      realtimeInterval: json['realtimeInterval'] as String? ?? "24h",
      to: json['to'] as String?,
    );

Map<String, dynamic> _$$KlineQueryImplToJson(_$KlineQueryImpl instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'interval': instance.interval,
      'limit': instance.limit,
      'realtimeInterval': instance.realtimeInterval,
      'to': instance.to,
    };
