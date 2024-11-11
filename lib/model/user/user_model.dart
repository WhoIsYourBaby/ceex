import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    bool? bindMobile,
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
    UserData? user,
    }) = _UserModel;
  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}

@freezed
class FindPwdModel with _$FindPwdModel {
  const factory FindPwdModel({
     bool? success,
    bool? needFrozenLogin,
    
    }) = _FindPwdModel;

  factory FindPwdModel.fromJson(Map<String, Object?> json) =>
      _$FindPwdModelFromJson(json);
}

@freezed
class UserCookie with _$UserCookie {
  const factory UserCookie({
    String? au_token,
    String? c_token,
    }) = _UserCookie;

  factory UserCookie.fromJson(Map<String, Object?> json) =>
      _$UserCookieFromJson(json);
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    String? userId,
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
    String? platfrom,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

/// 邮箱登录 
@freezed
class UserEmailAuthorizeBody with _$UserEmailAuthorizeBody {
  const factory UserEmailAuthorizeBody({
    required String email, 
    required String password,
    required String captcha_response,
    required String captcha_id,
    }) = _UserEmailAuthorizeBody;

  factory UserEmailAuthorizeBody.fromJson(Map<String, Object?> json) =>
      _$UserEmailAuthorizeBodyFromJson(json);
}


/// 快捷登录 - 创建认证身份 post body
/// login_type string必填 快捷登录方式 mobile or email
/// national_code string必填 国家代码 login_type=mobile的时候必须有值
/// mobile string必填 手机号 login_type=mobile的时候必须有值
/// email string必填 邮箱 login_type=email的时候必须有值
/// order_id long必填 请求验证码返回的order_id
/// verify_code string必填 验证码
/// is_oauth string选填 是否用于oauth 默认false
/// oauth_request_id string选填 oauth请求的request_id
@freezed
class UserAuthorizeBody with _$UserAuthorizeBody {
  const factory UserAuthorizeBody({
    String? login_type,
    String? national_code,
    String? mobile,
    String? email,
    num? order_id,
    String? verify_code,
    String? is_oauth,
    String? oauth_request_id,
  }) = _UserAuthorizeBody;


  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory UserAuthorizeBody.fromJson(Map<String, dynamic> json) =>
      _$UserAuthorizeBodyFromJson(json);
}
