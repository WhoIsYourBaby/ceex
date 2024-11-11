// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'input_text_field_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InputTextFieldState {
  bool? get isVerSent => throw _privateConstructorUsedError; // 是否已经发送验证码
  int? get countdown => throw _privateConstructorUsedError; // 验证码倒计时
  bool? get hasFocus => throw _privateConstructorUsedError; // 是否获取焦点
  bool? get showPassword => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool? isVerSent, int? countdown, bool? hasFocus, bool? showPassword)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool? isVerSent, int? countdown, bool? hasFocus,
            bool? showPassword)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool? isVerSent, int? countdown, bool? hasFocus,
            bool? showPassword)?
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
  $InputTextFieldStateCopyWith<InputTextFieldState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputTextFieldStateCopyWith<$Res> {
  factory $InputTextFieldStateCopyWith(
          InputTextFieldState value, $Res Function(InputTextFieldState) then) =
      _$InputTextFieldStateCopyWithImpl<$Res, InputTextFieldState>;
  @useResult
  $Res call(
      {bool? isVerSent, int? countdown, bool? hasFocus, bool? showPassword});
}

/// @nodoc
class _$InputTextFieldStateCopyWithImpl<$Res, $Val extends InputTextFieldState>
    implements $InputTextFieldStateCopyWith<$Res> {
  _$InputTextFieldStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isVerSent = freezed,
    Object? countdown = freezed,
    Object? hasFocus = freezed,
    Object? showPassword = freezed,
  }) {
    return _then(_value.copyWith(
      isVerSent: freezed == isVerSent
          ? _value.isVerSent
          : isVerSent // ignore: cast_nullable_to_non_nullable
              as bool?,
      countdown: freezed == countdown
          ? _value.countdown
          : countdown // ignore: cast_nullable_to_non_nullable
              as int?,
      hasFocus: freezed == hasFocus
          ? _value.hasFocus
          : hasFocus // ignore: cast_nullable_to_non_nullable
              as bool?,
      showPassword: freezed == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $InputTextFieldStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? isVerSent, int? countdown, bool? hasFocus, bool? showPassword});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$InputTextFieldStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isVerSent = freezed,
    Object? countdown = freezed,
    Object? hasFocus = freezed,
    Object? showPassword = freezed,
  }) {
    return _then(_$InitialImpl(
      isVerSent: freezed == isVerSent
          ? _value.isVerSent
          : isVerSent // ignore: cast_nullable_to_non_nullable
              as bool?,
      countdown: freezed == countdown
          ? _value.countdown
          : countdown // ignore: cast_nullable_to_non_nullable
              as int?,
      hasFocus: freezed == hasFocus
          ? _value.hasFocus
          : hasFocus // ignore: cast_nullable_to_non_nullable
              as bool?,
      showPassword: freezed == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.isVerSent, this.countdown, this.hasFocus, this.showPassword});

  @override
  final bool? isVerSent;
// 是否已经发送验证码
  @override
  final int? countdown;
// 验证码倒计时
  @override
  final bool? hasFocus;
// 是否获取焦点
  @override
  final bool? showPassword;

  @override
  String toString() {
    return 'InputTextFieldState.initial(isVerSent: $isVerSent, countdown: $countdown, hasFocus: $hasFocus, showPassword: $showPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isVerSent, isVerSent) ||
                other.isVerSent == isVerSent) &&
            (identical(other.countdown, countdown) ||
                other.countdown == countdown) &&
            (identical(other.hasFocus, hasFocus) ||
                other.hasFocus == hasFocus) &&
            (identical(other.showPassword, showPassword) ||
                other.showPassword == showPassword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isVerSent, countdown, hasFocus, showPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool? isVerSent, int? countdown, bool? hasFocus, bool? showPassword)
        initial,
  }) {
    return initial(isVerSent, countdown, hasFocus, showPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool? isVerSent, int? countdown, bool? hasFocus,
            bool? showPassword)?
        initial,
  }) {
    return initial?.call(isVerSent, countdown, hasFocus, showPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool? isVerSent, int? countdown, bool? hasFocus,
            bool? showPassword)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isVerSent, countdown, hasFocus, showPassword);
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

abstract class _Initial implements InputTextFieldState {
  const factory _Initial(
      {final bool? isVerSent,
      final int? countdown,
      final bool? hasFocus,
      final bool? showPassword}) = _$InitialImpl;

  @override
  bool? get isVerSent;
  @override // 是否已经发送验证码
  int? get countdown;
  @override // 验证码倒计时
  bool? get hasFocus;
  @override // 是否获取焦点
  bool? get showPassword;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
