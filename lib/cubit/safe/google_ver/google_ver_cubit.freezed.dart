// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_ver_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GoogleVerState {
  String? get secretKey => throw _privateConstructorUsedError;
  String? get authUrl => throw _privateConstructorUsedError;
  String? get qrcode => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? secretKey, String? authUrl, String? qrcode)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? secretKey, String? authUrl, String? qrcode)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? secretKey, String? authUrl, String? qrcode)?
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
  $GoogleVerStateCopyWith<GoogleVerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleVerStateCopyWith<$Res> {
  factory $GoogleVerStateCopyWith(
          GoogleVerState value, $Res Function(GoogleVerState) then) =
      _$GoogleVerStateCopyWithImpl<$Res, GoogleVerState>;
  @useResult
  $Res call({String? secretKey, String? authUrl, String? qrcode});
}

/// @nodoc
class _$GoogleVerStateCopyWithImpl<$Res, $Val extends GoogleVerState>
    implements $GoogleVerStateCopyWith<$Res> {
  _$GoogleVerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? secretKey = freezed,
    Object? authUrl = freezed,
    Object? qrcode = freezed,
  }) {
    return _then(_value.copyWith(
      secretKey: freezed == secretKey
          ? _value.secretKey
          : secretKey // ignore: cast_nullable_to_non_nullable
              as String?,
      authUrl: freezed == authUrl
          ? _value.authUrl
          : authUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      qrcode: freezed == qrcode
          ? _value.qrcode
          : qrcode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $GoogleVerStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? secretKey, String? authUrl, String? qrcode});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GoogleVerStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? secretKey = freezed,
    Object? authUrl = freezed,
    Object? qrcode = freezed,
  }) {
    return _then(_$InitialImpl(
      secretKey: freezed == secretKey
          ? _value.secretKey
          : secretKey // ignore: cast_nullable_to_non_nullable
              as String?,
      authUrl: freezed == authUrl
          ? _value.authUrl
          : authUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      qrcode: freezed == qrcode
          ? _value.qrcode
          : qrcode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({this.secretKey, this.authUrl, this.qrcode});

  @override
  final String? secretKey;
  @override
  final String? authUrl;
  @override
  final String? qrcode;

  @override
  String toString() {
    return 'GoogleVerState.initial(secretKey: $secretKey, authUrl: $authUrl, qrcode: $qrcode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.secretKey, secretKey) ||
                other.secretKey == secretKey) &&
            (identical(other.authUrl, authUrl) || other.authUrl == authUrl) &&
            (identical(other.qrcode, qrcode) || other.qrcode == qrcode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, secretKey, authUrl, qrcode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? secretKey, String? authUrl, String? qrcode)
        initial,
  }) {
    return initial(secretKey, authUrl, qrcode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? secretKey, String? authUrl, String? qrcode)?
        initial,
  }) {
    return initial?.call(secretKey, authUrl, qrcode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? secretKey, String? authUrl, String? qrcode)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(secretKey, authUrl, qrcode);
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

abstract class _Initial implements GoogleVerState {
  const factory _Initial(
      {final String? secretKey,
      final String? authUrl,
      final String? qrcode}) = _$InitialImpl;

  @override
  String? get secretKey;
  @override
  String? get authUrl;
  @override
  String? get qrcode;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
