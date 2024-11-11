import "package:freezed_annotation/freezed_annotation.dart";

part "invitation_info_model.freezed.dart";
part "invitation_info_model.g.dart";

// 获取邀请返佣配置模板信息(邀请返佣的模板在PC端或者APP端生成)
@freezed
class InvitationInfoModel with _$InvitationInfoModel {
  const factory InvitationInfoModel({
    String? inviteCode,//券商Logo
    InvitationInfoDtoModel? inviteInfoDTO,
  }) = _InvitationInfoModel;

  factory InvitationInfoModel.fromJson(Map<String, Object?> json) =>
      _$InvitationInfoModelFromJson(json);
}

@freezed
class InvitationInfoDtoModel with _$InvitationInfoDtoModel {
  const factory InvitationInfoDtoModel({
    String? userId,//券商Logo
    int? inviteCount,// 总邀请数
    int? inviteVaildCount, // 有效邀请数
    int? inviteDirectVaildCount,// 直接邀请数
    int? inviteIndirectVaildCount,// 间接邀请数
    int? inviteLevel,//邀请等级
    double? directRate,
    double? indirectRate,
    double? bonusCoin,
    double? bonusPoint,
  }) = _InvitationInfoDtoModel;

  factory InvitationInfoDtoModel.fromJson(Map<String, Object?> json) =>
      _$InvitationInfoDtoModelFromJson(json);
}