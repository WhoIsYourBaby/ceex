// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_diff_depth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WsDiffDepthModelImpl _$$WsDiffDepthModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WsDiffDepthModelImpl(
      e: json['e'] as int?,
      t: json['t'] as num?,
      v: json['v'] as String?,
      b: (json['b'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>?)?.map((e) => e as String).toList())
          .toList(),
      a: (json['a'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>?)?.map((e) => e as String).toList())
          .toList(),
      o: json['o'] as int?,
    );

Map<String, dynamic> _$$WsDiffDepthModelImplToJson(
        _$WsDiffDepthModelImpl instance) =>
    <String, dynamic>{
      'e': instance.e,
      't': instance.t,
      'v': instance.v,
      'b': instance.b,
      'a': instance.a,
      'o': instance.o,
    };
