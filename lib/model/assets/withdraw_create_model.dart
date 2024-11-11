import "package:ceex_flutter/model/user/user_account_money_model.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:flutter/foundation.dart";

part "withdraw_create_model.freezed.dart";
part "withdraw_create_model.g.dart";

@freezed
class WithdrawCreateModel with _$WithdrawCreateModel {
  const factory WithdrawCreateModel({
    String? requestId,
    bool? addressIsUserId,
    String? codeOrderId,
    String? timeLeft,
    bool? needCheckIdCardNo,
    bool? allowWithdraw,
    String? refuseReason,
  }) = _WithdrawCreateModel;

  factory WithdrawCreateModel.fromJson(Map<String, Object?> json) =>
      _$WithdrawCreateModelFromJson(json);
}
