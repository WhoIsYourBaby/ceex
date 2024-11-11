import "package:freezed_annotation/freezed_annotation.dart";
import "package:flutter/foundation.dart";

part "symbol_model.freezed.dart";
part "symbol_model.g.dart";

/// symbol币对
@freezed
class SymbolModel with _$SymbolModel {
  const factory SymbolModel({
    String? orgId,
    String? exchangeId,
    String? symbolId,
    String? symbolName,
    String? baseTokenId,
    String? baseTokenName,
    String? quoteTokenId,
    String? quoteTokenName,
    String? basePrecision,
    String? quotePrecision,
    String? minTradeQuantity,
    String? minTradeAmount,
    String? minPricePrecision,
    String? digitMerge,
    bool? canTrade,
    int? customOrder,
    bool? isAggregate,
    int? indexRecommendOrder,
    bool? showStatus,
    int? category,
    bool? allowMargin,
    String? labelId,
    String? iconUrl,
    bool? allowPlan,
  }) = _SymbolModel;

  factory SymbolModel.fromJson(Map<String, Object?> json) =>
      _$SymbolModelFromJson(json);
}

/// token币
@freezed
class TokenModel with _$TokenModel {
  const factory TokenModel({
    String? orgId,
    String? tokenId,
    String? tokenName,
    String? tokenFullName,
    String? iconUrl,
    bool? allowWithdraw,
    bool? allowDeposit,
    bool? isHighRiskToken,
    bool? isEOS,
    String? tokenType,
    bool? needAddressTag,
    String? needKycQuantity,
    int? customOrder,
    List<SymbolModel>? baseTokenSymbols,
    List<ChainTypesModel>? chainTypes,
  }) = _TokenModel;

  factory TokenModel.fromJson(Map<String, Object?> json) =>
      _$TokenModelFromJson(json);
}

/// token简介
@freezed
class TokenInfoModel with _$TokenInfoModel {
  const factory TokenInfoModel({
    String? tokenId,
    String? tokenName,
    String? maxQuantitySupplied,
    String? currentTurnover,
    String? officialWebsiteUrl,
    String? whitePaperUrl,
    String? publishTime,
    String? exploreUrl,
    String? description,
  }) = _TokenInfoModel;

  factory TokenInfoModel.fromJson(Map<String, Object?> json) =>
      _$TokenInfoModelFromJson(json);
}

/// token 币币 网络类型
@freezed
class ChainTypesModel with _$ChainTypesModel {
  const factory ChainTypesModel({
    String? chainType,
    bool? allowDeposit,
    bool? allowWithdraw,
  }) = _ChainTypesModel;

  factory ChainTypesModel.fromJson(Map<String, Object?> json) =>
      _$ChainTypesModelFromJson(json);
}
