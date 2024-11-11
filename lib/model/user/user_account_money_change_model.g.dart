// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account_money_change_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAccountMoneyChangeModel _$UserAccountMoneyChangeModelFromJson(
        Map<String, dynamic> json) =>
    UserAccountMoneyChangeModel(
      tokenId: json['tokenId'] as String?,
      tokenName: json['tokenName'] as String?,
      tokenFullName: json['tokenFullName'] as String?,
      iconUrl: json['iconUrl'] as String?,
      total: json['total'] as String?,
      free: json['free'] as String?,
      locked: json['locked'] as String?,
      btcValue: json['btcValue'] as String?,
      usdtValue: json['usdtValue'] as String?,
      position: json['position'] as String?,
      balanceCreatedAt: json['balanceCreatedAt'] as String?,
      balanceUpdatedAt: json['balanceUpdatedAt'] as String?,
      quotePrecision: json['quotePrecision'] as String?,
    );

Map<String, dynamic> _$UserAccountMoneyChangeModelToJson(
        UserAccountMoneyChangeModel instance) =>
    <String, dynamic>{
      'tokenId': instance.tokenId,
      'tokenName': instance.tokenName,
      'tokenFullName': instance.tokenFullName,
      'iconUrl': instance.iconUrl,
      'total': instance.total,
      'free': instance.free,
      'locked': instance.locked,
      'btcValue': instance.btcValue,
      'usdtValue': instance.usdtValue,
      'position': instance.position,
      'balanceCreatedAt': instance.balanceCreatedAt,
      'balanceUpdatedAt': instance.balanceUpdatedAt,
      'quotePrecision': instance.quotePrecision,
    };
