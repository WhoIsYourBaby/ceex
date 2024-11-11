import "package:freezed_annotation/freezed_annotation.dart";

part "invitation_relation_model.freezed.dart";
part "invitation_relation_model.g.dart";

// 获取邀请返佣配置模板信息(邀请返佣的模板在PC端或者APP端生成)
@freezed
class InvitationRelationModel with _$InvitationRelationModel {
  const factory InvitationRelationModel({
    int? status,
    List<InvitationDataModel>? data,
  }) = _InvitationRelationModel;

  factory InvitationRelationModel.fromJson(Map<String, Object?> json) =>
      _$InvitationRelationModelFromJson(json);
}

@freezed
class InvitationDataModel with _$InvitationDataModel {
  const factory InvitationDataModel({
    String? inviteId,
    String? userId,// 邀请注册用户id
    String? nationalCode,// 手机号对应的国家区号
    String? mobile,// 手机号
    String? email,// 邮箱
    int? registerType,// 注册方式
    int? verifyStatus, // kyc状态: 0 未提交 1 审核中 2 审核通过 3 审核不通过
    String? inviteType,// 邀请类型 1 直接邀请 2 简介邀请
    String? registerDate,// 注册时间
  }) = _InvitationDataModel;

  factory InvitationDataModel.fromJson(Map<String, Object?> json) =>
      _$InvitationDataModelFromJson(json);
}