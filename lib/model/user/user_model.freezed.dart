// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  bool? get bindMobile => throw _privateConstructorUsedError;
  bool? get bindEmail => throw _privateConstructorUsedError;
  bool? get bindGA => throw _privateConstructorUsedError;
  bool? get need2FA => throw _privateConstructorUsedError;
  String? get authType => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;
  String? get timeLeft => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get defaultAccountId => throw _privateConstructorUsedError;
  int? get registerType => throw _privateConstructorUsedError;
  String? get nationalCode => throw _privateConstructorUsedError;
  String? get mobile => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  UserData? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {bool? bindMobile,
      bool? bindEmail,
      bool? bindGA,
      bool? need2FA,
      String? authType,
      String? requestId,
      String? timeLeft,
      String? userId,
      String? defaultAccountId,
      int? registerType,
      String? nationalCode,
      String? mobile,
      String? email,
      UserData? user});

  $UserDataCopyWith<$Res>? get user;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bindMobile = freezed,
    Object? bindEmail = freezed,
    Object? bindGA = freezed,
    Object? need2FA = freezed,
    Object? authType = freezed,
    Object? requestId = freezed,
    Object? timeLeft = freezed,
    Object? userId = freezed,
    Object? defaultAccountId = freezed,
    Object? registerType = freezed,
    Object? nationalCode = freezed,
    Object? mobile = freezed,
    Object? email = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      bindMobile: freezed == bindMobile
          ? _value.bindMobile
          : bindMobile // ignore: cast_nullable_to_non_nullable
              as bool?,
      bindEmail: freezed == bindEmail
          ? _value.bindEmail
          : bindEmail // ignore: cast_nullable_to_non_nullable
              as bool?,
      bindGA: freezed == bindGA
          ? _value.bindGA
          : bindGA // ignore: cast_nullable_to_non_nullable
              as bool?,
      need2FA: freezed == need2FA
          ? _value.need2FA
          : need2FA // ignore: cast_nullable_to_non_nullable
              as bool?,
      authType: freezed == authType
          ? _value.authType
          : authType // ignore: cast_nullable_to_non_nullable
              as String?,
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      timeLeft: freezed == timeLeft
          ? _value.timeLeft
          : timeLeft // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultAccountId: freezed == defaultAccountId
          ? _value.defaultAccountId
          : defaultAccountId // ignore: cast_nullable_to_non_nullable
              as String?,
      registerType: freezed == registerType
          ? _value.registerType
          : registerType // ignore: cast_nullable_to_non_nullable
              as int?,
      nationalCode: freezed == nationalCode
          ? _value.nationalCode
          : nationalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserDataCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? bindMobile,
      bool? bindEmail,
      bool? bindGA,
      bool? need2FA,
      String? authType,
      String? requestId,
      String? timeLeft,
      String? userId,
      String? defaultAccountId,
      int? registerType,
      String? nationalCode,
      String? mobile,
      String? email,
      UserData? user});

  @override
  $UserDataCopyWith<$Res>? get user;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bindMobile = freezed,
    Object? bindEmail = freezed,
    Object? bindGA = freezed,
    Object? need2FA = freezed,
    Object? authType = freezed,
    Object? requestId = freezed,
    Object? timeLeft = freezed,
    Object? userId = freezed,
    Object? defaultAccountId = freezed,
    Object? registerType = freezed,
    Object? nationalCode = freezed,
    Object? mobile = freezed,
    Object? email = freezed,
    Object? user = freezed,
  }) {
    return _then(_$UserModelImpl(
      bindMobile: freezed == bindMobile
          ? _value.bindMobile
          : bindMobile // ignore: cast_nullable_to_non_nullable
              as bool?,
      bindEmail: freezed == bindEmail
          ? _value.bindEmail
          : bindEmail // ignore: cast_nullable_to_non_nullable
              as bool?,
      bindGA: freezed == bindGA
          ? _value.bindGA
          : bindGA // ignore: cast_nullable_to_non_nullable
              as bool?,
      need2FA: freezed == need2FA
          ? _value.need2FA
          : need2FA // ignore: cast_nullable_to_non_nullable
              as bool?,
      authType: freezed == authType
          ? _value.authType
          : authType // ignore: cast_nullable_to_non_nullable
              as String?,
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      timeLeft: freezed == timeLeft
          ? _value.timeLeft
          : timeLeft // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultAccountId: freezed == defaultAccountId
          ? _value.defaultAccountId
          : defaultAccountId // ignore: cast_nullable_to_non_nullable
              as String?,
      registerType: freezed == registerType
          ? _value.registerType
          : registerType // ignore: cast_nullable_to_non_nullable
              as int?,
      nationalCode: freezed == nationalCode
          ? _value.nationalCode
          : nationalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {this.bindMobile,
      this.bindEmail,
      this.bindGA,
      this.need2FA,
      this.authType,
      this.requestId,
      this.timeLeft,
      this.userId,
      this.defaultAccountId,
      this.registerType,
      this.nationalCode,
      this.mobile,
      this.email,
      this.user});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final bool? bindMobile;
  @override
  final bool? bindEmail;
  @override
  final bool? bindGA;
  @override
  final bool? need2FA;
  @override
  final String? authType;
  @override
  final String? requestId;
  @override
  final String? timeLeft;
  @override
  final String? userId;
  @override
  final String? defaultAccountId;
  @override
  final int? registerType;
  @override
  final String? nationalCode;
  @override
  final String? mobile;
  @override
  final String? email;
  @override
  final UserData? user;

  @override
  String toString() {
    return 'UserModel(bindMobile: $bindMobile, bindEmail: $bindEmail, bindGA: $bindGA, need2FA: $need2FA, authType: $authType, requestId: $requestId, timeLeft: $timeLeft, userId: $userId, defaultAccountId: $defaultAccountId, registerType: $registerType, nationalCode: $nationalCode, mobile: $mobile, email: $email, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.bindMobile, bindMobile) ||
                other.bindMobile == bindMobile) &&
            (identical(other.bindEmail, bindEmail) ||
                other.bindEmail == bindEmail) &&
            (identical(other.bindGA, bindGA) || other.bindGA == bindGA) &&
            (identical(other.need2FA, need2FA) || other.need2FA == need2FA) &&
            (identical(other.authType, authType) ||
                other.authType == authType) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.timeLeft, timeLeft) ||
                other.timeLeft == timeLeft) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.defaultAccountId, defaultAccountId) ||
                other.defaultAccountId == defaultAccountId) &&
            (identical(other.registerType, registerType) ||
                other.registerType == registerType) &&
            (identical(other.nationalCode, nationalCode) ||
                other.nationalCode == nationalCode) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bindMobile,
      bindEmail,
      bindGA,
      need2FA,
      authType,
      requestId,
      timeLeft,
      userId,
      defaultAccountId,
      registerType,
      nationalCode,
      mobile,
      email,
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {final bool? bindMobile,
      final bool? bindEmail,
      final bool? bindGA,
      final bool? need2FA,
      final String? authType,
      final String? requestId,
      final String? timeLeft,
      final String? userId,
      final String? defaultAccountId,
      final int? registerType,
      final String? nationalCode,
      final String? mobile,
      final String? email,
      final UserData? user}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  bool? get bindMobile;
  @override
  bool? get bindEmail;
  @override
  bool? get bindGA;
  @override
  bool? get need2FA;
  @override
  String? get authType;
  @override
  String? get requestId;
  @override
  String? get timeLeft;
  @override
  String? get userId;
  @override
  String? get defaultAccountId;
  @override
  int? get registerType;
  @override
  String? get nationalCode;
  @override
  String? get mobile;
  @override
  String? get email;
  @override
  UserData? get user;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FindPwdModel _$FindPwdModelFromJson(Map<String, dynamic> json) {
  return _FindPwdModel.fromJson(json);
}

