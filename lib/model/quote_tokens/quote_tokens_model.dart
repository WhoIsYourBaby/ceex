import "package:freezed_annotation/freezed_annotation.dart";
import "package:flutter/foundation.dart";

part "quote_tokens_model.freezed.dart";
part "quote_tokens_model.g.dart";

/// 币种token列表
/**
 * [{"addressCount":0,
 * "allowDeposit":true,
 * "allowWithdraw":true,
 * "baseTokenSymbols":
 *    [{"allowMargin":false,
 * "allowPlan":true,
 * "amountDigit":0,
 * "baseDigit":0,
 * "basePrecision":"0.1",
 * "baseTokenId":"1INCH",
 * "baseTokenName":"1INCH",
 * "buyMode":true,
 * "canTrade":true,
 * "category":1,"
 * coinType":0,
 * "customOrder":0,
 * "digitMerge":"0.01,0.001,0.0001",
 * "exchangeId":"301",
 * "favorite":false,
 * "indexRecommendOrder":0,
 * "isNeedSwitchTradeTab":false,
 * "isReverse":false,
 * "itemShowType":0,
 * "labelId":"0",
 * "minPricePrecision":"0.0001",
 * "minTradeAmount":"5",
 * "minTradeQuantity":"1.3",
 * "openStatus":true,
 * "orgId":"6066",
 * "priceDigit":0,
 * "quotePrecision":"0.001",
 * "quoteTokenId":"USDT",
 * "quoteTokenName":"USDT",
 * "select":false,
 * "showStatus":true,
 * "symbolId":"1INCHUSDT",
 * "symbolName":"1INCHUSDT"}],
 * "chainTypes":[],
 * "customOrder":0,
 * "iconUrl":"https://s2.coinmarketcap.com/static/img/coins/64x64/8104.png",
 * "isEOS":false,
 * "isHighRiskToken":false,
 * "needAddressTag":false,
 * "needKycQuantity":"0",
 * "orgId":"6066",
 * "tokenFullName":"1inch Network",
 * "tokenId":"1INCH",
 * "tokenName":"1INCH",
 * "tokenType":"ERC20_TOKEN"}]
 */
@freezed
class QuoteTokensModel with _$QuoteTokensModel {
  const factory QuoteTokensModel({
    required int? addressCount,
    required bool? allowDeposit,
    required bool? allowWithdraw,
    required List<BaseTokenSymbolsModel> baseTokenSymbols,
    required List<ChainTypeModel>? chainTypes,
    required int? customOrder,
    required String? iconUrl,
    required bool? isEOS,
    required bool? isHighRiskToken,
    required bool? needAddressTag,
    required String? needKycQuantity,
    required String? orgId,
    required String? tokenFullName,
    required String? tokenId,
    required String? tokenName,
    required String? tokenType,
  }) = _QuoteTokensModel;

  factory QuoteTokensModel.fromJson(Map<String, dynamic> json) =>
      _$QuoteTokensModelFromJson(json);
}

@freezed
class BaseTokenSymbolsModel with _$BaseTokenSymbolsModel {
  const factory BaseTokenSymbolsModel({
    required bool? allowMargin,
    required bool? allowPlan,
    required int? amountDigit,
    required int? baseDigit,
    required String? basePrecision,
    required String? baseTokenId,
    required String? baseTokenName,
    required bool? buyMode,
    required bool? canTrade,
    required int? category,
    required int? coinType,
    required int? customOrder,
    required String? digitMerge,
    required String? exchangeId,
    required bool? favorite,
    required int? indexRecommendOrder,
    required bool? isNeedSwitchTradeTab,
    required bool? isReverse,
    required int? itemShowType,
    required String? labelId,
    required String? minPricePrecision,
    required String? minTradeAmount,
    required String? minTradeQuantity,
    required bool? openStatus,
    required String? orgId,
    required int? priceDigit,
    required String? quotePrecision,
    required String? quoteTokenId,
    required String? quoteTokenName,
    required bool? select,
    required bool? showStatus,
    required String? symbolId,
    required String? symbolName,
  }) = _BaseTokenSymbolsModel;

  factory BaseTokenSymbolsModel.fromJson(Map<String, dynamic> json) =>
      _$BaseTokenSymbolsModelFromJson(json);
}


@freezed
class ChainTypeModel with _$ChainTypeModel {
  const factory ChainTypeModel({
    required String? chainType,
    required bool? allowDeposit,
    required bool? allowWithdraw,
    required bool? select,//是否选中（本地标记）
  }) = _ChainTypeModel;

  factory ChainTypeModel.fromJson(Map<String, dynamic> json) =>
      _$ChainTypeModelFromJson(json);
}