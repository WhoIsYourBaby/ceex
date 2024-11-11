// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_entrust_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContractEntrustModelImpl _$$ContractEntrustModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ContractEntrustModelImpl(
      tokenId: json['tokenId'] as String?,
      tokenName: json['tokenName'] as String?,
      total: (json['total'] as num?)?.toDouble(),
      free: (json['free'] as num?)?.toDouble(),
      locked: (json['locked'] as num?)?.toDouble(),
      btcValue: (json['btcValue'] as num?)?.toDouble(),
      usdtValue: (json['usdtValue'] as num?)?.toDouble(),
      position: json['position'] as int?,
      balanceCreatedAt: json['balanceCreatedAt'] as String?,
      balanceUpdatedAt: json['balanceUpdatedAt'] as String?,
    );

Map<String, dynamic> _$$ContractEntrustModelImplToJson(
        _$ContractEntrustModelImpl instance) =>
    <String, dynamic>{
      'tokenId': instance.tokenId,
      'tokenName': instance.tokenName,
      'total': instance.total,
      'free': instance.free,
      'locked': instance.locked,
      'btcValue': instance.btcValue,
      'usdtValue': instance.usdtValue,
      'position': instance.position,
      'balanceCreatedAt': instance.balanceCreatedAt,
      'balanceUpdatedAt': instance.balanceUpdatedAt,
    };
