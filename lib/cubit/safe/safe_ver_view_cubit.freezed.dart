// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'safe_ver_view_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SafeVerViewState {
  bool? get isEmailVerSent => throw _privateConstructorUsedError; // 是否已经发送验证码
  bool? get isPhoneVerSent => throw _privateConstructorUsedError; // 是否已经发送验证码
  int? get emailCountdown => throw _privateConstructorUsedError; // 邮箱验证码倒计时
  int? get phoneCountdown => throw _privateConstructorUsedError; // 手机验证码倒计时
  String? get oldEmailVerCode =>
      throw _privateConstructorUsedError; // 旧邮箱输入的验证码
  String? get oldPhoneVerCode =>
      throw _privateConstructorUsedError; // 旧手机号输入的验证码
  String? get googleVerCode => throw _privateConstructorUsedError; // 谷歌验证输入的验证码
  bool? get hasFocus => throw _privateConstructorUsedError; // 是否获取焦点
  bool? get showPassword => throw _privateConstructorUsedError; // 是否显示密码
  String? get areaCode => throw _privateConstructorUsedError; // 区号
  String? get emailOrderId =>
      throw _privateConstructorUsedError; // email验证码的orderid
  String? get phoneOrderId =>
      throw _privateConstructorUsedError; // email验证码的orderid
  bool? get changePassword => throw _privateConstructorUsedError; // 更改密码是否成功
  bool? get bindPhoneSuccess => throw _privateConstructorUsedError; // 绑定手机号是否成功
  bool? get needBack => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool? isEmailVerSent,
            bool? isPhoneVerSent,
            int? emailCountdown,
            int? phoneCountdown,
            String? oldEmailVerCode,
            String? oldPhoneVerCode,
            String? googleVerCode,
            bool? hasFocus,
            bool? showPassword,
            String? areaCode,
            String? emailOrderId,
            String? phoneOrderId,
            bool? changePassword,
            bool? bindPhoneSuccess,
            bool? needBack)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool? isEmailVerSent,
            bool? isPhoneVerSent,
            int? emailCountdown,
            int? phoneCountdown,
            String? oldEmailVerCode,
            String? oldPhoneVerCode,
            String? googleVerCode,
            bool? hasFocus,
            bool? showPassword,
            String? areaCode,
            String? emailOrderId,
            String? phoneOrderId,
            bool? changePassword,
            bool? bindPhoneSuccess,
            bool? needBack)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool? isEmailVerSent,
            bool? isPhoneVerSent,
            int? emailCountdown,
            int? phoneCountdown,
            String? oldEmailVerCode,
            String? oldPhoneVerCode,
            String? googleVerCode,
            bool? hasFocus,
            bool? showPassword,
            String? areaCode,
            String? emailOrderId,
            String? phoneOrderId,
            bool? changePassword,
            bool? bindPhoneSuccess,
            bool? needBack)?
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
  $SafeVerViewStateCopyWith<SafeVerViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SafeVerViewStateCopyWith<$Res> {
  factory $SafeVerViewStateCopyWith(
          SafeVerViewState value, $Res Function(SafeVerViewState) then) =
      _$SafeVerViewStateCopyWithImpl<$Res, SafeVerViewState>;
  @useResult
  $Res call(
      {bool? isEmailVerSent,
      bool? isPhoneVerSent,
      int? emailCountdown,
      int? phoneCountdown,
      String? oldEmailVerCode,
      String? oldPhoneVerCode,
      String? googleVerCode,
      bool? hasFocus,
      bool? showPassword,
      String? areaCode,
      String? emailOrderId,
      String? phoneOrderId,
      bool? changePassword,
      bool? bindPhoneSuccess,
      bool? needBack});
}

