// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assets_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssetsInfoModelImpl _$$AssetsInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AssetsInfoModelImpl(
      coinAsset: json['coinAsset'] as String?,
      optionAsset: json['optionAsset'] as String?,
      optionCoinAsset: json['optionCoinAsset'] as String?,
      financeAsset: json['financeAsset'] as String?,
      futuresCoinAsset: json['futuresCoinAsset'] as String?,
      totalAsset: json['totalAsset'] as String?,
      unit: json['unit'] as String?,
      activeCoinAsset: json['activeCoinAsset'] as String?,
      stakingAsset: json['stakingAsset'] as String?,
      subAccountBalances: json['subAccountBalances'] as List<dynamic>?,
    );

Map<String, dynamic> _$$AssetsInfoModelImplToJson(
        _$AssetsInfoModelImpl instance) =>
    <String, dynamic>{
      'coinAsset': instance.coinAsset,
      'optionAsset': instance.optionAsset,
      'optionCoinAsset': instance.optionCoinAsset,
      'financeAsset': instance.financeAsset,
      'futuresCoinAsset': instance.futuresCoinAsset,
      'totalAsset': instance.totalAsset,
      'unit': instance.unit,
      'activeCoinAsset': instance.activeCoinAsset,
      'stakingAsset': instance.stakingAsset,
      'subAccountBalances': instance.subAccountBalances,
    };