/// @nodoc
mixin _$FindPwdModel {
  bool? get success => throw _privateConstructorUsedError;
  bool? get needFrozenLogin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FindPwdModelCopyWith<FindPwdModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindPwdModelCopyWith<$Res> {
  factory $FindPwdModelCopyWith(
          FindPwdModel value, $Res Function(FindPwdModel) then) =
      _$FindPwdModelCopyWithImpl<$Res, FindPwdModel>;
  @useResult
  $Res call({bool? success, bool? needFrozenLogin});
}

/// @nodoc
class _$FindPwdModelCopyWithImpl<$Res, $Val extends FindPwdModel>
    implements $FindPwdModelCopyWith<$Res> {
  _$FindPwdModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? needFrozenLogin = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      needFrozenLogin: freezed == needFrozenLogin
          ? _value.needFrozenLogin
          : needFrozenLogin // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FindPwdModelImplCopyWith<$Res>
    implements $FindPwdModelCopyWith<$Res> {
  factory _$$FindPwdModelImplCopyWith(
          _$FindPwdModelImpl value, $Res Function(_$FindPwdModelImpl) then) =
      __$$FindPwdModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, bool? needFrozenLogin});
}

/// @nodoc
class __$$FindPwdModelImplCopyWithImpl<$Res>
    extends _$FindPwdModelCopyWithImpl<$Res, _$FindPwdModelImpl>
    implements _$$FindPwdModelImplCopyWith<$Res> {
  __$$FindPwdModelImplCopyWithImpl(
      _$FindPwdModelImpl _value, $Res Function(_$FindPwdModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? needFrozenLogin = freezed,
  }) {
    return _then(_$FindPwdModelImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      needFrozenLogin: freezed == needFrozenLogin
          ? _value.needFrozenLogin
          : needFrozenLogin // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FindPwdModelImpl implements _FindPwdModel {
  const _$FindPwdModelImpl({this.success, this.needFrozenLogin});

  factory _$FindPwdModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FindPwdModelImplFromJson(json);

  @override
  final bool? success;
  @override
  final bool? needFrozenLogin;

  @override
  String toString() {
    return 'FindPwdModel(success: $success, needFrozenLogin: $needFrozenLogin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindPwdModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.needFrozenLogin, needFrozenLogin) ||
                other.needFrozenLogin == needFrozenLogin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, needFrozenLogin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FindPwdModelImplCopyWith<_$FindPwdModelImpl> get copyWith =>
      __$$FindPwdModelImplCopyWithImpl<_$FindPwdModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FindPwdModelImplToJson(
      this,
    );
  }
}

abstract class _FindPwdModel implements FindPwdModel {
  const factory _FindPwdModel(
      {final bool? success, final bool? needFrozenLogin}) = _$FindPwdModelImpl;

  factory _FindPwdModel.fromJson(Map<String, dynamic> json) =
      _$FindPwdModelImpl.fromJson;

  @override
  bool? get success;
  @override
  bool? get needFrozenLogin;
  @override
  @JsonKey(ignore: true)
  _$$FindPwdModelImplCopyWith<_$FindPwdModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserCookie _$UserCookieFromJson(Map<String, dynamic> json) {
  return _UserCookie.fromJson(json);
}

/// @nodoc
mixin _$UserCookie {
  String? get au_token => throw _privateConstructorUsedError;
  String? get c_token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCookieCopyWith<UserCookie> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCookieCopyWith<$Res> {
  factory $UserCookieCopyWith(
          UserCookie value, $Res Function(UserCookie) then) =
      _$UserCookieCopyWithImpl<$Res, UserCookie>;
  @useResult
  $Res call({String? au_token, String? c_token});
}

/// @nodoc
class _$UserCookieCopyWithImpl<$Res, $Val extends UserCookie>
    implements $UserCookieCopyWith<$Res> {
  _$UserCookieCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? au_token = freezed,
    Object? c_token = freezed,
  }) {
    return _then(_value.copyWith(
      au_token: freezed == au_token
          ? _value.au_token
          : au_token // ignore: cast_nullable_to_non_nullable
              as String?,
      c_token: freezed == c_token
          ? _value.c_token
          : c_token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserCookieImplCopyWith<$Res>
    implements $UserCookieCopyWith<$Res> {
  factory _$$UserCookieImplCopyWith(
          _$UserCookieImpl value, $Res Function(_$UserCookieImpl) then) =
      __$$UserCookieImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? au_token, String? c_token});
}

/// @nodoc
class __$$UserCookieImplCopyWithImpl<$Res>
    extends _$UserCookieCopyWithImpl<$Res, _$UserCookieImpl>
    implements _$$UserCookieImplCopyWith<$Res> {
  __$$UserCookieImplCopyWithImpl(
      _$UserCookieImpl _value, $Res Function(_$UserCookieImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? au_token = freezed,
    Object? c_token = freezed,
  }) {
    return _then(_$UserCookieImpl(
      au_token: freezed == au_token
          ? _value.au_token
          : au_token // ignore: cast_nullable_to_non_nullable
              as String?,
      c_token: freezed == c_token
          ? _value.c_token
          : c_token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserCookieImpl implements _UserCookie {
  const _$UserCookieImpl({this.au_token, this.c_token});

  factory _$UserCookieImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserCookieImplFromJson(json);

  @override
  final String? au_token;
  @override
  final String? c_token;

  @override
  String toString() {
    return 'UserCookie(au_token: $au_token, c_token: $c_token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserCookieImpl &&
            (identical(other.au_token, au_token) ||
                other.au_token == au_token) &&
            (identical(other.c_token, c_token) || other.c_token == c_token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, au_token, c_token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserCookieImplCopyWith<_$UserCookieImpl> get copyWith =>
      __$$UserCookieImplCopyWithImpl<_$UserCookieImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserCookieImplToJson(
      this,
    );
  }
}

abstract class _UserCookie implements UserCookie {
  const factory _UserCookie({final String? au_token, final String? c_token}) =
      _$UserCookieImpl;

  factory _UserCookie.fromJson(Map<String, dynamic> json) =
      _$UserCookieImpl.fromJson;

  @override
  String? get au_token;
  @override
  String? get c_token;
  @override
  @JsonKey(ignore: true)
  _$$UserCookieImplCopyWith<_$UserCookieImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
mixin _$UserData {
  String? get userId => throw _privateConstructorUsedError;
  int? get registerType => throw _privateConstructorUsedError;
  String? get mobile => throw _privateConstructorUsedError;
  String? get nationalCode => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  bool? get bindGA => throw _privateConstructorUsedError;
  bool? get bindTradePwd => throw _privateConstructorUsedError;
  bool? get bindPassword => throw _privateConstructorUsedError;
  int? get userType => throw _privateConstructorUsedError;
  int? get verifyStatus => throw _privateConstructorUsedError;
  int? get kycLevel => throw _privateConstructorUsedError;
  int? get kycVerifyStatus => throw _privateConstructorUsedError;
  String? get displayLevel => throw _privateConstructorUsedError;
  List<dynamic>? get accounts => throw _privateConstructorUsedError;
  String? get defaultAccountId => throw _privateConstructorUsedError;
  String? get registerDate => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  String? get inviteUserId => throw _privateConstructorUsedError;
  String? get secondLevelInviteUserId => throw _privateConstructorUsedError;
  int? get isAgent => throw _privateConstructorUsedError;
  List<dynamic>? get customLabelList => throw _privateConstructorUsedError;
  String? get antiPhishingCode => throw _privateConstructorUsedError;
  bool? get isComplianceVerify => throw _privateConstructorUsedError;
  String? get lastLoginDate => throw _privateConstructorUsedError;
  String? get lastLoginIp => throw _privateConstructorUsedError;
  String? get platfrom => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res, UserData>;
  @useResult
  $Res call(
      {String? userId,
      int? registerType,
      String? mobile,
      String? nationalCode,
      String? email,
      bool? bindGA,
      bool? bindTradePwd,
      bool? bindPassword,
      int? userType,
      int? verifyStatus,
      int? kycLevel,
      int? kycVerifyStatus,
      String? displayLevel,
      List<dynamic>? accounts,
      String? defaultAccountId,
      String? registerDate,
      String? source,
      String? inviteUserId,
      String? secondLevelInviteUserId,
      int? isAgent,
      List<dynamic>? customLabelList,
      String? antiPhishingCode,
      bool? isComplianceVerify,
      String? lastLoginDate,
      String? lastLoginIp,
      String? platfrom});
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res, $Val extends UserData>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? registerType = freezed,
    Object? mobile = freezed,
    Object? nationalCode = freezed,
    Object? email = freezed,
    Object? bindGA = freezed,
    Object? bindTradePwd = freezed,
    Object? bindPassword = freezed,
    Object? userType = freezed,
    Object? verifyStatus = freezed,
    Object? kycLevel = freezed,
    Object? kycVerifyStatus = freezed,
    Object? displayLevel = freezed,
    Object? accounts = freezed,
    Object? defaultAccountId = freezed,
    Object? registerDate = freezed,
    Object? source = freezed,
    Object? inviteUserId = freezed,
    Object? secondLevelInviteUserId = freezed,
    Object? isAgent = freezed,
    Object? customLabelList = freezed,
    Object? antiPhishingCode = freezed,
    Object? isComplianceVerify = freezed,
    Object? lastLoginDate = freezed,
    Object? lastLoginIp = freezed,
    Object? platfrom = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      registerType: freezed == registerType
          ? _value.registerType
          : registerType // ignore: cast_nullable_to_non_nullable
              as int?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      nationalCode: freezed == nationalCode
          ? _value.nationalCode
          : nationalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      bindGA: freezed == bindGA
          ? _value.bindGA
          : bindGA // ignore: cast_nullable_to_non_nullable
              as bool?,
      bindTradePwd: freezed == bindTradePwd
          ? _value.bindTradePwd
          : bindTradePwd // ignore: cast_nullable_to_non_nullable
              as bool?,
      bindPassword: freezed == bindPassword
          ? _value.bindPassword
          : bindPassword // ignore: cast_nullable_to_non_nullable
              as bool?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as int?,
      verifyStatus: freezed == verifyStatus
          ? _value.verifyStatus
          : verifyStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      kycLevel: freezed == kycLevel
          ? _value.kycLevel
          : kycLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      kycVerifyStatus: freezed == kycVerifyStatus
          ? _value.kycVerifyStatus
          : kycVerifyStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      displayLevel: freezed == displayLevel
          ? _value.displayLevel
          : displayLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      accounts: freezed == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      defaultAccountId: freezed == defaultAccountId
          ? _value.defaultAccountId
          : defaultAccountId // ignore: cast_nullable_to_non_nullable
              as String?,
      registerDate: freezed == registerDate
          ? _value.registerDate
          : registerDate // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      inviteUserId: freezed == inviteUserId
          ? _value.inviteUserId
          : inviteUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      secondLevelInviteUserId: freezed == secondLevelInviteUserId
          ? _value.secondLevelInviteUserId
          : secondLevelInviteUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      isAgent: freezed == isAgent
          ? _value.isAgent
          : isAgent // ignore: cast_nullable_to_non_nullable
              as int?,
      customLabelList: freezed == customLabelList
          ? _value.customLabelList
          : customLabelList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      antiPhishingCode: freezed == antiPhishingCode
          ? _value.antiPhishingCode
          : antiPhishingCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isComplianceVerify: freezed == isComplianceVerify
          ? _value.isComplianceVerify
          : isComplianceVerify // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastLoginDate: freezed == lastLoginDate
          ? _value.lastLoginDate
          : lastLoginDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastLoginIp: freezed == lastLoginIp
          ? _value.lastLoginIp
          : lastLoginIp // ignore: cast_nullable_to_non_nullable
              as String?,
      platfrom: freezed == platfrom
          ? _value.platfrom
          : platfrom // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDataImplCopyWith<$Res>
    implements $UserDataCopyWith<$Res> {
  factory _$$UserDataImplCopyWith(
          _$UserDataImpl value, $Res Function(_$UserDataImpl) then) =
      __$$UserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userId,
      int? registerType,
      String? mobile,
      String? nationalCode,
      String? email,
      bool? bindGA,
      bool? bindTradePwd,
      bool? bindPassword,
      int? userType,
      int? verifyStatus,
      int? kycLevel,
      int? kycVerifyStatus,
      String? displayLevel,
      List<dynamic>? accounts,
      String? defaultAccountId,
      String? registerDate,
      String? source,
      String? inviteUserId,
      String? secondLevelInviteUserId,
      int? isAgent,
      List<dynamic>? customLabelList,
      String? antiPhishingCode,
      bool? isComplianceVerify,
      String? lastLoginDate,
      String? lastLoginIp,
      String? platfrom});
}

/// @nodoc
class __$$UserDataImplCopyWithImpl<$Res>
    extends _$UserDataCopyWithImpl<$Res, _$UserDataImpl>
    implements _$$UserDataImplCopyWith<$Res> {
  __$$UserDataImplCopyWithImpl(
      _$UserDataImpl _value, $Res Function(_$UserDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? registerType = freezed,
    Object? mobile = freezed,
    Object? nationalCode = freezed,
    Object? email = freezed,
    Object? bindGA = freezed,
    Object? bindTradePwd = freezed,
    Object? bindPassword = freezed,
    Object? userType = freezed,
    Object? verifyStatus = freezed,
    Object? kycLevel = freezed,
    Object? kycVerifyStatus = freezed,
    Object? displayLevel = freezed,
    Object? accounts = freezed,
    Object? defaultAccountId = freezed,
    Object? registerDate = freezed,
    Object? source = freezed,
    Object? inviteUserId = freezed,
    Object? secondLevelInviteUserId = freezed,
    Object? isAgent = freezed,
    Object? customLabelList = freezed,
    Object? antiPhishingCode = freezed,
    Object? isComplianceVerify = freezed,
    Object? lastLoginDate = freezed,
    Object? lastLoginIp = freezed,
    Object? platfrom = freezed,
  }) {
    return _then(_$UserDataImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      registerType: freezed == registerType
          ? _value.registerType
          : registerType // ignore: cast_nullable_to_non_nullable
              as int?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      nationalCode: freezed == nationalCode
          ? _value.nationalCode
          : nationalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      bindGA: freezed == bindGA
          ? _value.bindGA
          : bindGA // ignore: cast_nullable_to_non_nullable
              as bool?,
      bindTradePwd: freezed == bindTradePwd
          ? _value.bindTradePwd
          : bindTradePwd // ignore: cast_nullable_to_non_nullable
              as bool?,
      bindPassword: freezed == bindPassword
          ? _value.bindPassword
          : bindPassword // ignore: cast_nullable_to_non_nullable
              as bool?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as int?,
      verifyStatus: freezed == verifyStatus
          ? _value.verifyStatus
          : verifyStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      kycLevel: freezed == kycLevel
          ? _value.kycLevel
          : kycLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      kycVerifyStatus: freezed == kycVerifyStatus
          ? _value.kycVerifyStatus
          : kycVerifyStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      displayLevel: freezed == displayLevel
          ? _value.displayLevel
          : displayLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      accounts: freezed == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      defaultAccountId: freezed == defaultAccountId
          ? _value.defaultAccountId
          : defaultAccountId // ignore: cast_nullable_to_non_nullable
              as String?,
      registerDate: freezed == registerDate
          ? _value.registerDate
          : registerDate // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      inviteUserId: freezed == inviteUserId
          ? _value.inviteUserId
          : inviteUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      secondLevelInviteUserId: freezed == secondLevelInviteUserId
          ? _value.secondLevelInviteUserId
          : secondLevelInviteUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      isAgent: freezed == isAgent
          ? _value.isAgent
          : isAgent // ignore: cast_nullable_to_non_nullable
              as int?,
      customLabelList: freezed == customLabelList
          ? _value._customLabelList
          : customLabelList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      antiPhishingCode: freezed == antiPhishingCode
          ? _value.antiPhishingCode
          : antiPhishingCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isComplianceVerify: freezed == isComplianceVerify
          ? _value.isComplianceVerify
          : isComplianceVerify // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastLoginDate: freezed == lastLoginDate
          ? _value.lastLoginDate
          : lastLoginDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastLoginIp: freezed == lastLoginIp
          ? _value.lastLoginIp
          : lastLoginIp // ignore: cast_nullable_to_non_nullable
              as String?,
      platfrom: freezed == platfrom
          ? _value.platfrom
          : platfrom // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDataImpl implements _UserData {
  const _$UserDataImpl(
      {this.userId,
      this.registerType,
      this.mobile,
      this.nationalCode,
      this.email,
      this.bindGA,
      this.bindTradePwd,
      this.bindPassword,
      this.userType,
      this.verifyStatus,
      this.kycLevel,
      this.kycVerifyStatus,
      this.displayLevel,
      final List<dynamic>? accounts,
      this.defaultAccountId,
      this.registerDate,
      this.source,
      this.inviteUserId,
      this.secondLevelInviteUserId,
      this.isAgent,
      final List<dynamic>? customLabelList,
      this.antiPhishingCode,
      this.isComplianceVerify,
      this.lastLoginDate,
      this.lastLoginIp,
      this.platfrom})
      : _accounts = accounts,
        _customLabelList = customLabelList;

  factory _$UserDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDataImplFromJson(json);

  @override
  final String? userId;
  @override
  final int? registerType;
  @override
  final String? mobile;
  @override
  final String? nationalCode;
  @override
  final String? email;
  @override
  final bool? bindGA;
  @override
  final bool? bindTradePwd;
  @override
  final bool? bindPassword;
  @override
  final int? userType;
  @override
  final int? verifyStatus;
  @override
  final int? kycLevel;
  @override
  final int? kycVerifyStatus;
  @override
  final String? displayLevel;
  final List<dynamic>? _accounts;
  @override
  List<dynamic>? get accounts {
    final value = _accounts;
    if (value == null) return null;
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? defaultAccountId;
  @override
  final String? registerDate;
  @override
  final String? source;
  @override
  final String? inviteUserId;
  @override
  final String? secondLevelInviteUserId;
  @override
  final int? isAgent;
  final List<dynamic>? _customLabelList;
  @override
  List<dynamic>? get customLabelList {
    final value = _customLabelList;
    if (value == null) return null;
    if (_customLabelList is EqualUnmodifiableListView) return _customLabelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? antiPhishingCode;
  @override
  final bool? isComplianceVerify;
  @override
  final String? lastLoginDate;
  @override
  final String? lastLoginIp;
  @override
  final String? platfrom;

  @override
  String toString() {
    return 'UserData(userId: $userId, registerType: $registerType, mobile: $mobile, nationalCode: $nationalCode, email: $email, bindGA: $bindGA, bindTradePwd: $bindTradePwd, bindPassword: $bindPassword, userType: $userType, verifyStatus: $verifyStatus, kycLevel: $kycLevel, kycVerifyStatus: $kycVerifyStatus, displayLevel: $displayLevel, accounts: $accounts, defaultAccountId: $defaultAccountId, registerDate: $registerDate, source: $source, inviteUserId: $inviteUserId, secondLevelInviteUserId: $secondLevelInviteUserId, isAgent: $isAgent, customLabelList: $customLabelList, antiPhishingCode: $antiPhishingCode, isComplianceVerify: $isComplianceVerify, lastLoginDate: $lastLoginDate, lastLoginIp: $lastLoginIp, platfrom: $platfrom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.registerType, registerType) ||
                other.registerType == registerType) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.nationalCode, nationalCode) ||
                other.nationalCode == nationalCode) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.bindGA, bindGA) || other.bindGA == bindGA) &&
            (identical(other.bindTradePwd, bindTradePwd) ||
                other.bindTradePwd == bindTradePwd) &&
            (identical(other.bindPassword, bindPassword) ||
                other.bindPassword == bindPassword) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.verifyStatus, verifyStatus) ||
                other.verifyStatus == verifyStatus) &&
            (identical(other.kycLevel, kycLevel) ||
                other.kycLevel == kycLevel) &&
            (identical(other.kycVerifyStatus, kycVerifyStatus) ||
                other.kycVerifyStatus == kycVerifyStatus) &&
            (identical(other.displayLevel, displayLevel) ||
                other.displayLevel == displayLevel) &&
            const DeepCollectionEquality().equals(other._accounts, _accounts) &&
            (identical(other.defaultAccountId, defaultAccountId) ||
                other.defaultAccountId == defaultAccountId) &&
            (identical(other.registerDate, registerDate) ||
                other.registerDate == registerDate) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.inviteUserId, inviteUserId) ||
                other.inviteUserId == inviteUserId) &&
            (identical(
                    other.secondLevelInviteUserId, secondLevelInviteUserId) ||
                other.secondLevelInviteUserId == secondLevelInviteUserId) &&
            (identical(other.isAgent, isAgent) || other.isAgent == isAgent) &&
            const DeepCollectionEquality()
                .equals(other._customLabelList, _customLabelList) &&
            (identical(other.antiPhishingCode, antiPhishingCode) ||
                other.antiPhishingCode == antiPhishingCode) &&
            (identical(other.isComplianceVerify, isComplianceVerify) ||
                other.isComplianceVerify == isComplianceVerify) &&
            (identical(other.lastLoginDate, lastLoginDate) ||
                other.lastLoginDate == lastLoginDate) &&
            (identical(other.lastLoginIp, lastLoginIp) ||
                other.lastLoginIp == lastLoginIp) &&
            (identical(other.platfrom, platfrom) ||
                other.platfrom == platfrom));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        userId,
        registerType,
        mobile,
        nationalCode,
        email,
        bindGA,
        bindTradePwd,
        bindPassword,
        userType,
        verifyStatus,
        kycLevel,
        kycVerifyStatus,
        displayLevel,
        const DeepCollectionEquality().hash(_accounts),
        defaultAccountId,
        registerDate,
        source,
        inviteUserId,
        secondLevelInviteUserId,
        isAgent,
        const DeepCollectionEquality().hash(_customLabelList),
        antiPhishingCode,
        isComplianceVerify,
        lastLoginDate,
        lastLoginIp,
        platfrom
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      __$$UserDataImplCopyWithImpl<_$UserDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataImplToJson(
      this,
    );
  }
}

abstract class _UserData implements UserData {
  const factory _UserData(
      {final String? userId,
      final int? registerType,
      final String? mobile,
      final String? nationalCode,
      final String? email,
      final bool? bindGA,
      final bool? bindTradePwd,
      final bool? bindPassword,
      final int? userType,
      final int? verifyStatus,
      final int? kycLevel,
      final int? kycVerifyStatus,
      final String? displayLevel,
      final List<dynamic>? accounts,
      final String? defaultAccountId,
      final String? registerDate,
      final String? source,
      final String? inviteUserId,
      final String? secondLevelInviteUserId,
      final int? isAgent,
      final List<dynamic>? customLabelList,
      final String? antiPhishingCode,
      final bool? isComplianceVerify,
      final String? lastLoginDate,
      final String? lastLoginIp,
      final String? platfrom}) = _$UserDataImpl;

  factory _UserData.fromJson(Map<String, dynamic> json) =
      _$UserDataImpl.fromJson;

  @override
  String? get userId;
  @override
  int? get registerType;
  @override
  String? get mobile;
  @override
  String? get nationalCode;
  @override
  String? get email;
  @override
  bool? get bindGA;
  @override
  bool? get bindTradePwd;
  @override
  bool? get bindPassword;
  @override
  int? get userType;
  @override
  int? get verifyStatus;
  @override
  int? get kycLevel;
  @override
  int? get kycVerifyStatus;
  @override
  String? get displayLevel;
  @override
  List<dynamic>? get accounts;
  @override
  String? get defaultAccountId;
  @override
  String? get registerDate;
  @override
  String? get source;
  @override
  String? get inviteUserId;
  @override
  String? get secondLevelInviteUserId;
  @override
  int? get isAgent;
  @override
  List<dynamic>? get customLabelList;
  @override
  String? get antiPhishingCode;
  @override
  bool? get isComplianceVerify;
  @override
  String? get lastLoginDate;
  @override
  String? get lastLoginIp;
  @override
  String? get platfrom;
  @override
  @JsonKey(ignore: true)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserEmailAuthorizeBody _$UserEmailAuthorizeBodyFromJson(
    Map<String, dynamic> json) {
  return _UserEmailAuthorizeBody.fromJson(json);
}

/// @nodoc
mixin _$UserEmailAuthorizeBody {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get captcha_response => throw _privateConstructorUsedError;
  String get captcha_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserEmailAuthorizeBodyCopyWith<UserEmailAuthorizeBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEmailAuthorizeBodyCopyWith<$Res> {
  factory $UserEmailAuthorizeBodyCopyWith(UserEmailAuthorizeBody value,
          $Res Function(UserEmailAuthorizeBody) then) =
      _$UserEmailAuthorizeBodyCopyWithImpl<$Res, UserEmailAuthorizeBody>;
  @useResult
  $Res call(
      {String email,
      String password,
      String captcha_response,
      String captcha_id});
}

/// @nodoc
class _$UserEmailAuthorizeBodyCopyWithImpl<$Res,
        $Val extends UserEmailAuthorizeBody>
    implements $UserEmailAuthorizeBodyCopyWith<$Res> {
  _$UserEmailAuthorizeBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? captcha_response = null,
    Object? captcha_id = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      captcha_response: null == captcha_response
          ? _value.captcha_response
          : captcha_response // ignore: cast_nullable_to_non_nullable
              as String,
      captcha_id: null == captcha_id
          ? _value.captcha_id
          : captcha_id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserEmailAuthorizeBodyImplCopyWith<$Res>
    implements $UserEmailAuthorizeBodyCopyWith<$Res> {
  factory _$$UserEmailAuthorizeBodyImplCopyWith(
          _$UserEmailAuthorizeBodyImpl value,
          $Res Function(_$UserEmailAuthorizeBodyImpl) then) =
      __$$UserEmailAuthorizeBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      String captcha_response,
      String captcha_id});
}

/// @nodoc
class __$$UserEmailAuthorizeBodyImplCopyWithImpl<$Res>
    extends _$UserEmailAuthorizeBodyCopyWithImpl<$Res,
        _$UserEmailAuthorizeBodyImpl>
    implements _$$UserEmailAuthorizeBodyImplCopyWith<$Res> {
  __$$UserEmailAuthorizeBodyImplCopyWithImpl(
      _$UserEmailAuthorizeBodyImpl _value,
      $Res Function(_$UserEmailAuthorizeBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? captcha_response = null,
    Object? captcha_id = null,
  }) {
    return _then(_$UserEmailAuthorizeBodyImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      captcha_response: null == captcha_response
          ? _value.captcha_response
          : captcha_response // ignore: cast_nullable_to_non_nullable
              as String,
      captcha_id: null == captcha_id
          ? _value.captcha_id
          : captcha_id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserEmailAuthorizeBodyImpl implements _UserEmailAuthorizeBody {
  const _$UserEmailAuthorizeBodyImpl(
      {required this.email,
      required this.password,
      required this.captcha_response,
      required this.captcha_id});

  factory _$UserEmailAuthorizeBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserEmailAuthorizeBodyImplFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String captcha_response;
  @override
  final String captcha_id;

  @override
  String toString() {
    return 'UserEmailAuthorizeBody(email: $email, password: $password, captcha_response: $captcha_response, captcha_id: $captcha_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEmailAuthorizeBodyImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.captcha_response, captcha_response) ||
                other.captcha_response == captcha_response) &&
            (identical(other.captcha_id, captcha_id) ||
                other.captcha_id == captcha_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, captcha_response, captcha_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEmailAuthorizeBodyImplCopyWith<_$UserEmailAuthorizeBodyImpl>
      get copyWith => __$$UserEmailAuthorizeBodyImplCopyWithImpl<
          _$UserEmailAuthorizeBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserEmailAuthorizeBodyImplToJson(
      this,
    );
  }
}

abstract class _UserEmailAuthorizeBody implements UserEmailAuthorizeBody {
  const factory _UserEmailAuthorizeBody(
      {required final String email,
      required final String password,
      required final String captcha_response,
      required final String captcha_id}) = _$UserEmailAuthorizeBodyImpl;

  factory _UserEmailAuthorizeBody.fromJson(Map<String, dynamic> json) =
      _$UserEmailAuthorizeBodyImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String get captcha_response;
  @override
  String get captcha_id;
  @override
  @JsonKey(ignore: true)
  _$$UserEmailAuthorizeBodyImplCopyWith<_$UserEmailAuthorizeBodyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserAuthorizeBody _$UserAuthorizeBodyFromJson(Map<String, dynamic> json) {
  return _UserAuthorizeBody.fromJson(json);
}

/// @nodoc
mixin _$UserAuthorizeBody {
  String? get login_type => throw _privateConstructorUsedError;
  String? get national_code => throw _privateConstructorUsedError;
  String? get mobile => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  num? get order_id => throw _privateConstructorUsedError;
  String? get verify_code => throw _privateConstructorUsedError;
  String? get is_oauth => throw _privateConstructorUsedError;
  String? get oauth_request_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAuthorizeBodyCopyWith<UserAuthorizeBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAuthorizeBodyCopyWith<$Res> {
  factory $UserAuthorizeBodyCopyWith(
          UserAuthorizeBody value, $Res Function(UserAuthorizeBody) then) =
      _$UserAuthorizeBodyCopyWithImpl<$Res, UserAuthorizeBody>;
  @useResult
  $Res call(
      {String? login_type,
      String? national_code,
      String? mobile,
      String? email,
      num? order_id,
      String? verify_code,
      String? is_oauth,
      String? oauth_request_id});
}

/// @nodoc
class _$UserAuthorizeBodyCopyWithImpl<$Res, $Val extends UserAuthorizeBody>
    implements $UserAuthorizeBodyCopyWith<$Res> {
  _$UserAuthorizeBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login_type = freezed,
    Object? national_code = freezed,
    Object? mobile = freezed,
    Object? email = freezed,
    Object? order_id = freezed,
    Object? verify_code = freezed,
    Object? is_oauth = freezed,
    Object? oauth_request_id = freezed,
  }) {
    return _then(_value.copyWith(
      login_type: freezed == login_type
          ? _value.login_type
          : login_type // ignore: cast_nullable_to_non_nullable
              as String?,
      national_code: freezed == national_code
          ? _value.national_code
          : national_code // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      order_id: freezed == order_id
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as num?,
      verify_code: freezed == verify_code
          ? _value.verify_code
          : verify_code // ignore: cast_nullable_to_non_nullable
              as String?,
      is_oauth: freezed == is_oauth
          ? _value.is_oauth
          : is_oauth // ignore: cast_nullable_to_non_nullable
              as String?,
      oauth_request_id: freezed == oauth_request_id
          ? _value.oauth_request_id
          : oauth_request_id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAuthorizeBodyImplCopyWith<$Res>
    implements $UserAuthorizeBodyCopyWith<$Res> {
  factory _$$UserAuthorizeBodyImplCopyWith(_$UserAuthorizeBodyImpl value,
          $Res Function(_$UserAuthorizeBodyImpl) then) =
      __$$UserAuthorizeBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? login_type,
      String? national_code,
      String? mobile,
      String? email,
      num? order_id,
      String? verify_code,
      String? is_oauth,
      String? oauth_request_id});
}

/// @nodoc
class __$$UserAuthorizeBodyImplCopyWithImpl<$Res>
    extends _$UserAuthorizeBodyCopyWithImpl<$Res, _$UserAuthorizeBodyImpl>
    implements _$$UserAuthorizeBodyImplCopyWith<$Res> {
  __$$UserAuthorizeBodyImplCopyWithImpl(_$UserAuthorizeBodyImpl _value,
      $Res Function(_$UserAuthorizeBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login_type = freezed,
    Object? national_code = freezed,
    Object? mobile = freezed,
    Object? email = freezed,
    Object? order_id = freezed,
    Object? verify_code = freezed,
    Object? is_oauth = freezed,
    Object? oauth_request_id = freezed,
  }) {
    return _then(_$UserAuthorizeBodyImpl(
      login_type: freezed == login_type
          ? _value.login_type
          : login_type // ignore: cast_nullable_to_non_nullable
              as String?,
      national_code: freezed == national_code
          ? _value.national_code
          : national_code // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      order_id: freezed == order_id
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as num?,
      verify_code: freezed == verify_code
          ? _value.verify_code
          : verify_code // ignore: cast_nullable_to_non_nullable
              as String?,
      is_oauth: freezed == is_oauth
          ? _value.is_oauth
          : is_oauth // ignore: cast_nullable_to_non_nullable
              as String?,
      oauth_request_id: freezed == oauth_request_id
          ? _value.oauth_request_id
          : oauth_request_id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAuthorizeBodyImpl implements _UserAuthorizeBody {
  const _$UserAuthorizeBodyImpl(
      {this.login_type,
      this.national_code,
      this.mobile,
      this.email,
      this.order_id,
      this.verify_code,
      this.is_oauth,
      this.oauth_request_id});

  factory _$UserAuthorizeBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAuthorizeBodyImplFromJson(json);

  @override
  final String? login_type;
  @override
  final String? national_code;
  @override
  final String? mobile;
  @override
  final String? email;
  @override
  final num? order_id;
  @override
  final String? verify_code;
  @override
  final String? is_oauth;
  @override
  final String? oauth_request_id;

  @override
  String toString() {
    return 'UserAuthorizeBody(login_type: $login_type, national_code: $national_code, mobile: $mobile, email: $email, order_id: $order_id, verify_code: $verify_code, is_oauth: $is_oauth, oauth_request_id: $oauth_request_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAuthorizeBodyImpl &&
            (identical(other.login_type, login_type) ||
                other.login_type == login_type) &&
            (identical(other.national_code, national_code) ||
                other.national_code == national_code) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.order_id, order_id) ||
                other.order_id == order_id) &&
            (identical(other.verify_code, verify_code) ||
                other.verify_code == verify_code) &&
            (identical(other.is_oauth, is_oauth) ||
                other.is_oauth == is_oauth) &&
            (identical(other.oauth_request_id, oauth_request_id) ||
                other.oauth_request_id == oauth_request_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, login_type, national_code,
      mobile, email, order_id, verify_code, is_oauth, oauth_request_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAuthorizeBodyImplCopyWith<_$UserAuthorizeBodyImpl> get copyWith =>
      __$$UserAuthorizeBodyImplCopyWithImpl<_$UserAuthorizeBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAuthorizeBodyImplToJson(
      this,
    );
  }
}

abstract class _UserAuthorizeBody implements UserAuthorizeBody {
  const factory _UserAuthorizeBody(
      {final String? login_type,
      final String? national_code,
      final String? mobile,
      final String? email,
      final num? order_id,
      final String? verify_code,
      final String? is_oauth,
      final String? oauth_request_id}) = _$UserAuthorizeBodyImpl;

  factory _UserAuthorizeBody.fromJson(Map<String, dynamic> json) =
      _$UserAuthorizeBodyImpl.fromJson;

  @override
  String? get login_type;
  @override
  String? get national_code;
  @override
  String? get mobile;
  @override
  String? get email;
  @override
  num? get order_id;
  @override
  String? get verify_code;
  @override
  String? get is_oauth;
  @override
  String? get oauth_request_id;
  @override
  @JsonKey(ignore: true)
  _$$UserAuthorizeBodyImplCopyWith<_$UserAuthorizeBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