/// @nodoc
class _$SafeVerViewStateCopyWithImpl<$Res, $Val extends SafeVerViewState>
    implements $SafeVerViewStateCopyWith<$Res> {
  _$SafeVerViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEmailVerSent = freezed,
    Object? isPhoneVerSent = freezed,
    Object? emailCountdown = freezed,
    Object? phoneCountdown = freezed,
    Object? oldEmailVerCode = freezed,
    Object? oldPhoneVerCode = freezed,
    Object? googleVerCode = freezed,
    Object? hasFocus = freezed,
    Object? showPassword = freezed,
    Object? areaCode = freezed,
    Object? emailOrderId = freezed,
    Object? phoneOrderId = freezed,
    Object? changePassword = freezed,
    Object? bindPhoneSuccess = freezed,
    Object? needBack = freezed,
  }) {
    return _then(_value.copyWith(
      isEmailVerSent: freezed == isEmailVerSent
          ? _value.isEmailVerSent
          : isEmailVerSent // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPhoneVerSent: freezed == isPhoneVerSent
          ? _value.isPhoneVerSent
          : isPhoneVerSent // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailCountdown: freezed == emailCountdown
          ? _value.emailCountdown
          : emailCountdown // ignore: cast_nullable_to_non_nullable
              as int?,
      phoneCountdown: freezed == phoneCountdown
          ? _value.phoneCountdown
          : phoneCountdown // ignore: cast_nullable_to_non_nullable
              as int?,
      oldEmailVerCode: freezed == oldEmailVerCode
          ? _value.oldEmailVerCode
          : oldEmailVerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      oldPhoneVerCode: freezed == oldPhoneVerCode
          ? _value.oldPhoneVerCode
          : oldPhoneVerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      googleVerCode: freezed == googleVerCode
          ? _value.googleVerCode
          : googleVerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      hasFocus: freezed == hasFocus
          ? _value.hasFocus
          : hasFocus // ignore: cast_nullable_to_non_nullable
              as bool?,
      showPassword: freezed == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool?,
      areaCode: freezed == areaCode
          ? _value.areaCode
          : areaCode // ignore: cast_nullable_to_non_nullable
              as String?,
      emailOrderId: freezed == emailOrderId
          ? _value.emailOrderId
          : emailOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneOrderId: freezed == phoneOrderId
          ? _value.phoneOrderId
          : phoneOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      changePassword: freezed == changePassword
          ? _value.changePassword
          : changePassword // ignore: cast_nullable_to_non_nullable
              as bool?,
      bindPhoneSuccess: freezed == bindPhoneSuccess
          ? _value.bindPhoneSuccess
          : bindPhoneSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      needBack: freezed == needBack
          ? _value.needBack
          : needBack // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $SafeVerViewStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? isEmailVerSent,
      bool? isPhoneVerSent,
      int? emailCountdown,
      int? phoneCountdown,
      String? oldEmailVerCode,
      String? oldPhoneVerCode,
      String? googleVerCode,
      bool? hasFocus,
      bool? showPassword,
      String? areaCode,
      String? emailOrderId,
      String? phoneOrderId,
      bool? changePassword,
      bool? bindPhoneSuccess,
      bool? needBack});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SafeVerViewStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEmailVerSent = freezed,
    Object? isPhoneVerSent = freezed,
    Object? emailCountdown = freezed,
    Object? phoneCountdown = freezed,
    Object? oldEmailVerCode = freezed,
    Object? oldPhoneVerCode = freezed,
    Object? googleVerCode = freezed,
    Object? hasFocus = freezed,
    Object? showPassword = freezed,
    Object? areaCode = freezed,
    Object? emailOrderId = freezed,
    Object? phoneOrderId = freezed,
    Object? changePassword = freezed,
    Object? bindPhoneSuccess = freezed,
    Object? needBack = freezed,
  }) {
    return _then(_$InitialImpl(
      isEmailVerSent: freezed == isEmailVerSent
          ? _value.isEmailVerSent
          : isEmailVerSent // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPhoneVerSent: freezed == isPhoneVerSent
          ? _value.isPhoneVerSent
          : isPhoneVerSent // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailCountdown: freezed == emailCountdown
          ? _value.emailCountdown
          : emailCountdown // ignore: cast_nullable_to_non_nullable
              as int?,
      phoneCountdown: freezed == phoneCountdown
          ? _value.phoneCountdown
          : phoneCountdown // ignore: cast_nullable_to_non_nullable
              as int?,
      oldEmailVerCode: freezed == oldEmailVerCode
          ? _value.oldEmailVerCode
          : oldEmailVerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      oldPhoneVerCode: freezed == oldPhoneVerCode
          ? _value.oldPhoneVerCode
          : oldPhoneVerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      googleVerCode: freezed == googleVerCode
          ? _value.googleVerCode
          : googleVerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      hasFocus: freezed == hasFocus
          ? _value.hasFocus
          : hasFocus // ignore: cast_nullable_to_non_nullable
              as bool?,
      showPassword: freezed == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool?,
      areaCode: freezed == areaCode
          ? _value.areaCode
          : areaCode // ignore: cast_nullable_to_non_nullable
              as String?,
      emailOrderId: freezed == emailOrderId
          ? _value.emailOrderId
          : emailOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneOrderId: freezed == phoneOrderId
          ? _value.phoneOrderId
          : phoneOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      changePassword: freezed == changePassword
          ? _value.changePassword
          : changePassword // ignore: cast_nullable_to_non_nullable
              as bool?,
      bindPhoneSuccess: freezed == bindPhoneSuccess
          ? _value.bindPhoneSuccess
          : bindPhoneSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      needBack: freezed == needBack
          ? _value.needBack
          : needBack // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.isEmailVerSent,
      this.isPhoneVerSent,
      this.emailCountdown,
      this.phoneCountdown,
      this.oldEmailVerCode,
      this.oldPhoneVerCode,
      this.googleVerCode,
      this.hasFocus,
      this.showPassword,
      this.areaCode,
      this.emailOrderId,
      this.phoneOrderId,
      this.changePassword,
      this.bindPhoneSuccess,
      this.needBack});

  @override
  final bool? isEmailVerSent;
// 是否已经发送验证码
  @override
  final bool? isPhoneVerSent;
// 是否已经发送验证码
  @override
  final int? emailCountdown;
// 邮箱验证码倒计时
  @override
  final int? phoneCountdown;
// 手机验证码倒计时
  @override
  final String? oldEmailVerCode;
// 旧邮箱输入的验证码
  @override
  final String? oldPhoneVerCode;
// 旧手机号输入的验证码
  @override
  final String? googleVerCode;
// 谷歌验证输入的验证码
  @override
  final bool? hasFocus;
// 是否获取焦点
  @override
  final bool? showPassword;
// 是否显示密码
  @override
  final String? areaCode;
// 区号
  @override
  final String? emailOrderId;
// email验证码的orderid
  @override
  final String? phoneOrderId;
// email验证码的orderid
  @override
  final bool? changePassword;
// 更改密码是否成功
  @override
  final bool? bindPhoneSuccess;
// 绑定手机号是否成功
  @override
  final bool? needBack;

  @override
  String toString() {
    return 'SafeVerViewState.initial(isEmailVerSent: $isEmailVerSent, isPhoneVerSent: $isPhoneVerSent, emailCountdown: $emailCountdown, phoneCountdown: $phoneCountdown, oldEmailVerCode: $oldEmailVerCode, oldPhoneVerCode: $oldPhoneVerCode, googleVerCode: $googleVerCode, hasFocus: $hasFocus, showPassword: $showPassword, areaCode: $areaCode, emailOrderId: $emailOrderId, phoneOrderId: $phoneOrderId, changePassword: $changePassword, bindPhoneSuccess: $bindPhoneSuccess, needBack: $needBack)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isEmailVerSent, isEmailVerSent) ||
                other.isEmailVerSent == isEmailVerSent) &&
            (identical(other.isPhoneVerSent, isPhoneVerSent) ||
                other.isPhoneVerSent == isPhoneVerSent) &&
            (identical(other.emailCountdown, emailCountdown) ||
                other.emailCountdown == emailCountdown) &&
            (identical(other.phoneCountdown, phoneCountdown) ||
                other.phoneCountdown == phoneCountdown) &&
            (identical(other.oldEmailVerCode, oldEmailVerCode) ||
                other.oldEmailVerCode == oldEmailVerCode) &&
            (identical(other.oldPhoneVerCode, oldPhoneVerCode) ||
                other.oldPhoneVerCode == oldPhoneVerCode) &&
            (identical(other.googleVerCode, googleVerCode) ||
                other.googleVerCode == googleVerCode) &&
            (identical(other.hasFocus, hasFocus) ||
                other.hasFocus == hasFocus) &&
            (identical(other.showPassword, showPassword) ||
                other.showPassword == showPassword) &&
            (identical(other.areaCode, areaCode) ||
                other.areaCode == areaCode) &&
            (identical(other.emailOrderId, emailOrderId) ||
                other.emailOrderId == emailOrderId) &&
            (identical(other.phoneOrderId, phoneOrderId) ||
                other.phoneOrderId == phoneOrderId) &&
            (identical(other.changePassword, changePassword) ||
                other.changePassword == changePassword) &&
            (identical(other.bindPhoneSuccess, bindPhoneSuccess) ||
                other.bindPhoneSuccess == bindPhoneSuccess) &&
            (identical(other.needBack, needBack) ||
                other.needBack == needBack));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isEmailVerSent,
      isPhoneVerSent,
      emailCountdown,
      phoneCountdown,
      oldEmailVerCode,
      oldPhoneVerCode,
      googleVerCode,
      hasFocus,
      showPassword,
      areaCode,
      emailOrderId,
      phoneOrderId,
      changePassword,
      bindPhoneSuccess,
      needBack);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool? isEmailVerSent,
            bool? isPhoneVerSent,
            int? emailCountdown,
            int? phoneCountdown,
            String? oldEmailVerCode,
            String? oldPhoneVerCode,
            String? googleVerCode,
            bool? hasFocus,
            bool? showPassword,
            String? areaCode,
            String? emailOrderId,
            String? phoneOrderId,
            bool? changePassword,
            bool? bindPhoneSuccess,
            bool? needBack)
        initial,
  }) {
    return initial(
        isEmailVerSent,
        isPhoneVerSent,
        emailCountdown,
        phoneCountdown,
        oldEmailVerCode,
        oldPhoneVerCode,
        googleVerCode,
        hasFocus,
        showPassword,
        areaCode,
        emailOrderId,
        phoneOrderId,
        changePassword,
        bindPhoneSuccess,
        needBack);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool? isEmailVerSent,
            bool? isPhoneVerSent,
            int? emailCountdown,
            int? phoneCountdown,
            String? oldEmailVerCode,
            String? oldPhoneVerCode,
            String? googleVerCode,
            bool? hasFocus,
            bool? showPassword,
            String? areaCode,
            String? emailOrderId,
            String? phoneOrderId,
            bool? changePassword,
            bool? bindPhoneSuccess,
            bool? needBack)?
        initial,
  }) {
    return initial?.call(
        isEmailVerSent,
        isPhoneVerSent,
        emailCountdown,
        phoneCountdown,
        oldEmailVerCode,
        oldPhoneVerCode,
        googleVerCode,
        hasFocus,
        showPassword,
        areaCode,
        emailOrderId,
        phoneOrderId,
        changePassword,
        bindPhoneSuccess,
        needBack);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool? isEmailVerSent,
            bool? isPhoneVerSent,
            int? emailCountdown,
            int? phoneCountdown,
            String? oldEmailVerCode,
            String? oldPhoneVerCode,
            String? googleVerCode,
            bool? hasFocus,
            bool? showPassword,
            String? areaCode,
            String? emailOrderId,
            String? phoneOrderId,
            bool? changePassword,
            bool? bindPhoneSuccess,
            bool? needBack)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          isEmailVerSent,
          isPhoneVerSent,
          emailCountdown,
          phoneCountdown,
          oldEmailVerCode,
          oldPhoneVerCode,
          googleVerCode,
          hasFocus,
          showPassword,
          areaCode,
          emailOrderId,
          phoneOrderId,
          changePassword,
          bindPhoneSuccess,
          needBack);
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

