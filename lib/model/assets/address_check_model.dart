import "package:ceex_flutter/model/user/user_account_money_model.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "address_check_model.freezed.dart";
part "address_check_model.g.dart";

/**
 {
	"address": "TBLuRqLAyuCoLZ6jf1wFoeBcg63frJ8a5J",
	"addressExt": "",
	"addressIsUserId": false,
	"isIllegal": true,
	"isInnerAddress": false,
	"isInBlackList": false
}
 */
@freezed
class AddressCheckModel with _$AddressCheckModel {
  const factory AddressCheckModel({
    String? address,
    String? addressExt,
    bool? addressIsUserId,
    bool? isIllegal,
    bool? isInnerAddress,
    bool? isInBlackList,
  }) = _AddressCheckModel;

  factory AddressCheckModel.fromJson(Map<String, Object?> json) =>
      _$AddressCheckModelFromJson(json);
}

/**
 account_id	1615421107673790721
address	TBLuRqLAyuCoLZ6jf1wFoeBcg63frJ8a5N
address_id	34
c_token	1kQIfukzRTTmPT9vXQzSDJGL3kZLnxgw
chain_type	TRON
client_order_id	1714200322000
convert_rate	0.12
miner_fee	30.00000000
org_id	6066
quantity	15
remarks	Test
sig	95aaeae5c0c877a73c20e43d5f62b927
time	1714200322000
token_id	USDT
trade_password	24fee8f29b6405af93d6adb9f7e5af67
 */
@freezed
class WithdrawalCreateBody with _$WithdrawalCreateBody {
  const factory WithdrawalCreateBody({
    @JsonKey(name: "account_id") required String accountId,
    required String address,
    @JsonKey(name: "address_id") String? addressId,
    @JsonKey(name: "chain_type") required String chainType,
    @JsonKey(name: "client_order_id") required String clientOrderId,
    @JsonKey(name: "convert_rate") required num convertRate,
    @JsonKey(name: "miner_fee") required num minerFee,
    // 数量
    required num quantity,
    // String? remarks,
    @JsonKey(name: "token_id") required String tokenId,
    @JsonKey(name: "trade_password") required String tradePassword,
    // 带入二次验证
    @JsonKey(name: "verify_code") String? verifyCode,
    @JsonKey(name: "order_id") String? orderId,
    @JsonKey(name: "auth_type") int? authType,
  }) = _WithdrawalCreateBody;

  factory WithdrawalCreateBody.fromJson(Map<String, Object?> json) =>
      _$WithdrawalCreateBodyFromJson(json);
}
