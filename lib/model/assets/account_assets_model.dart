import "package:ceex_flutter/cubit/assets/assets_cubit.dart";
import "package:ceex_flutter/model/user/user_account_money_model.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:flutter/foundation.dart";

part "account_assets_model.freezed.dart";
part "account_assets_model.g.dart";

@freezed
class AccountAssetsModel with _$AccountAssetsModel {
  const factory AccountAssetsModel({
    String? accountId,
    String? accountName,
    int? accountType,
    int? accountIndex,
    bool? canTrade,
    bool? canDeposit,
    bool? canWithdraw,
    List<UserAccountMoneyModel>? balance,
    String? btcValue,
    String? usdtValue,
    WalletType? walletType,
  }) = _AccountAssetsModel;

  factory AccountAssetsModel.fromJson(Map<String, Object?> json) =>
      _$AccountAssetsModelFromJson(json);
}