abstract class _Initial implements SafeVerViewState {
  const factory _Initial(
      {final bool? isEmailVerSent,
      final bool? isPhoneVerSent,
      final int? emailCountdown,
      final int? phoneCountdown,
      final String? oldEmailVerCode,
      final String? oldPhoneVerCode,
      final String? googleVerCode,
      final bool? hasFocus,
      final bool? showPassword,
      final String? areaCode,
      final String? emailOrderId,
      final String? phoneOrderId,
      final bool? changePassword,
      final bool? bindPhoneSuccess,
      final bool? needBack}) = _$InitialImpl;

  @override
  bool? get isEmailVerSent;
  @override // 是否已经发送验证码
  bool? get isPhoneVerSent;
  @override // 是否已经发送验证码
  int? get emailCountdown;
  @override // 邮箱验证码倒计时
  int? get phoneCountdown;
  @override // 手机验证码倒计时
  String? get oldEmailVerCode;
  @override // 旧邮箱输入的验证码
  String? get oldPhoneVerCode;
  @override // 旧手机号输入的验证码
  String? get googleVerCode;
  @override // 谷歌验证输入的验证码
  bool? get hasFocus;
  @override // 是否获取焦点
  bool? get showPassword;
  @override // 是否显示密码
  String? get areaCode;
  @override // 区号
  String? get emailOrderId;
  @override // email验证码的orderid
  String? get phoneOrderId;
  @override // email验证码的orderid
  bool? get changePassword;
  @override // 更改密码是否成功
  bool? get bindPhoneSuccess;
  @override // 绑定手机号是否成功
  bool? get needBack;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
