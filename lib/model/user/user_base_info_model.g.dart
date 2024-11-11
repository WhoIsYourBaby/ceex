// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_base_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserBaseInfoModelImpl _$$UserBaseInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserBaseInfoModelImpl(
      code: json['code'] as int?,
      msg: json['msg'] as String?,
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
      accountsModel: (json['accountsModel'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      defaultAccountId: json['defaultAccountId'] as String?,
      registerDate: json['registerDate'] as String?,
      openOption: json['openOption'] as bool?,
      openFuture: json['openFuture'] as bool?,
      openMargin: json['openMargin'] as bool?,
      learnWithdraw: json['learnWithdraw'] as bool?,
      learnDeposit: json['learnDeposit'] as bool?,
      favorites: (json['favorites'] as List<dynamic>?)
          ?.map((e) => FavoriteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      source: json['source'] as String?,
      isAgent: json['isAgent'] as int?,
      customLabelList: (json['customLabelList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      levelNames: (json['levelNames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      leader: json['leader'] as int?,
      isHobbit: json['isHobbit'] as int?,
      antiPhishingCode: json['antiPhishingCode'] as String?,
      isComplianceVerify: json['isComplianceVerify'] as bool?,
      lastLoginDate: json['lastLoginDate'] as String?,
      lastLoginIp: json['lastLoginIp'] as String?,
      platfrom: json['platfrom'] as String?,
    );

Map<String, dynamic> _$$UserBaseInfoModelImplToJson(
        _$UserBaseInfoModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
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
      'accountsModel': instance.accountsModel,
      'defaultAccountId': instance.defaultAccountId,
      'registerDate': instance.registerDate,
      'openOption': instance.openOption,
      'openFuture': instance.openFuture,
      'openMargin': instance.openMargin,
      'learnWithdraw': instance.learnWithdraw,
      'learnDeposit': instance.learnDeposit,
      'favorites': instance.favorites,
      'source': instance.source,
      'isAgent': instance.isAgent,
      'customLabelList': instance.customLabelList,
      'levelNames': instance.levelNames,
      'leader': instance.leader,
      'isHobbit': instance.isHobbit,
      'antiPhishingCode': instance.antiPhishingCode,
      'isComplianceVerify': instance.isComplianceVerify,
      'lastLoginDate': instance.lastLoginDate,
      'lastLoginIp': instance.lastLoginIp,
      'platfrom': instance.platfrom,
    };
