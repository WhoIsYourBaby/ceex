// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quota_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuotaInfoModelImpl _$$QuotaInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$QuotaInfoModelImpl(
      allowWithdraw: json['allowWithdraw'] as bool?,
      refuseReason: json['refuseReason'] as String?,
      available: json['available'] as String?,
      minQuantity: json['minQuantity'] as String?,
      dayQuota: json['dayQuota'] as String?,
      usedQuota: json['usedQuota'] as String?,
      needConvert: json['needConvert'] as bool?,
      convertRate: json['convertRate'] as String?,
      feeTokenId: json['feeTokenId'] as String?,
      feeTokenName: json['feeTokenName'] as String?,
      platformFee: json['platformFee'] as String?,
      brokerFee: json['brokerFee'] as String?,
      fee: json['fee'] as String?,
      convertFee: json['convertFee'] as String?,
      minerFeeTokenId: json['minerFeeTokenId'] as String?,
      minerFeeTokenName: json['minerFeeTokenName'] as String?,
      minMinerFee: json['minMinerFee'] as String?,
      maxMinerFee: json['maxMinerFee'] as String?,
      suggestMinerFee: json['suggestMinerFee'] as String?,
      isEOS: json['isEOS'] as bool?,
      needAddressTag: json['needAddressTag'] as bool?,
      needKycCheck: json['needKycCheck'] as bool?,
      internalWithdrawHasFee: json['internalWithdrawHasFee'] as bool?,
      minPrecision: json['minPrecision'] as num?,
      needKycQuotaQuantity: json['needKycQuotaQuantity'] as String?,
      needKycQuotaUnit: json['needKycQuotaUnit'] as String?,
      needKycQuantity: json['needKycQuantity'] as String?,
      internalWithdrawFee: json['internalWithdrawFee'] as String?,
      tokenType: json['tokenType'] as String?,
      riskBalanceBtcValue: json['riskBalanceBtcValue'] as String?,
    );

Map<String, dynamic> _$$QuotaInfoModelImplToJson(
        _$QuotaInfoModelImpl instance) =>
    <String, dynamic>{
      'allowWithdraw': instance.allowWithdraw,
      'refuseReason': instance.refuseReason,
      'available': instance.available,
      'minQuantity': instance.minQuantity,
      'dayQuota': instance.dayQuota,
      'usedQuota': instance.usedQuota,
      'needConvert': instance.needConvert,
      'convertRate': instance.convertRate,
      'feeTokenId': instance.feeTokenId,
      'feeTokenName': instance.feeTokenName,
      'platformFee': instance.platformFee,
      'brokerFee': instance.brokerFee,
      'fee': instance.fee,
      'convertFee': instance.convertFee,
      'minerFeeTokenId': instance.minerFeeTokenId,
      'minerFeeTokenName': instance.minerFeeTokenName,
      'minMinerFee': instance.minMinerFee,
      'maxMinerFee': instance.maxMinerFee,
      'suggestMinerFee': instance.suggestMinerFee,
      'isEOS': instance.isEOS,
      'needAddressTag': instance.needAddressTag,
      'needKycCheck': instance.needKycCheck,
      'internalWithdrawHasFee': instance.internalWithdrawHasFee,
      'minPrecision': instance.minPrecision,
      'needKycQuotaQuantity': instance.needKycQuotaQuantity,
      'needKycQuotaUnit': instance.needKycQuotaUnit,
      'needKycQuantity': instance.needKycQuantity,
      'internalWithdrawFee': instance.internalWithdrawFee,
      'tokenType': instance.tokenType,
      'riskBalanceBtcValue': instance.riskBalanceBtcValue,
    };
