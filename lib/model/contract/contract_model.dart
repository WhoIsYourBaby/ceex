import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_model.freezed.dart';
part 'contract_model.g.dart';

@freezed
class ContractModel with _$ContractModel{
  const factory ContractModel({
    String? time, 
    String? orderId,
    String? accountId,
    String? symbolId,
    String? symbolName,
    String? baseTokenId,
    String? baseTokenName,
    String? quoteTokenId,
    String? quoteTokenName,
    String? price,
    String? origQty,
    String? executedQty,
    String? executedAmount,
    String? avgPrice,
    String? type,
    String? side,
    String? status,
    String? statusDesc,
    String? averagePrice,
    String? noExecutedQty,
    String? amount,
    String? tradeId,
    String? quantity,
    List<FeesBeanModel>? fees,
  }) = _ContractModel;

  factory ContractModel.fromJson(Map<String, Object?> json) =>
      _$ContractModelFromJson(json);
}


@freezed
abstract class FeesBeanModel with _$FeesBeanModel {
  const factory FeesBeanModel({
    String? feeTokenId,
    String? feeTokenName,
    String? fee,
  }) = _FeesBeanModel;

  factory FeesBeanModel.fromJson(Map<String, dynamic> json) =>
      _$FeesBeanModelFromJson(json);
}