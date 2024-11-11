// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_assets_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeAssetsState {
  AssetsInfoModel? get assetsInfo => throw _privateConstructorUsedError;
  RateModel? get rate => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AssetsInfoModel? assetsInfo, RateModel? rate)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AssetsInfoModel? assetsInfo, RateModel? rate)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AssetsInfoModel? assetsInfo, RateModel? rate)? initial,
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
  $HomeAssetsStateCopyWith<HomeAssetsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeAssetsStateCopyWith<$Res> {
  factory $HomeAssetsStateCopyWith(
          HomeAssetsState value, $Res Function(HomeAssetsState) then) =
      _$HomeAssetsStateCopyWithImpl<$Res, HomeAssetsState>;
  @useResult
  $Res call({AssetsInfoModel? assetsInfo, RateModel? rate});

  $AssetsInfoModelCopyWith<$Res>? get assetsInfo;
  $RateModelCopyWith<$Res>? get rate;
}

/// @nodoc
class _$HomeAssetsStateCopyWithImpl<$Res, $Val extends HomeAssetsState>
    implements $HomeAssetsStateCopyWith<$Res> {
  _$HomeAssetsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetsInfo = freezed,
    Object? rate = freezed,
  }) {
    return _then(_value.copyWith(
      assetsInfo: freezed == assetsInfo
          ? _value.assetsInfo
          : assetsInfo // ignore: cast_nullable_to_non_nullable
              as AssetsInfoModel?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as RateModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AssetsInfoModelCopyWith<$Res>? get assetsInfo {
    if (_value.assetsInfo == null) {
      return null;
    }

    return $AssetsInfoModelCopyWith<$Res>(_value.assetsInfo!, (value) {
      return _then(_value.copyWith(assetsInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RateModelCopyWith<$Res>? get rate {
    if (_value.rate == null) {
      return null;
    }

    return $RateModelCopyWith<$Res>(_value.rate!, (value) {
      return _then(_value.copyWith(rate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $HomeAssetsStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AssetsInfoModel? assetsInfo, RateModel? rate});

  @override
  $AssetsInfoModelCopyWith<$Res>? get assetsInfo;
  @override
  $RateModelCopyWith<$Res>? get rate;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HomeAssetsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetsInfo = freezed,
    Object? rate = freezed,
  }) {
    return _then(_$InitialImpl(
      assetsInfo: freezed == assetsInfo
          ? _value.assetsInfo
          : assetsInfo // ignore: cast_nullable_to_non_nullable
              as AssetsInfoModel?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as RateModel?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  _$InitialImpl({this.assetsInfo, this.rate});

  @override
  final AssetsInfoModel? assetsInfo;
  @override
  final RateModel? rate;

  @override
  String toString() {
    return 'HomeAssetsState.initial(assetsInfo: $assetsInfo, rate: $rate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.assetsInfo, assetsInfo) ||
                other.assetsInfo == assetsInfo) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, assetsInfo, rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AssetsInfoModel? assetsInfo, RateModel? rate)
        initial,
  }) {
    return initial(assetsInfo, rate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AssetsInfoModel? assetsInfo, RateModel? rate)? initial,
  }) {
    return initial?.call(assetsInfo, rate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AssetsInfoModel? assetsInfo, RateModel? rate)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(assetsInfo, rate);
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

abstract class _Initial implements HomeAssetsState {
  factory _Initial({final AssetsInfoModel? assetsInfo, final RateModel? rate}) =
      _$InitialImpl;

  @override
  AssetsInfoModel? get assetsInfo;
  @override
  RateModel? get rate;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
