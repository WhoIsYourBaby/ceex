import "package:freezed_annotation/freezed_annotation.dart";

part "invitation_bonus_model.freezed.dart";
part "invitation_bonus_model.g.dart";

// 获取邀请返佣配置模板信息(邀请返佣的模板在PC端或者APP端生成)
@freezed
class InvitationBonusModel with _$InvitationBonusModel {
  const factory InvitationBonusModel({
    double? totalBonusCoins,
    double? totalBonusPoints,
    List<RecordListModel>? recordList,
  }) = _InvitationBonusModel;

  factory InvitationBonusModel.fromJson(Map<String, Object?> json) =>
      _$InvitationBonusModelFromJson(json);
}


@freezed
class RecordListModel with _$RecordListModel {
  const factory RecordListModel({
    String? id,
    String? userId,// 邀请注册用户id
    String? token,// 币种
    int? bonusAmount, //数量
    String? statisticsTime,// 日期
  }) = _RecordListModel;

  factory RecordListModel.fromJson(Map<String, Object?> json) =>
      _$RecordListModelFromJson(json);
}