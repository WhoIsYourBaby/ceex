import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_account_money_model.freezed.dart';
part 'user_account_money_model.g.dart';

/**
 * [{tokenId: DOGE, 
 * tokenName: DOGE, 
 * total: 0.889, 
 * free: 0.889, 
 * locked: 0, 
 * btcValue: 0.00000201, 
 * usdtValue: 0.13, 
 * position: 0, 
 * balanceCreatedAt: 1710823798634, 
 * balanceUpdatedAt: 1710823813299}, 
 * {tokenId: USDT, 
 * tokenName: USDT, 
 * total: 997.269463, 
 * free: 997.269403, 
 * locked: 0.00006, btcValue: 0.01490917, usdtValue: 997.26, position: 0, 
 * balanceCreatedAt: 1709174700726, balanceUpdatedAt: 1710988801779}]
 */
/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@freezed
class UserAccountMoneyModel with _$UserAccountMoneyModel {
  const factory UserAccountMoneyModel({
    String? tokenId,
    String? tokenName,
    String? tokenFullName,
    String? iconUrl,
    String? total,
    String? free,
    String? locked,
    String? btcValue,
    String? usdtValue,
    String? position,
    String? balanceCreatedAt,
    String? balanceUpdatedAt,
    String? quotePrecision,
  }) = _UserAccountMoneyModel;

  factory UserAccountMoneyModel.fromJson(Map<String, Object?> json) =>
      _$UserAccountMoneyModelFromJson(json);

}