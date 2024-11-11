import "package:ceex_flutter/model/user/user_account_money_model.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:flutter/foundation.dart";

part "order_list_model.freezed.dart";
part "order_list_model.g.dart";

mixin OrderListCellInterface {
  String? get tokenId;
  String? get tokenName;
  String? get time;
  String? get statusCode;
  String? get statusDesc;
}

@freezed
class OrderListModel with _$OrderListModel, OrderListCellInterface {
  const factory OrderListModel({
    String? id,
    String? tokenId,
    String? tokenName,
    String? address,
    String? time,
    String? addressExt,
    String? fromAddress,
    String? statusCode,
    String? statusDesc,
    String? quantity,
    String? txid,
    String? walletHandleTime,
    String? feeTokenId,
    String? feeTokenName,
    String? fee,
    String? orderId,
    num? requiredConfirmNum,
    num? confirmNum,
    String? failedReasonDesc,
  }) = _OrderListModel;

  const OrderListModel._();

  factory OrderListModel.fromJson(Map<String, Object?> json) =>
      _$OrderListModelFromJson(json);
}
