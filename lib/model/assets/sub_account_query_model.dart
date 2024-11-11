import "package:freezed_annotation/freezed_annotation.dart";
import "package:flutter/foundation.dart";

part "sub_account_query_model.freezed.dart";
part "sub_account_query_model.g.dart";

@freezed
class SubAccountQueryModel with _$SubAccountQueryModel {
  const factory SubAccountQueryModel({
    String? accountId,
    String? accountName,
    int? accountType,
    int? accountIndex,
    bool? canChoose,
  }) = _SubAccountQueryModel;

  factory SubAccountQueryModel.fromJson(Map<String, Object?> json) =>
      _$SubAccountQueryModelFromJson(json);
  // 添加 set 方法
}