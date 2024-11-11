// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ws_trade_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WsTradeModel _$WsTradeModelFromJson(Map<String, dynamic> json) {
  return _WsTradeModel.fromJson(json);
}

/// @nodoc
mixin _$WsTradeModel {
  /// 时间
  num? get t => throw _privateConstructorUsedError;

  /// 价格
  String? get p => throw _privateConstructorUsedError;

  /// 成交量
  String? get q => throw _privateConstructorUsedError;

  /// 是否卖true is buy, flase is sell
  bool? get m => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WsTradeModelCopyWith<WsTradeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WsTradeModelCopyWith<$Res> {
  factory $WsTradeModelCopyWith(
          WsTradeModel value, $Res Function(WsTradeModel) then) =
      _$WsTradeModelCopyWithImpl<$Res, WsTradeModel>;
  @useResult
  $Res call({num? t, String? p, String? q, bool? m});
}

/// @nodoc
class _$WsTradeModelCopyWithImpl<$Res, $Val extends WsTradeModel>
    implements $WsTradeModelCopyWith<$Res> {
  _$WsTradeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? t = freezed,
    Object? p = freezed,
    Object? q = freezed,
    Object? m = freezed,
  }) {
    return _then(_value.copyWith(
      t: freezed == t
          ? _value.t
          : t // ignore: cast_nullable_to_non_nullable
              as num?,
      p: freezed == p
          ? _value.p
          : p // ignore: cast_nullable_to_non_nullable
              as String?,
      q: freezed == q
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as String?,
      m: freezed == m
          ? _value.m
          : m // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WsTradeModelImplCopyWith<$Res>
    implements $WsTradeModelCopyWith<$Res> {
  factory _$$WsTradeModelImplCopyWith(
          _$WsTradeModelImpl value, $Res Function(_$WsTradeModelImpl) then) =
      __$$WsTradeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num? t, String? p, String? q, bool? m});
}

/// @nodoc
class __$$WsTradeModelImplCopyWithImpl<$Res>
    extends _$WsTradeModelCopyWithImpl<$Res, _$WsTradeModelImpl>
    implements _$$WsTradeModelImplCopyWith<$Res> {
  __$$WsTradeModelImplCopyWithImpl(
      _$WsTradeModelImpl _value, $Res Function(_$WsTradeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? t = freezed,
    Object? p = freezed,
    Object? q = freezed,
    Object? m = freezed,
  }) {
    return _then(_$WsTradeModelImpl(
      t: freezed == t
          ? _value.t
          : t // ignore: cast_nullable_to_non_nullable
              as num?,
      p: freezed == p
          ? _value.p
          : p // ignore: cast_nullable_to_non_nullable
              as String?,
      q: freezed == q
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as String?,
      m: freezed == m
          ? _value.m
          : m // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WsTradeModelImpl implements _WsTradeModel {
  const _$WsTradeModelImpl({this.t, this.p, this.q, this.m});

  factory _$WsTradeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WsTradeModelImplFromJson(json);

  /// 时间
  @override
  final num? t;

  /// 价格
  @override
  final String? p;

  /// 成交量
  @override
  final String? q;

  /// 是否卖true is buy, flase is sell
  @override
  final bool? m;

  @override
  String toString() {
    return 'WsTradeModel(t: $t, p: $p, q: $q, m: $m)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WsTradeModelImpl &&
            (identical(other.t, t) || other.t == t) &&
            (identical(other.p, p) || other.p == p) &&
            (identical(other.q, q) || other.q == q) &&
            (identical(other.m, m) || other.m == m));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, t, p, q, m);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WsTradeModelImplCopyWith<_$WsTradeModelImpl> get copyWith =>
      __$$WsTradeModelImplCopyWithImpl<_$WsTradeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WsTradeModelImplToJson(
      this,
    );
  }
}

abstract class _WsTradeModel implements WsTradeModel {
  const factory _WsTradeModel(
      {final num? t,
      final String? p,
      final String? q,
      final bool? m}) = _$WsTradeModelImpl;

  factory _WsTradeModel.fromJson(Map<String, dynamic> json) =
      _$WsTradeModelImpl.fromJson;

  @override

  /// 时间
  num? get t;
  @override

  /// 价格
  String? get p;
  @override

  /// 成交量
  String? get q;
  @override

  /// 是否卖true is buy, flase is sell
  bool? get m;
  @override
  @JsonKey(ignore: true)
  _$$WsTradeModelImplCopyWith<_$WsTradeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
