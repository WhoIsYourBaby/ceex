import "package:freezed_annotation/freezed_annotation.dart";
import "package:flutter/foundation.dart";

part "assets_balance_flow_model.freezed.dart";
part "assets_balance_flow_model.g.dart";

/// 资产动态
@freezed
class AssetsBalanceFlowModel with _$AssetsBalanceFlowModel {
  const factory AssetsBalanceFlowModel({
    String? id,
    String? accountId,
    String? tokenId,
    String? tokenName,
    String? flowType,
    String? change,
    String? total,
    String? created,
  }) = _AssetsBalanceFlowModel;

  factory AssetsBalanceFlowModel.fromJson(Map<String, Object?> json) =>
      _$AssetsBalanceFlowModelFromJson(json);
}