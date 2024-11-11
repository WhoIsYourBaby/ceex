import "package:freezed_annotation/freezed_annotation.dart";
import "package:flutter/foundation.dart";

part "assets_info_model.freezed.dart";
part "assets_info_model.g.dart";

@freezed
class AssetsInfoModel with _$AssetsInfoModel {
  const factory AssetsInfoModel({
    String? coinAsset,
    String? optionAsset,
    String? optionCoinAsset,
    String? financeAsset,
    String? futuresCoinAsset,
    String? totalAsset,
    String? unit,
    String? activeCoinAsset,
    String? stakingAsset,
    List? subAccountBalances,
  }) = _AssetsInfoModel;

  factory AssetsInfoModel.fromJson(Map<String, Object?> json) =>
      _$AssetsInfoModelFromJson(json);
}