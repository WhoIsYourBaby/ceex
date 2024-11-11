// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level_money_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LevelMoneyModelImpl _$$LevelMoneyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LevelMoneyModelImpl(
      tokenId: json['tokenId'] as String?,
      tokenName: json['tokenName'] as String?,
      tokenFullName: json['tokenFullName'] as String?,
      total: json['total'] as String?,
      free: json['free'] as String?,
      locked: json['locked'] as String?,
      btcValue: json['btcValue'] as String?,
      loanAmount: json['loanAmount'] as String?,
      usdtValue: json['usdtValue'] as String?,
      iconUrl: json['iconUrl'] as String?,
    );

Map<String, dynamic> _$$LevelMoneyModelImplToJson(
        _$LevelMoneyModelImpl instance) =>
    <String, dynamic>{
      'tokenId': instance.tokenId,
      'tokenName': instance.tokenName,
      'tokenFullName': instance.tokenFullName,
      'total': instance.total,
      'free': instance.free,
      'locked': instance.locked,
      'btcValue': instance.btcValue,
      'loanAmount': instance.loanAmount,
      'usdtValue': instance.usdtValue,
      'iconUrl': instance.iconUrl,
    };
