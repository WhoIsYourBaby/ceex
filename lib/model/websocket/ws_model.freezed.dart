// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ws_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WsRequestModel _$WsRequestModelFromJson(Map<String, dynamic> json) {
  return _WsRequestModel.fromJson(json);
}

/// @nodoc
mixin _$WsRequestModel {
  String get id => throw _privateConstructorUsedError;
  String get event => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;
  String? get symbol => throw _privateConstructorUsedError;
  WsRequestParamsModel get params => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WsRequestModelCopyWith<WsRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WsRequestModelCopyWith<$Res> {
  factory $WsRequestModelCopyWith(
          WsRequestModel value, $Res Function(WsRequestModel) then) =
      _$WsRequestModelCopyWithImpl<$Res, WsRequestModel>;
  @useResult
  $Res call(
      {String id,
      String event,
      String topic,
      String? symbol,
      WsRequestParamsModel params});

  $WsRequestParamsModelCopyWith<$Res> get params;
}

/// @nodoc
class _$WsRequestModelCopyWithImpl<$Res, $Val extends WsRequestModel>
    implements $WsRequestModelCopyWith<$Res> {
  _$WsRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? event = null,
    Object? topic = null,
    Object? symbol = freezed,
    Object? params = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: freezed == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as WsRequestParamsModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WsRequestParamsModelCopyWith<$Res> get params {
    return $WsRequestParamsModelCopyWith<$Res>(_value.params, (value) {
      return _then(_value.copyWith(params: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WsRequestModelImplCopyWith<$Res>
    implements $WsRequestModelCopyWith<$Res> {
  factory _$$WsRequestModelImplCopyWith(_$WsRequestModelImpl value,
          $Res Function(_$WsRequestModelImpl) then) =
      __$$WsRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String event,
      String topic,
      String? symbol,
      WsRequestParamsModel params});

  @override
  $WsRequestParamsModelCopyWith<$Res> get params;
}

/// @nodoc
class __$$WsRequestModelImplCopyWithImpl<$Res>
    extends _$WsRequestModelCopyWithImpl<$Res, _$WsRequestModelImpl>
    implements _$$WsRequestModelImplCopyWith<$Res> {
  __$$WsRequestModelImplCopyWithImpl(
      _$WsRequestModelImpl _value, $Res Function(_$WsRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? event = null,
    Object? topic = null,
    Object? symbol = freezed,
    Object? params = null,
  }) {
    return _then(_$WsRequestModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: freezed == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as WsRequestParamsModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WsRequestModelImpl implements _WsRequestModel {
  const _$WsRequestModelImpl(
      {this.id = "1",
      required this.event,
      required this.topic,
      this.symbol,
      required this.params});

  factory _$WsRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WsRequestModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  final String event;
  @override
  final String topic;
  @override
  final String? symbol;
  @override
  final WsRequestParamsModel params;

  @override
  String toString() {
    return 'WsRequestModel(id: $id, event: $event, topic: $topic, symbol: $symbol, params: $params)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WsRequestModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.params, params) || other.params == params));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, event, topic, symbol, params);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WsRequestModelImplCopyWith<_$WsRequestModelImpl> get copyWith =>
      __$$WsRequestModelImplCopyWithImpl<_$WsRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WsRequestModelImplToJson(
      this,
    );
  }
}

abstract class _WsRequestModel implements WsRequestModel {
  const factory _WsRequestModel(
      {final String id,
      required final String event,
      required final String topic,
      final String? symbol,
      required final WsRequestParamsModel params}) = _$WsRequestModelImpl;

  factory _WsRequestModel.fromJson(Map<String, dynamic> json) =
      _$WsRequestModelImpl.fromJson;

  @override
  String get id;
  @override
  String get event;
  @override
  String get topic;
  @override
  String? get symbol;
  @override
  WsRequestParamsModel get params;
  @override
  @JsonKey(ignore: true)
  _$$WsRequestModelImplCopyWith<_$WsRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WsRequestParamsModel _$WsRequestParamsModelFromJson(Map<String, dynamic> json) {
  return _WsRequestParamsModel.fromJson(json);
}

/// @nodoc
mixin _$WsRequestParamsModel {
  /// 是否开启zip压缩 true/false
  String? get binary => throw _privateConstructorUsedError;
  String? get limit => throw _privateConstructorUsedError;
  String? get org => throw _privateConstructorUsedError;

  /// 1m, 5m, 15m, 30m, 1h, 2h, 4h, 6h, 12h, 1d, 1d+8, 1w, 1w+8, 1M, 1M+8
  String? get realtimeInterval => throw _privateConstructorUsedError;

  /// mergedDepth, diffMergedDepth; 合并的档位
  @JsonKey(name: "dump_scale")
  String? get dumpScale => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WsRequestParamsModelCopyWith<WsRequestParamsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WsRequestParamsModelCopyWith<$Res> {
  factory $WsRequestParamsModelCopyWith(WsRequestParamsModel value,
          $Res Function(WsRequestParamsModel) then) =
      _$WsRequestParamsModelCopyWithImpl<$Res, WsRequestParamsModel>;
  @useResult
  $Res call(
      {String? binary,
      String? limit,
      String? org,
      String? realtimeInterval,
      @JsonKey(name: "dump_scale") String? dumpScale});
}

/// @nodoc
class _$WsRequestParamsModelCopyWithImpl<$Res,
        $Val extends WsRequestParamsModel>
    implements $WsRequestParamsModelCopyWith<$Res> {
  _$WsRequestParamsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? binary = freezed,
    Object? limit = freezed,
    Object? org = freezed,
    Object? realtimeInterval = freezed,
    Object? dumpScale = freezed,
  }) {
    return _then(_value.copyWith(
      binary: freezed == binary
          ? _value.binary
          : binary // ignore: cast_nullable_to_non_nullable
              as String?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as String?,
      org: freezed == org
          ? _value.org
          : org // ignore: cast_nullable_to_non_nullable
              as String?,
      realtimeInterval: freezed == realtimeInterval
          ? _value.realtimeInterval
          : realtimeInterval // ignore: cast_nullable_to_non_nullable
              as String?,
      dumpScale: freezed == dumpScale
          ? _value.dumpScale
          : dumpScale // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WsRequestParamsModelImplCopyWith<$Res>
    implements $WsRequestParamsModelCopyWith<$Res> {
  factory _$$WsRequestParamsModelImplCopyWith(_$WsRequestParamsModelImpl value,
          $Res Function(_$WsRequestParamsModelImpl) then) =
      __$$WsRequestParamsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? binary,
      String? limit,
      String? org,
      String? realtimeInterval,
      @JsonKey(name: "dump_scale") String? dumpScale});
}

/// @nodoc
class __$$WsRequestParamsModelImplCopyWithImpl<$Res>
    extends _$WsRequestParamsModelCopyWithImpl<$Res, _$WsRequestParamsModelImpl>
    implements _$$WsRequestParamsModelImplCopyWith<$Res> {
  __$$WsRequestParamsModelImplCopyWithImpl(_$WsRequestParamsModelImpl _value,
      $Res Function(_$WsRequestParamsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? binary = freezed,
    Object? limit = freezed,
    Object? org = freezed,
    Object? realtimeInterval = freezed,
    Object? dumpScale = freezed,
  }) {
    return _then(_$WsRequestParamsModelImpl(
      binary: freezed == binary
          ? _value.binary
          : binary // ignore: cast_nullable_to_non_nullable
              as String?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as String?,
      org: freezed == org
          ? _value.org
          : org // ignore: cast_nullable_to_non_nullable
              as String?,
      realtimeInterval: freezed == realtimeInterval
          ? _value.realtimeInterval
          : realtimeInterval // ignore: cast_nullable_to_non_nullable
              as String?,
      dumpScale: freezed == dumpScale
          ? _value.dumpScale
          : dumpScale // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WsRequestParamsModelImpl implements _WsRequestParamsModel {
  const _$WsRequestParamsModelImpl(
      {this.binary,
      this.limit,
      this.org,
      this.realtimeInterval,
      @JsonKey(name: "dump_scale") this.dumpScale});

  factory _$WsRequestParamsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WsRequestParamsModelImplFromJson(json);

  /// 是否开启zip压缩 true/false
  @override
  final String? binary;
  @override
  final String? limit;
  @override
  final String? org;

  /// 1m, 5m, 15m, 30m, 1h, 2h, 4h, 6h, 12h, 1d, 1d+8, 1w, 1w+8, 1M, 1M+8
  @override
  final String? realtimeInterval;

  /// mergedDepth, diffMergedDepth; 合并的档位
  @override
  @JsonKey(name: "dump_scale")
  final String? dumpScale;

  @override
  String toString() {
    return 'WsRequestParamsModel(binary: $binary, limit: $limit, org: $org, realtimeInterval: $realtimeInterval, dumpScale: $dumpScale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WsRequestParamsModelImpl &&
            (identical(other.binary, binary) || other.binary == binary) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.org, org) || other.org == org) &&
            (identical(other.realtimeInterval, realtimeInterval) ||
                other.realtimeInterval == realtimeInterval) &&
            (identical(other.dumpScale, dumpScale) ||
                other.dumpScale == dumpScale));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, binary, limit, org, realtimeInterval, dumpScale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WsRequestParamsModelImplCopyWith<_$WsRequestParamsModelImpl>
      get copyWith =>
          __$$WsRequestParamsModelImplCopyWithImpl<_$WsRequestParamsModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WsRequestParamsModelImplToJson(
      this,
    );
  }
}

abstract class _WsRequestParamsModel implements WsRequestParamsModel {
  const factory _WsRequestParamsModel(
          {final String? binary,
          final String? limit,
          final String? org,
          final String? realtimeInterval,
          @JsonKey(name: "dump_scale") final String? dumpScale}) =
      _$WsRequestParamsModelImpl;

  factory _WsRequestParamsModel.fromJson(Map<String, dynamic> json) =
      _$WsRequestParamsModelImpl.fromJson;

  @override

  /// 是否开启zip压缩 true/false
  String? get binary;
  @override
  String? get limit;
  @override
  String? get org;
  @override

  /// 1m, 5m, 15m, 30m, 1h, 2h, 4h, 6h, 12h, 1d, 1d+8, 1w, 1w+8, 1M, 1M+8
  String? get realtimeInterval;
  @override

  /// mergedDepth, diffMergedDepth; 合并的档位
  @JsonKey(name: "dump_scale")
  String? get dumpScale;
  @override
  @JsonKey(ignore: true)
  _$$WsRequestParamsModelImplCopyWith<_$WsRequestParamsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WsResponseModel<T> _$WsResponseModelFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _WsResponseModel<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$WsResponseModel<T> {
  String? get id => throw _privateConstructorUsedError;
  String? get topic => throw _privateConstructorUsedError;
  num? get sendTime => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WsResponseModelCopyWith<T, WsResponseModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WsResponseModelCopyWith<T, $Res> {
  factory $WsResponseModelCopyWith(
          WsResponseModel<T> value, $Res Function(WsResponseModel<T>) then) =
      _$WsResponseModelCopyWithImpl<T, $Res, WsResponseModel<T>>;
  @useResult
  $Res call({String? id, String? topic, num? sendTime, T? data});
}

/// @nodoc
class _$WsResponseModelCopyWithImpl<T, $Res, $Val extends WsResponseModel<T>>
    implements $WsResponseModelCopyWith<T, $Res> {
  _$WsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? topic = freezed,
    Object? sendTime = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      sendTime: freezed == sendTime
          ? _value.sendTime
          : sendTime // ignore: cast_nullable_to_non_nullable
              as num?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WsResponseModelImplCopyWith<T, $Res>
    implements $WsResponseModelCopyWith<T, $Res> {
  factory _$$WsResponseModelImplCopyWith(_$WsResponseModelImpl<T> value,
          $Res Function(_$WsResponseModelImpl<T>) then) =
      __$$WsResponseModelImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String? id, String? topic, num? sendTime, T? data});
}

/// @nodoc
class __$$WsResponseModelImplCopyWithImpl<T, $Res>
    extends _$WsResponseModelCopyWithImpl<T, $Res, _$WsResponseModelImpl<T>>
    implements _$$WsResponseModelImplCopyWith<T, $Res> {
  __$$WsResponseModelImplCopyWithImpl(_$WsResponseModelImpl<T> _value,
      $Res Function(_$WsResponseModelImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? topic = freezed,
    Object? sendTime = freezed,
    Object? data = freezed,
  }) {
    return _then(_$WsResponseModelImpl<T>(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      sendTime: freezed == sendTime
          ? _value.sendTime
          : sendTime // ignore: cast_nullable_to_non_nullable
              as num?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$WsResponseModelImpl<T> implements _WsResponseModel<T> {
  const _$WsResponseModelImpl({this.id, this.topic, this.sendTime, this.data});

  factory _$WsResponseModelImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$WsResponseModelImplFromJson(json, fromJsonT);

  @override
  final String? id;
  @override
  final String? topic;
  @override
  final num? sendTime;
  @override
  final T? data;

  @override
  String toString() {
    return 'WsResponseModel<$T>(id: $id, topic: $topic, sendTime: $sendTime, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WsResponseModelImpl<T> &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.sendTime, sendTime) ||
                other.sendTime == sendTime) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, topic, sendTime,
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WsResponseModelImplCopyWith<T, _$WsResponseModelImpl<T>> get copyWith =>
      __$$WsResponseModelImplCopyWithImpl<T, _$WsResponseModelImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$WsResponseModelImplToJson<T>(this, toJsonT);
  }
}

abstract class _WsResponseModel<T> implements WsResponseModel<T> {
  const factory _WsResponseModel(
      {final String? id,
      final String? topic,
      final num? sendTime,
      final T? data}) = _$WsResponseModelImpl<T>;

  factory _WsResponseModel.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$WsResponseModelImpl<T>.fromJson;

  @override
  String? get id;
  @override
  String? get topic;
  @override
  num? get sendTime;
  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$WsResponseModelImplCopyWith<T, _$WsResponseModelImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
