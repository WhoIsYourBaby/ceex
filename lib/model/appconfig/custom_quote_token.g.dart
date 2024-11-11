// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_quote_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomQuoteTokenModelImpl _$$CustomQuoteTokenModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomQuoteTokenModelImpl(
      orgId: json['orgId'] as String?,
      tokenId: json['tokenId'] as String?,
      tokenName: json['tokenName'] as String?,
      customOrder: json['customOrder'] as int?,
      status: json['status'] as int?,
      quoteTokenSymbols: (json['quoteTokenSymbols'] as List<dynamic>?)
          ?.map((e) => SymbolModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CustomQuoteTokenModelImplToJson(
        _$CustomQuoteTokenModelImpl instance) =>
    <String, dynamic>{
      'orgId': instance.orgId,
      'tokenId': instance.tokenId,
      'tokenName': instance.tokenName,
      'customOrder': instance.customOrder,
      'status': instance.status,
      'quoteTokenSymbols': instance.quoteTokenSymbols,
    };
