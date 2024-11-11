import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

/// 订单
@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    String? time,
    String? orderId,
    String? accountId,
    String? clientOrderId,
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
    List<FeesModel>? fees,
    String? averagePrice,
    String? noExecutedQty,
    String? amount,
    String? tradeId,
    String? quantity,
    String? fee,// 手续费
    String? feeTokenName,// 手续费token
    String? feeTokenId,// 手续费token
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, Object?> json) =>
      _$OrderModelFromJson(json);
}


@freezed
class FeesModel with _$FeesModel {
  const factory FeesModel({
    String? feeTokenId,// 手续费类型Id
    String? feeTokenName,// 手续费类型Name
    String? fee, // 手续费
  }) = _FeesModel;

  factory FeesModel.fromJson(Map<String, Object?> json) =>
      _$FeesModelFromJson(json);
}
