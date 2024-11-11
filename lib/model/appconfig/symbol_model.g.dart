// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symbol_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SymbolModelImpl _$$SymbolModelImplFromJson(Map<String, dynamic> json) =>
    _$SymbolModelImpl(
      orgId: json['orgId'] as String?,
      exchangeId: json['exchangeId'] as String?,
      symbolId: json['symbolId'] as String?,
      symbolName: json['symbolName'] as String?,
      baseTokenId: json['baseTokenId'] as String?,
      baseTokenName: json['baseTokenName'] as String?,
      quoteTokenId: json['quoteTokenId'] as String?,
      quoteTokenName: json['quoteTokenName'] as String?,
      basePrecision: json['basePrecision'] as String?,
      quotePrecision: json['quotePrecision'] as String?,
      minTradeQuantity: json['minTradeQuantity'] as String?,
      minTradeAmount: json['minTradeAmount'] as String?,
      minPricePrecision: json['minPricePrecision'] as String?,
      digitMerge: json['digitMerge'] as String?,
      canTrade: json['canTrade'] as bool?,
      customOrder: json['customOrder'] as int?,
      isAggregate: json['isAggregate'] as bool?,
      indexRecommendOrder: json['indexRecommendOrder'] as int?,
      showStatus: json['showStatus'] as bool?,
      category: json['category'] as int?,
      allowMargin: json['allowMargin'] as bool?,
      labelId: json['labelId'] as String?,
      iconUrl: json['iconUrl'] as String?,
      allowPlan: json['allowPlan'] as bool?,
    );

Map<String, dynamic> _$$SymbolModelImplToJson(_$SymbolModelImpl instance) =>
    <String, dynamic>{
      'orgId': instance.orgId,
      'exchangeId': instance.exchangeId,
      'symbolId': instance.symbolId,
      'symbolName': instance.symbolName,
      'baseTokenId': instance.baseTokenId,
      'baseTokenName': instance.baseTokenName,
      'quoteTokenId': instance.quoteTokenId,
      'quoteTokenName': instance.quoteTokenName,
      'basePrecision': instance.basePrecision,
      'quotePrecision': instance.quotePrecision,
      'minTradeQuantity': instance.minTradeQuantity,
      'minTradeAmount': instance.minTradeAmount,
      'minPricePrecision': instance.minPricePrecision,
      'digitMerge': instance.digitMerge,
      'canTrade': instance.canTrade,
      'customOrder': instance.customOrder,
      'isAggregate': instance.isAggregate,
      'indexRecommendOrder': instance.indexRecommendOrder,
      'showStatus': instance.showStatus,
      'category': instance.category,
      'allowMargin': instance.allowMargin,
      'labelId': instance.labelId,
      'iconUrl': instance.iconUrl,
      'allowPlan': instance.allowPlan,
    };

_$TokenModelImpl _$$TokenModelImplFromJson(Map<String, dynamic> json) =>
    _$TokenModelImpl(
      orgId: json['orgId'] as String?,
      tokenId: json['tokenId'] as String?,
      tokenName: json['tokenName'] as String?,
      tokenFullName: json['tokenFullName'] as String?,
      iconUrl: json['iconUrl'] as String?,
      allowWithdraw: json['allowWithdraw'] as bool?,
      allowDeposit: json['allowDeposit'] as bool?,
      isHighRiskToken: json['isHighRiskToken'] as bool?,
      isEOS: json['isEOS'] as bool?,
      tokenType: json['tokenType'] as String?,
      needAddressTag: json['needAddressTag'] as bool?,
      needKycQuantity: json['needKycQuantity'] as String?,
      customOrder: json['customOrder'] as int?,
      baseTokenSymbols: (json['baseTokenSymbols'] as List<dynamic>?)
          ?.map((e) => SymbolModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      chainTypes: (json['chainTypes'] as List<dynamic>?)
          ?.map((e) => ChainTypesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TokenModelImplToJson(_$TokenModelImpl instance) =>
    <String, dynamic>{
      'orgId': instance.orgId,
      'tokenId': instance.tokenId,
      'tokenName': instance.tokenName,
      'tokenFullName': instance.tokenFullName,
      'iconUrl': instance.iconUrl,
      'allowWithdraw': instance.allowWithdraw,
      'allowDeposit': instance.allowDeposit,
      'isHighRiskToken': instance.isHighRiskToken,
      'isEOS': instance.isEOS,
      'tokenType': instance.tokenType,
      'needAddressTag': instance.needAddressTag,
      'needKycQuantity': instance.needKycQuantity,
      'customOrder': instance.customOrder,
      'baseTokenSymbols': instance.baseTokenSymbols,
      'chainTypes': instance.chainTypes,
    };

_$TokenInfoModelImpl _$$TokenInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$TokenInfoModelImpl(
      tokenId: json['tokenId'] as String?,
      tokenName: json['tokenName'] as String?,
      maxQuantitySupplied: json['maxQuantitySupplied'] as String?,
      currentTurnover: json['currentTurnover'] as String?,
      officialWebsiteUrl: json['officialWebsiteUrl'] as String?,
      whitePaperUrl: json['whitePaperUrl'] as String?,
      publishTime: json['publishTime'] as String?,
      exploreUrl: json['exploreUrl'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$TokenInfoModelImplToJson(
        _$TokenInfoModelImpl instance) =>
    <String, dynamic>{
      'tokenId': instance.tokenId,
      'tokenName': instance.tokenName,
      'maxQuantitySupplied': instance.maxQuantitySupplied,
      'currentTurnover': instance.currentTurnover,
      'officialWebsiteUrl': instance.officialWebsiteUrl,
      'whitePaperUrl': instance.whitePaperUrl,
      'publishTime': instance.publishTime,
      'exploreUrl': instance.exploreUrl,
      'description': instance.description,
    };

_$ChainTypesModelImpl _$$ChainTypesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChainTypesModelImpl(
      chainType: json['chainType'] as String?,
      allowDeposit: json['allowDeposit'] as bool?,
      allowWithdraw: json['allowWithdraw'] as bool?,
    );

Map<String, dynamic> _$$ChainTypesModelImplToJson(
        _$ChainTypesModelImpl instance) =>
    <String, dynamic>{
      'chainType': instance.chainType,
      'allowDeposit': instance.allowDeposit,
      'allowWithdraw': instance.allowWithdraw,
    };
