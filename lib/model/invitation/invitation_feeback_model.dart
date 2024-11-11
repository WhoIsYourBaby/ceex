import "package:freezed_annotation/freezed_annotation.dart";

part "invitation_feeback_model.freezed.dart";
part "invitation_feeback_model.g.dart";

// 获取邀请返佣配置模板信息(邀请返佣的模板在PC端或者APP端生成)
@freezed
class InvitationFeebackModel with _$InvitationFeebackModel {
  const factory InvitationFeebackModel({
    String? id,
    String? actId,
    int? level,// 等级
    String? levelTag,// 标签名称
    double? levelCondition,// 等级条件
    double? directRate,//直接费率
    double? indirectRate,// 间接费率
  }) = _InvitationFeebackModel;

  factory InvitationFeebackModel.fromJson(Map<String, Object?> json) =>
      _$InvitationFeebackModelFromJson(json);
}
