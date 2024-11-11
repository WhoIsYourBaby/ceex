import "package:freezed_annotation/freezed_annotation.dart";

part "invitation_temp_model.freezed.dart";
part "invitation_temp_model.g.dart";

// 获取邀请返佣配置模板信息(邀请返佣的模板在PC端或者APP端生成)
@freezed
class InvitationTempModel with _$InvitationTempModel {
  const factory InvitationTempModel({
    String? brokerLogoUrl,//券商Logo
    String? shareContent,// 分享内容
    String? posterUrl,// 海报模板URL
    String? shareTitle,// 分享标题
    String? inviteCode,// 邀请码
    String? shareUrl,// 分享链接（注册链接，海报二维码也是根据这个生成的）
    String? brokerName,// 券商简称
    List<String>? posterUrls,// 海报模板URL
  }) = _InvitationTempModel;

  factory InvitationTempModel.fromJson(Map<String, Object?> json) =>
      _$InvitationTempModelFromJson(json);
}