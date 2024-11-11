import 'package:freezed_annotation/freezed_annotation.dart';

part 'quota_info_model.freezed.dart';
part 'quota_info_model.g.dart';

/**
 {
	"allowWithdraw": false,
	"refuseReason": "当前不允许提币",
	"available": "990.6548006",
	"minQuantity": "15",
	"dayQuota": "99999999999999999",
	"usedQuota": "0",
	"needConvert": true,
	"convertRate": "3358.18",
	"feeTokenId": "USDT",
	"feeTokenName": "USDT",
	"platformFee": "1",
	"brokerFee": "0",
	"fee": "1",
	"convertFee": "1",
	"minerFeeTokenId": "ETH",
	"minerFeeTokenName": "ETH",
	"minMinerFee": "0.000878708264",
	"maxMinerFee": "0.003954187188",
	"suggestMinerFee": "0.001757416528",
	"isEOS": false,
	"needAddressTag": false,
	"minPrecision": 6,
	"needKycCheck": false,
	"needKycQuotaQuantity": "0",
	"needKycQuotaUnit": "BTC",
	"needKycQuantity": "0",
	"internalWithdrawHasFee": false,
	"internalWithdrawFee": "0",
	"tokenType": "ERC20_TOKEN",
	"riskBalanceBtcValue": "0",
	"riskBalance": []
}
 */
/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@freezed
class QuotaInfoModel with _$QuotaInfoModel {
  const factory QuotaInfoModel({
    bool? allowWithdraw,
    String? refuseReason,
    String? available,
    String? minQuantity,
    String? dayQuota,
    String? usedQuota,
    bool? needConvert,
    String? convertRate,
    String? feeTokenId,
    String? feeTokenName,
    String? platformFee,
    String? brokerFee,
    String? fee,
    String? convertFee,
    String? minerFeeTokenId,
    String? minerFeeTokenName,
    String? minMinerFee,
    String? maxMinerFee,
    String? suggestMinerFee,
    bool? isEOS,
    bool? needAddressTag,
    bool? needKycCheck,
    bool? internalWithdrawHasFee,
    num? minPrecision,
    String? needKycQuotaQuantity,
    String? needKycQuotaUnit,
    String? needKycQuantity,
    String? internalWithdrawFee,
    String? tokenType,
    String? riskBalanceBtcValue,
  }) = _QuotaInfoModel;

  factory QuotaInfoModel.fromJson(Map<String, Object?> json) =>
      _$QuotaInfoModelFromJson(json);
}
