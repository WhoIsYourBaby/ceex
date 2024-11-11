import 'package:freezed_annotation/freezed_annotation.dart';

part 'kyc_authentication_information_model.freezed.dart';
part 'kyc_authentication_information_model.g.dart';

@freezed
class KycAuthenticationInformationModel with _$KycAuthenticationInformationModel {
  const factory KycAuthenticationInformationModel({
    int? kycLevel,// kyc认证级别
    String? displayLevel,// 显示的kyc级别
    String? countryCode,// 国家代码
    bool? faceCompare,// 是否走人脸识别
    String? otcDailyLimit,// otc每日限额
    String? otcLimitCurrency,// 限额货币单位
    String? withdrawDailyLimit,// 提币每日限额
    String? withdrawLimitToken,// 提币限额计价token
    int? verifyStatus,// 当前级别的认证状态 0未提交审核 1审核中 2审核通过 3未通过审核
    bool? allowVerify,// 是否允许认证 true=允许 false=不允许
    String? videoAgreement,// 三级kyc视频文案
  }) = _KycAuthenticationInformationModel;

  factory KycAuthenticationInformationModel.fromJson(Map<String, Object?> json) =>
      _$KycAuthenticationInformationModelFromJson(json);
}
