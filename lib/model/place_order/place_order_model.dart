import "package:ceex_flutter/model/order/order_model.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:flutter/foundation.dart";

part "place_order_model.freezed.dart";
part "place_order_model.g.dart";

/// 添加地址
@freezed
class PlaceOrderModel with _$PlaceOrderModel {
  const factory PlaceOrderModel({
    String? time,
    String? orderId,
    String? accountId,
    String? clientOrderId,
    String? symbolId,
    String? origQty,// 下单数量
    String? executedQty,
    String? executedAmount,
    String? avgPrice,
    String? type,
    String? side,
    List<FeesModel>? fees,
    String? status,
    String? exchangeId,
    String? updateTime,
  }) = _PlaceOrderModel;

  factory PlaceOrderModel.fromJson(Map<String, Object?> json) =>
      _$PlaceOrderModelFromJson(json);
}