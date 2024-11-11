import "package:freezed_annotation/freezed_annotation.dart";
import "package:flutter/foundation.dart";

part "announcement_model.freezed.dart";
part "announcement_model.g.dart";

/// 通告
@freezed
class AnnouncementModel with _$AnnouncementModel {
  const factory AnnouncementModel({
    String? title,
    String? detail,
    bool? isDirect,
    String? directUrl,
    String? publishTime,
    int? sort,
  }) = _AnnouncementModel;

  factory AnnouncementModel.fromJson(Map<String, Object?> json) =>
      _$AnnouncementModelFromJson(json);
}
