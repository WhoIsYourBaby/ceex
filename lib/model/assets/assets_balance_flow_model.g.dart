// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assets_balance_flow_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssetsBalanceFlowModelImpl _$$AssetsBalanceFlowModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AssetsBalanceFlowModelImpl(
      id: json['id'] as String?,
      accountId: json['accountId'] as String?,
      tokenId: json['tokenId'] as String?,
      tokenName: json['tokenName'] as String?,
      flowType: json['flowType'] as String?,
      change: json['change'] as String?,
      total: json['total'] as String?,
      created: json['created'] as String?,
    );

Map<String, dynamic> _$$AssetsBalanceFlowModelImplToJson(
        _$AssetsBalanceFlowModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountId': instance.accountId,
      'tokenId': instance.tokenId,
      'tokenName': instance.tokenName,
      'flowType': instance.flowType,
      'change': instance.change,
      'total': instance.total,
      'created': instance.created,
    };
