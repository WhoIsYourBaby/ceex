// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_tokens_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuoteTokensModelImpl _$$QuoteTokensModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuoteTokensModelImpl(
      addressCount: json['addressCount'] as int?,
      allowDeposit: json['allowDeposit'] as bool?,
      allowWithdraw: json['allowWithdraw'] as bool?,
      baseTokenSymbols: (json['baseTokenSymbols'] as List<dynamic>)
          .map((e) => BaseTokenSymbolsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      chainTypes: (json['chainTypes'] as List<dynamic>?)
          ?.map((e) => ChainTypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      customOrder: json['customOrder'] as int?,
      iconUrl: json['iconUrl'] as String?,
      isEOS: json['isEOS'] as bool?,
      isHighRiskToken: json['isHighRiskToken'] as bool?,
      needAddressTag: json['needAddressTag'] as bool?,
      needKycQuantity: json['needKycQuantity'] as String?,
      orgId: json['orgId'] as String?,
      tokenFullName: json['tokenFullName'] as String?,
      tokenId: json['tokenId'] as String?,
      tokenName: json['tokenName'] as String?,
      tokenType: json['tokenType'] as String?,
    );

Map<String, dynamic> _$$QuoteTokensModelImplToJson(
        _$QuoteTokensModelImpl instance) =>
    <String, dynamic>{
      'addressCount': instance.addressCount,
      'allowDeposit': instance.allowDeposit,
      'allowWithdraw': instance.allowWithdraw,
      'baseTokenSymbols': instance.baseTokenSymbols,
      'chainTypes': instance.chainTypes,
      'customOrder': instance.customOrder,
      'iconUrl': instance.iconUrl,
      'isEOS': instance.isEOS,
      'isHighRiskToken': instance.isHighRiskToken,
      'needAddressTag': instance.needAddressTag,
      'needKycQuantity': instance.needKycQuantity,
      'orgId': instance.orgId,
      'tokenFullName': instance.tokenFullName,
      'tokenId': instance.tokenId,
      'tokenName': instance.tokenName,
      'tokenType': instance.tokenType,
    };

_$BaseTokenSymbolsModelImpl _$$BaseTokenSymbolsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BaseTokenSymbolsModelImpl(
      allowMargin: json['allowMargin'] as bool?,
      allowPlan: json['allowPlan'] as bool?,
      amountDigit: json['amountDigit'] as int?,
      baseDigit: json['baseDigit'] as int?,
      basePrecision: json['basePrecision'] as String?,
      baseTokenId: json['baseTokenId'] as String?,
      baseTokenName: json['baseTokenName'] as String?,
      buyMode: json['buyMode'] as bool?,
      canTrade: json['canTrade'] as bool?,
      category: json['category'] as int?,
      coinType: json['coinType'] as int?,
      customOrder: json['customOrder'] as int?,
      digitMerge: json['digitMerge'] as String?,
      exchangeId: json['exchangeId'] as String?,
      favorite: json['favorite'] as bool?,
      indexRecommendOrder: json['indexRecommendOrder'] as int?,
      isNeedSwitchTradeTab: json['isNeedSwitchTradeTab'] as bool?,
      isReverse: json['isReverse'] as bool?,
      itemShowType: json['itemShowType'] as int?,
      labelId: json['labelId'] as String?,
      minPricePrecision: json['minPricePrecision'] as String?,
      minTradeAmount: json['minTradeAmount'] as String?,
      minTradeQuantity: json['minTradeQuantity'] as String?,
      openStatus: json['openStatus'] as bool?,
      orgId: json['orgId'] as String?,
      priceDigit: json['priceDigit'] as int?,
      quotePrecision: json['quotePrecision'] as String?,
      quoteTokenId: json['quoteTokenId'] as String?,
      quoteTokenName: json['quoteTokenName'] as String?,
      select: json['select'] as bool?,
      showStatus: json['showStatus'] as bool?,
      symbolId: json['symbolId'] as String?,
      symbolName: json['symbolName'] as String?,
    );

Map<String, dynamic> _$$BaseTokenSymbolsModelImplToJson(
        _$BaseTokenSymbolsModelImpl instance) =>
    <String, dynamic>{
      'allowMargin': instance.allowMargin,
      'allowPlan': instance.allowPlan,
      'amountDigit': instance.amountDigit,
      'baseDigit': instance.baseDigit,
      'basePrecision': instance.basePrecision,
      'baseTokenId': instance.baseTokenId,
      'baseTokenName': instance.baseTokenName,
      'buyMode': instance.buyMode,
      'canTrade': instance.canTrade,
      'category': instance.category,
      'coinType': instance.coinType,
      'customOrder': instance.customOrder,
      'digitMerge': instance.digitMerge,
      'exchangeId': instance.exchangeId,
      'favorite': instance.favorite,
      'indexRecommendOrder': instance.indexRecommendOrder,
      'isNeedSwitchTradeTab': instance.isNeedSwitchTradeTab,
      'isReverse': instance.isReverse,
      'itemShowType': instance.itemShowType,
      'labelId': instance.labelId,
      'minPricePrecision': instance.minPricePrecision,
      'minTradeAmount': instance.minTradeAmount,
      'minTradeQuantity': instance.minTradeQuantity,
      'openStatus': instance.openStatus,
      'orgId': instance.orgId,
      'priceDigit': instance.priceDigit,
      'quotePrecision': instance.quotePrecision,
      'quoteTokenId': instance.quoteTokenId,
      'quoteTokenName': instance.quoteTokenName,
      'select': instance.select,
      'showStatus': instance.showStatus,
      'symbolId': instance.symbolId,
      'symbolName': instance.symbolName,
    };

_$ChainTypeModelImpl _$$ChainTypeModelImplFromJson(Map<String, dynamic> json) =>
    _$ChainTypeModelImpl(
      chainType: json['chainType'] as String?,
      allowDeposit: json['allowDeposit'] as bool?,
      allowWithdraw: json['allowWithdraw'] as bool?,
      select: json['select'] as bool?,
    );

Map<String, dynamic> _$$ChainTypeModelImplToJson(
        _$ChainTypeModelImpl instance) =>
    <String, dynamic>{
      'chainType': instance.chainType,
      'allowDeposit': instance.allowDeposit,
      'allowWithdraw': instance.allowWithdraw,
      'select': instance.select,
    };
