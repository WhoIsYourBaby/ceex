import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_entrust_model.freezed.dart';
part 'contract_entrust_model.g.dart';

/**
 * tokenId: DOGE, 
 * tokenName: DOGE, 
 * total: 0.889, 
 * free: 0.889, 
 * locked: 0, 
 * btcValue: 0.000002, usdtValue: 0.13, position: 0, balanceCreatedAt: 1710823798634, balanceUpdatedAt: 1710823813299}, {tokenId: USDT, tokenName: USDT, total: 997.269463, free: 997.269403, locked: 0.00006, btcValue: 0.01482939, 
 * usdtValue: 997.26, position: 0, balanceCreatedAt: 1709174700726, balanceUpdatedAt: 1710988801779
 */
@freezed
class ContractEntrustModel with _$ContractEntrustModel{
  const factory ContractEntrustModel({
    String? tokenId,
    String? tokenName,
    double? total,
    double? free,
    double? locked,
    double? btcValue,
    double? usdtValue,
    int? position,
    String? balanceCreatedAt,
    String? balanceUpdatedAt,
  })= _ContractEntrustModel;

  factory ContractEntrustModel.fromJson(Map<String, Object?> json) =>
      _$ContractEntrustModelFromJson(json);
  
}