// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kline_diffdepth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$KlineDiffDepthState {
  List<List<String>?>? get a => throw _privateConstructorUsedError;
  double? get aMax => throw _privateConstructorUsedError;
  List<List<String>?>? get b => throw _privateConstructorUsedError;
  double? get bMax => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<List<String>?>? a, double? aMax,
            List<List<String>?>? b, double? bMax)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<List<String>?>? a, double? aMax,
            List<List<String>?>? b, double? bMax)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<List<String>?>? a, double? aMax,
            List<List<String>?>? b, double? bMax)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KlineDiffDepthStateCopyWith<KlineDiffDepthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KlineDiffDepthStateCopyWith<$Res> {
  factory $KlineDiffDepthStateCopyWith(
          KlineDiffDepthState value, $Res Function(KlineDiffDepthState) then) =
      _$KlineDiffDepthStateCopyWithImpl<$Res, KlineDiffDepthState>;
  @useResult
  $Res call(
      {List<List<String>?>? a,
      double? aMax,
      List<List<String>?>? b,
      double? bMax});
}

/// @nodoc
class _$KlineDiffDepthStateCopyWithImpl<$Res, $Val extends KlineDiffDepthState>
    implements $KlineDiffDepthStateCopyWith<$Res> {
  _$KlineDiffDepthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? a = freezed,
    Object? aMax = freezed,
    Object? b = freezed,
    Object? bMax = freezed,
  }) {
    return _then(_value.copyWith(
      a: freezed == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as List<List<String>?>?,
      aMax: freezed == aMax
          ? _value.aMax
          : aMax // ignore: cast_nullable_to_non_nullable
              as double?,
      b: freezed == b
          ? _value.b
          : b // ignore: cast_nullable_to_non_nullable
              as List<List<String>?>?,
      bMax: freezed == bMax
          ? _value.bMax
          : bMax // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $KlineDiffDepthStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<List<String>?>? a,
      double? aMax,
      List<List<String>?>? b,
      double? bMax});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$KlineDiffDepthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? a = freezed,
    Object? aMax = freezed,
    Object? b = freezed,
    Object? bMax = freezed,
  }) {
    return _then(_$InitialImpl(
      a: freezed == a
          ? _value._a
          : a // ignore: cast_nullable_to_non_nullable
              as List<List<String>?>?,
      aMax: freezed == aMax
          ? _value.aMax
          : aMax // ignore: cast_nullable_to_non_nullable
              as double?,
      b: freezed == b
          ? _value._b
          : b // ignore: cast_nullable_to_non_nullable
              as List<List<String>?>?,
      bMax: freezed == bMax
          ? _value.bMax
          : bMax // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {final List<List<String>?>? a,
      this.aMax,
      final List<List<String>?>? b,
      this.bMax})
      : _a = a,
        _b = b;

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
  final double? aMax;
  final List<List<String>?>? _b;
  @override
  List<List<String>?>? get b {
    final value = _b;
    if (value == null) return null;
    if (_b is EqualUnmodifiableListView) return _b;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? bMax;

  @override
  String toString() {
    return 'KlineDiffDepthState.initial(a: $a, aMax: $aMax, b: $b, bMax: $bMax)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._a, _a) &&
            (identical(other.aMax, aMax) || other.aMax == aMax) &&
            const DeepCollectionEquality().equals(other._b, _b) &&
            (identical(other.bMax, bMax) || other.bMax == bMax));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_a),
      aMax,
      const DeepCollectionEquality().hash(_b),
      bMax);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<List<String>?>? a, double? aMax,
            List<List<String>?>? b, double? bMax)
        initial,
  }) {
    return initial(a, aMax, b, bMax);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<List<String>?>? a, double? aMax,
            List<List<String>?>? b, double? bMax)?
        initial,
  }) {
    return initial?.call(a, aMax, b, bMax);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<List<String>?>? a, double? aMax,
            List<List<String>?>? b, double? bMax)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(a, aMax, b, bMax);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements KlineDiffDepthState {
  const factory _Initial(
      {final List<List<String>?>? a,
      final double? aMax,
      final List<List<String>?>? b,
      final double? bMax}) = _$InitialImpl;

  @override
  List<List<String>?>? get a;
  @override
  double? get aMax;
  @override
  List<List<String>?>? get b;
  @override
  double? get bMax;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
