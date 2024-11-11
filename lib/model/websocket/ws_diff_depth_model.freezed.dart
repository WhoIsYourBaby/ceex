// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ws_diff_depth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WsDiffDepthModel _$WsDiffDepthModelFromJson(Map<String, dynamic> json) {
  return _WsDiffDepthModel.fromJson(json);
}

/// @nodoc
mixin _$WsDiffDepthModel {
  int? get e => throw _privateConstructorUsedError;
  num? get t => throw _privateConstructorUsedError;
  String? get v => throw _privateConstructorUsedError;
  List<List<String>?>? get b => throw _privateConstructorUsedError;
  List<List<String>?>? get a => throw _privateConstructorUsedError;
  int? get o => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WsDiffDepthModelCopyWith<WsDiffDepthModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WsDiffDepthModelCopyWith<$Res> {
  factory $WsDiffDepthModelCopyWith(
          WsDiffDepthModel value, $Res Function(WsDiffDepthModel) then) =
      _$WsDiffDepthModelCopyWithImpl<$Res, WsDiffDepthModel>;
  @useResult
  $Res call(
      {int? e,
      num? t,
      String? v,
      List<List<String>?>? b,
      List<List<String>?>? a,
      int? o});
}

/// @nodoc
class _$WsDiffDepthModelCopyWithImpl<$Res, $Val extends WsDiffDepthModel>
    implements $WsDiffDepthModelCopyWith<$Res> {
  _$WsDiffDepthModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? e = freezed,
    Object? t = freezed,
    Object? v = freezed,
    Object? b = freezed,
    Object? a = freezed,
    Object? o = freezed,
  }) {
    return _then(_value.copyWith(
      e: freezed == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as int?,
      t: freezed == t
          ? _value.t
          : t // ignore: cast_nullable_to_non_nullable
              as num?,
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as String?,
      b: freezed == b
          ? _value.b
          : b // ignore: cast_nullable_to_non_nullable
              as List<List<String>?>?,
      a: freezed == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as List<List<String>?>?,
      o: freezed == o
          ? _value.o
          : o // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WsDiffDepthModelImplCopyWith<$Res>
    implements $WsDiffDepthModelCopyWith<$Res> {
  factory _$$WsDiffDepthModelImplCopyWith(_$WsDiffDepthModelImpl value,
          $Res Function(_$WsDiffDepthModelImpl) then) =
      __$$WsDiffDepthModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? e,
      num? t,
      String? v,
      List<List<String>?>? b,
      List<List<String>?>? a,
      int? o});
}

/// @nodoc
class __$$WsDiffDepthModelImplCopyWithImpl<$Res>
    extends _$WsDiffDepthModelCopyWithImpl<$Res, _$WsDiffDepthModelImpl>
    implements _$$WsDiffDepthModelImplCopyWith<$Res> {
  __$$WsDiffDepthModelImplCopyWithImpl(_$WsDiffDepthModelImpl _value,
      $Res Function(_$WsDiffDepthModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? e = freezed,
    Object? t = freezed,
    Object? v = freezed,
    Object? b = freezed,
    Object? a = freezed,
    Object? o = freezed,
  }) {
    return _then(_$WsDiffDepthModelImpl(
      e: freezed == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as int?,
      t: freezed == t
          ? _value.t
          : t // ignore: cast_nullable_to_non_nullable
              as num?,
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as String?,
      b: freezed == b
          ? _value._b
          : b // ignore: cast_nullable_to_non_nullable
              as List<List<String>?>?,
      a: freezed == a
          ? _value._a
          : a // ignore: cast_nullable_to_non_nullable
              as List<List<String>?>?,
      o: freezed == o
          ? _value.o
          : o // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WsDiffDepthModelImpl implements _WsDiffDepthModel {
  const _$WsDiffDepthModelImpl(
      {this.e,
      this.t,
      this.v,
      final List<List<String>?>? b,
      final List<List<String>?>? a,
      this.o})
      : _b = b,
        _a = a;

  factory _$WsDiffDepthModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WsDiffDepthModelImplFromJson(json);

  @override
  final int? e;
  @override
  final num? t;
  @override
  final String? v;
  final List<List<String>?>? _b;
  @override
  List<List<String>?>? get b {
    final value = _b;
    if (value == null) return null;
    if (_b is EqualUnmodifiableListView) return _b;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<List<String>?>? _a;
  @override
  List<List<String>?>? get a {
    final value = _a;
    if (value == null) return null;
    if (_a is EqualUnmodifiableListView) return _a;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? o;

  @override
  String toString() {
    return 'WsDiffDepthModel(e: $e, t: $t, v: $v, b: $b, a: $a, o: $o)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WsDiffDepthModelImpl &&
            (identical(other.e, e) || other.e == e) &&
            (identical(other.t, t) || other.t == t) &&
            (identical(other.v, v) || other.v == v) &&
            const DeepCollectionEquality().equals(other._b, _b) &&
            const DeepCollectionEquality().equals(other._a, _a) &&
            (identical(other.o, o) || other.o == o));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      e,
      t,
      v,
      const DeepCollectionEquality().hash(_b),
      const DeepCollectionEquality().hash(_a),
      o);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WsDiffDepthModelImplCopyWith<_$WsDiffDepthModelImpl> get copyWith =>
      __$$WsDiffDepthModelImplCopyWithImpl<_$WsDiffDepthModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WsDiffDepthModelImplToJson(
      this,
    );
  }
}

abstract class _WsDiffDepthModel implements WsDiffDepthModel {
  const factory _WsDiffDepthModel(
      {final int? e,
      final num? t,
      final String? v,
      final List<List<String>?>? b,
      final List<List<String>?>? a,
      final int? o}) = _$WsDiffDepthModelImpl;

  factory _WsDiffDepthModel.fromJson(Map<String, dynamic> json) =
      _$WsDiffDepthModelImpl.fromJson;

  @override
  int? get e;
  @override
  num? get t;
  @override
  String? get v;
  @override
  List<List<String>?>? get b;
  @override
  List<List<String>?>? get a;
  @override
  int? get o;
  @override
  @JsonKey(ignore: true)
  _$$WsDiffDepthModelImplCopyWith<_$WsDiffDepthModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
