// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_available_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransferAvailableModelImpl _$$TransferAvailableModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransferAvailableModelImpl(
      amount: json['amount'] as String?,
      success: json['success'] as bool?,
      walletType: $enumDecodeNullable(_$WalletTypeEnumMap, json['walletType']),
    );

Map<String, dynamic> _$$TransferAvailableModelImplToJson(
        _$TransferAvailableModelImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'success': instance.success,
      'walletType': _$WalletTypeEnumMap[instance.walletType],
    };

const _$WalletTypeEnumMap = {
  WalletType.wallet: 'wallet',
  WalletType.contract: 'contract',
  WalletType.financing: 'financing',
  WalletType.lever: 'lever',
  WalletType.other: 'other',
};
