import "package:ceex_flutter/cubit/assets/assets_cubit.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "transfer_available_model.freezed.dart";
part "transfer_available_model.g.dart";

@freezed
class TransferAvailableModel with _$TransferAvailableModel {
  const factory TransferAvailableModel({
    String? amount,
    bool? success,
    WalletType? walletType,
  }) = _TransferAvailableModel;

  factory TransferAvailableModel.fromJson(Map<String, Object?> json) =>
      _$TransferAvailableModelFromJson(json);
}