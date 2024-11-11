// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  UserBaseInfoModel? get userBaseInfo => throw _privateConstructorUsedError;
  bool? get needForceUpdate => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            UserBaseInfoModel? userBaseInfo, bool? needForceUpdate)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserBaseInfoModel? userBaseInfo, bool? needForceUpdate)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserBaseInfoModel? userBaseInfo, bool? needForceUpdate)?
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
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call({UserBaseInfoModel? userBaseInfo, bool? needForceUpdate});

  $UserBaseInfoModelCopyWith<$Res>? get userBaseInfo;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userBaseInfo = freezed,
    Object? needForceUpdate = freezed,
  }) {
    return _then(_value.copyWith(
      userBaseInfo: freezed == userBaseInfo
          ? _value.userBaseInfo
          : userBaseInfo // ignore: cast_nullable_to_non_nullable
              as UserBaseInfoModel?,
      needForceUpdate: freezed == needForceUpdate
          ? _value.needForceUpdate
          : needForceUpdate // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserBaseInfoModelCopyWith<$Res>? get userBaseInfo {
    if (_value.userBaseInfo == null) {
      return null;
    }

    return $UserBaseInfoModelCopyWith<$Res>(_value.userBaseInfo!, (value) {
      return _then(_value.copyWith(userBaseInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserBaseInfoModel? userBaseInfo, bool? needForceUpdate});

  @override
  $UserBaseInfoModelCopyWith<$Res>? get userBaseInfo;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userBaseInfo = freezed,
    Object? needForceUpdate = freezed,
  }) {
    return _then(_$InitialImpl(
      userBaseInfo: freezed == userBaseInfo
          ? _value.userBaseInfo
          : userBaseInfo // ignore: cast_nullable_to_non_nullable
              as UserBaseInfoModel?,
      needForceUpdate: freezed == needForceUpdate
          ? _value.needForceUpdate
          : needForceUpdate // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl({this.userBaseInfo, this.needForceUpdate}) : super._();

  @override
  final UserBaseInfoModel? userBaseInfo;
  @override
  final bool? needForceUpdate;

  @override
  String toString() {
    return 'AuthState.initial(userBaseInfo: $userBaseInfo, needForceUpdate: $needForceUpdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.userBaseInfo, userBaseInfo) ||
                other.userBaseInfo == userBaseInfo) &&
            (identical(other.needForceUpdate, needForceUpdate) ||
                other.needForceUpdate == needForceUpdate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userBaseInfo, needForceUpdate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            UserBaseInfoModel? userBaseInfo, bool? needForceUpdate)
        initial,
  }) {
    return initial(userBaseInfo, needForceUpdate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserBaseInfoModel? userBaseInfo, bool? needForceUpdate)?
        initial,
  }) {
    return initial?.call(userBaseInfo, needForceUpdate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserBaseInfoModel? userBaseInfo, bool? needForceUpdate)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(userBaseInfo, needForceUpdate);
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

abstract class _Initial extends AuthState {
  const factory _Initial(
      {final UserBaseInfoModel? userBaseInfo,
      final bool? needForceUpdate}) = _$InitialImpl;
  const _Initial._() : super._();

  @override
  UserBaseInfoModel? get userBaseInfo;
  @override
  bool? get needForceUpdate;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
