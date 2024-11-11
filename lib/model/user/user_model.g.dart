// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      bindMobile: json['bindMobile'] as bool?,
      bindEmail: json['bindEmail'] as bool?,
      bindGA: json['bindGA'] as bool?,
      need2FA: json['need2FA'] as bool?,
      authType: json['authType'] as String?,
      requestId: json['requestId'] as String?,
      timeLeft: json['timeLeft'] as String?,
      userId: json['userId'] as String?,
      defaultAccountId: json['defaultAccountId'] as String?,
      registerType: json['registerType'] as int?,
      nationalCode: json['nationalCode'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      user: json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'bindMobile': instance.bindMobile,
      'bindEmail': instance.bindEmail,
      'bindGA': instance.bindGA,
      'need2FA': instance.need2FA,
      'authType': instance.authType,
      'requestId': instance.requestId,
      'timeLeft': instance.timeLeft,
      'userId': instance.userId,
      'defaultAccountId': instance.defaultAccountId,
      'registerType': instance.registerType,
      'nationalCode': instance.nationalCode,
      'mobile': instance.mobile,
      'email': instance.email,
      'user': instance.user,
    };

_$FindPwdModelImpl _$$FindPwdModelImplFromJson(Map<String, dynamic> json) =>
    _$FindPwdModelImpl(
      success: json['success'] as bool?,
      needFrozenLogin: json['needFrozenLogin'] as bool?,
    );

Map<String, dynamic> _$$FindPwdModelImplToJson(_$FindPwdModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'needFrozenLogin': instance.needFrozenLogin,
    };

_$UserCookieImpl _$$UserCookieImplFromJson(Map<String, dynamic> json) =>
    _$UserCookieImpl(
      au_token: json['au_token'] as String?,
      c_token: json['c_token'] as String?,
    );

Map<String, dynamic> _$$UserCookieImplToJson(_$UserCookieImpl instance) =>
    <String, dynamic>{
      'au_token': instance.au_token,
      'c_token': instance.c_token,
    };

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      userId: json['userId'] as String?,
      registerType: json['registerType'] as int?,
      mobile: json['mobile'] as String?,
      nationalCode: json['nationalCode'] as String?,
      email: json['email'] as String?,
      bindGA: json['bindGA'] as bool?,
      bindTradePwd: json['bindTradePwd'] as bool?,
      bindPassword: json['bindPassword'] as bool?,
      userType: json['userType'] as int?,
      verifyStatus: json['verifyStatus'] as int?,
      kycLevel: json['kycLevel'] as int?,
      kycVerifyStatus: json['kycVerifyStatus'] as int?,
      displayLevel: json['displayLevel'] as String?,
      accounts: json['accounts'] as List<dynamic>?,
      defaultAccountId: json['defaultAccountId'] as String?,
      registerDate: json['registerDate'] as String?,
      source: json['source'] as String?,
      inviteUserId: json['inviteUserId'] as String?,
      secondLevelInviteUserId: json['secondLevelInviteUserId'] as String?,
      isAgent: json['isAgent'] as int?,
      customLabelList: json['customLabelList'] as List<dynamic>?,
      antiPhishingCode: json['antiPhishingCode'] as String?,
      isComplianceVerify: json['isComplianceVerify'] as bool?,
      lastLoginDate: json['lastLoginDate'] as String?,
      lastLoginIp: json['lastLoginIp'] as String?,
      platfrom: json['platfrom'] as String?,
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'registerType': instance.registerType,
      'mobile': instance.mobile,
      'nationalCode': instance.nationalCode,
      'email': instance.email,
      'bindGA': instance.bindGA,
      'bindTradePwd': instance.bindTradePwd,
      'bindPassword': instance.bindPassword,
      'userType': instance.userType,
      'verifyStatus': instance.verifyStatus,
      'kycLevel': instance.kycLevel,
      'kycVerifyStatus': instance.kycVerifyStatus,
      'displayLevel': instance.displayLevel,
      'accounts': instance.accounts,
      'defaultAccountId': instance.defaultAccountId,
      'registerDate': instance.registerDate,
      'source': instance.source,
      'inviteUserId': instance.inviteUserId,
      'secondLevelInviteUserId': instance.secondLevelInviteUserId,
      'isAgent': instance.isAgent,
      'customLabelList': instance.customLabelList,
      'antiPhishingCode': instance.antiPhishingCode,
      'isComplianceVerify': instance.isComplianceVerify,
      'lastLoginDate': instance.lastLoginDate,
      'lastLoginIp': instance.lastLoginIp,
      'platfrom': instance.platfrom,
    };

_$UserEmailAuthorizeBodyImpl _$$UserEmailAuthorizeBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$UserEmailAuthorizeBodyImpl(
      email: json['email'] as String,
      password: json['password'] as String,
      captcha_response: json['captcha_response'] as String,
      captcha_id: json['captcha_id'] as String,
    );

Map<String, dynamic> _$$UserEmailAuthorizeBodyImplToJson(
        _$UserEmailAuthorizeBodyImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'captcha_response': instance.captcha_response,
      'captcha_id': instance.captcha_id,
    };

_$UserAuthorizeBodyImpl _$$UserAuthorizeBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$UserAuthorizeBodyImpl(
      login_type: json['login_type'] as String?,
      national_code: json['national_code'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      order_id: json['order_id'] as num?,
      verify_code: json['verify_code'] as String?,
      is_oauth: json['is_oauth'] as String?,
      oauth_request_id: json['oauth_request_id'] as String?,
    );

Map<String, dynamic> _$$UserAuthorizeBodyImplToJson(
        _$UserAuthorizeBodyImpl instance) =>
    <String, dynamic>{
      'login_type': instance.login_type,
      'national_code': instance.national_code,
      'mobile': instance.mobile,
      'email': instance.email,
      'order_id': instance.order_id,
      'verify_code': instance.verify_code,
      'is_oauth': instance.is_oauth,
      'oauth_request_id': instance.oauth_request_id,
    };
