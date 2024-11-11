// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_photo_verify_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KycPhotoVerifyModelImpl _$$KycPhotoVerifyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$KycPhotoVerifyModelImpl(
      kycLevel: json['kycLevel'] as int?,
      faceCompare: json['faceCompare'] as bool?,
      sdkPrepareInfo: json['sdkPrepareInfo'] == null
          ? null
          : SdkPrepareInfoModel.fromJson(
              json['sdkPrepareInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$KycPhotoVerifyModelImplToJson(
        _$KycPhotoVerifyModelImpl instance) =>
    <String, dynamic>{
      'kycLevel': instance.kycLevel,
      'faceCompare': instance.faceCompare,
      'sdkPrepareInfo': instance.sdkPrepareInfo,
    };

_$SdkPrepareInfoModelImpl _$$SdkPrepareInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SdkPrepareInfoModelImpl(
      appId: json['appId'] as String?,
      version: json['version'] as String?,
      nonce: json['nonce'] as String?,
      sign: json['sign'] as String?,
      orderNo: json['orderNo'] as String?,
      faceId: json['faceId'] as String?,
      userId: json['userId'] as String?,
      license: json['license'] as String?,
    );

Map<String, dynamic> _$$SdkPrepareInfoModelImplToJson(
        _$SdkPrepareInfoModelImpl instance) =>
    <String, dynamic>{
      'appId': instance.appId,
      'version': instance.version,
      'nonce': instance.nonce,
      'sign': instance.sign,
      'orderNo': instance.orderNo,
      'faceId': instance.faceId,
      'userId': instance.userId,
      'license': instance.license,
    };
