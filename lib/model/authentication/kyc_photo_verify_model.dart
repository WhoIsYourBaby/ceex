import 'package:freezed_annotation/freezed_annotation.dart';

part 'kyc_photo_verify_model.freezed.dart';
part 'kyc_photo_verify_model.g.dart';

@freezed
class KycPhotoVerifyModel with _$KycPhotoVerifyModel {
  const factory KycPhotoVerifyModel({
    int? kycLevel, // kyc认证级别
    bool? faceCompare, // 是否需要人脸活体检测 true=需要 false=不需要
    SdkPrepareInfoModel? sdkPrepareInfo, // 三级kyc视频文案
  }) = _KycPhotoVerifyModel;

  factory KycPhotoVerifyModel.fromJson(Map<String, Object?> json) =>
      _$KycPhotoVerifyModelFromJson(json);
}

/// appId : TIDAtcnV
/// version : 1.0.0
/// nonce : 47004e3d51024457854abf94f2acaa3e
/// sign : DCD98C4316712CC4D134884BDCF98B4CFFACD10A
/// orderNo : 499256968280847872
/// license : PyqW0mN970gX4obvaZiKoYmpUrdiGUbp9qeK1iBzXNYODNX3xZ0Ahyl9ihqb7fHUiZT9e/saREhooFScpLLzLM9yydl6iY5yyPRLoVvIhCdqbiEgiAKN6GKOT1bSrOG7G+LwNJyTL0ajq20ZE2ROc9rrkR0M9zdt0YSiPICjim9nk/lqFWLjT+RS40hDrKUKZageNBd+Wah1NgSWK4TIs5MFf8chLubuj4VzZczuNjlpjqH2Xjuz/RKJ2hfqh0QHOtTT3B3SWixuScalB1i5mQaLH8bf8IoM7IEbeLnGEJqXtqjhOU2TEP1rEWnkelGn3l9qcT0On5TWgS4fBRldUA==
/// userId : 240377112295636992
/// faceId : 27c0efa39353d94806f2cbf8e073ab45

@freezed
class SdkPrepareInfoModel with _$SdkPrepareInfoModel {
  const factory SdkPrepareInfoModel({
    String? appId, // appid
    String? version, // 版本号
    String? nonce, // 32位的随机字符串 nonceStr
    String? sign, // 签名
    String? orderNo, // 第三方KYC认证订单号
    String? faceId, // 第三方KYC认证faceId
    String? userId, // 唯一用户标识
    String? license, // 第三方KYC认证license
  }) = _SdkPrepareInfoModel;

  factory SdkPrepareInfoModel.fromJson(Map<String, Object?> json) =>
      _$SdkPrepareInfoModelFromJson(json);
}
