// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WsRequestModelImpl _$$WsRequestModelImplFromJson(Map<String, dynamic> json) =>
    _$WsRequestModelImpl(
      id: json['id'] as String? ?? "1",
      event: json['event'] as String,
      topic: json['topic'] as String,
      symbol: json['symbol'] as String?,
      params:
          WsRequestParamsModel.fromJson(json['params'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WsRequestModelImplToJson(
        _$WsRequestModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'event': instance.event,
      'topic': instance.topic,
      'symbol': instance.symbol,
      'params': instance.params,
    };

_$WsRequestParamsModelImpl _$$WsRequestParamsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WsRequestParamsModelImpl(
      binary: json['binary'] as String?,
      limit: json['limit'] as String?,
      org: json['org'] as String?,
      realtimeInterval: json['realtimeInterval'] as String?,
      dumpScale: json['dump_scale'] as String?,
    );

Map<String, dynamic> _$$WsRequestParamsModelImplToJson(
        _$WsRequestParamsModelImpl instance) =>
    <String, dynamic>{
      'binary': instance.binary,
      'limit': instance.limit,
      'org': instance.org,
      'realtimeInterval': instance.realtimeInterval,
      'dump_scale': instance.dumpScale,
    };

_$WsResponseModelImpl<T> _$$WsResponseModelImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$WsResponseModelImpl<T>(
      id: json['id'] as String?,
      topic: json['topic'] as String?,
      sendTime: json['sendTime'] as num?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$$WsResponseModelImplToJson<T>(
  _$WsResponseModelImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'id': instance.id,
      'topic': instance.topic,
      'sendTime': instance.sendTime,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
