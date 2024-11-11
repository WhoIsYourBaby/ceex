// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_authentication_information_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KycAuthenticationInformationModelImpl
    _$$KycAuthenticationInformationModelImplFromJson(
            Map<String, dynamic> json) =>
        _$KycAuthenticationInformationModelImpl(
          kycLevel: json['kycLevel'] as int?,
          displayLevel: json['displayLevel'] as String?,
          countryCode: json['countryCode'] as String?,
          faceCompare: json['faceCompare'] as bool?,
          otcDailyLimit: json['otcDailyLimit'] as String?,
          otcLimitCurrency: json['otcLimitCurrency'] as String?,
          withdrawDailyLimit: json['withdrawDailyLimit'] as String?,
          withdrawLimitToken: json['withdrawLimitToken'] as String?,
          verifyStatus: json['verifyStatus'] as int?,
          allowVerify: json['allowVerify'] as bool?,
          videoAgreement: json['videoAgreement'] as String?,
        );

Map<String, dynamic> _$$KycAuthenticationInformationModelImplToJson(
        _$KycAuthenticationInformationModelImpl instance) =>
    <String, dynamic>{
      'kycLevel': instance.kycLevel,
      'displayLevel': instance.displayLevel,
      'countryCode': instance.countryCode,
      'faceCompare': instance.faceCompare,
      'otcDailyLimit': instance.otcDailyLimit,
      'otcLimitCurrency': instance.otcLimitCurrency,
      'withdrawDailyLimit': instance.withdrawDailyLimit,
      'withdrawLimitToken': instance.withdrawLimitToken,
      'verifyStatus': instance.verifyStatus,
      'allowVerify': instance.allowVerify,
      'videoAgreement': instance.videoAgreement,
    };
