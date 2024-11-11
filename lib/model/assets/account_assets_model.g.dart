// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_assets_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountAssetsModelImpl _$$AccountAssetsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountAssetsModelImpl(
      accountId: json['accountId'] as String?,
      accountName: json['accountName'] as String?,
      accountType: json['accountType'] as int?,
      accountIndex: json['accountIndex'] as int?,
      canTrade: json['canTrade'] as bool?,
      canDeposit: json['canDeposit'] as bool?,
      canWithdraw: json['canWithdraw'] as bool?,
      balance: (json['balance'] as List<dynamic>?)
          ?.map(
              (e) => UserAccountMoneyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      btcValue: json['btcValue'] as String?,
      usdtValue: json['usdtValue'] as String?,
      walletType: $enumDecodeNullable(_$WalletTypeEnumMap, json['walletType']),
    );

Map<String, dynamic> _$$AccountAssetsModelImplToJson(
        _$AccountAssetsModelImpl instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'accountName': instance.accountName,
      'accountType': instance.accountType,
      'accountIndex': instance.accountIndex,
      'canTrade': instance.canTrade,
      'canDeposit': instance.canDeposit,
      'canWithdraw': instance.canWithdraw,
      'balance': instance.balance,
      'btcValue': instance.btcValue,
      'usdtValue': instance.usdtValue,
      'walletType': _$WalletTypeEnumMap[instance.walletType],
    };

const _$WalletTypeEnumMap = {
  WalletType.wallet: 'wallet',
  WalletType.contract: 'contract',
  WalletType.financing: 'financing',
  WalletType.lever: 'lever',
  WalletType.other: 'other',
};
