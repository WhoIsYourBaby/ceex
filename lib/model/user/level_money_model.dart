import 'package:freezed_annotation/freezed_annotation.dart';

part 'level_money_model.freezed.dart';
part 'level_money_model.g.dart';

@freezed
class LevelMoneyModel with _$LevelMoneyModel {
  const factory LevelMoneyModel({
    String? tokenId,
    String? tokenName,
    String? tokenFullName,
    String? total,
    String? free,
    String? locked,
    String? btcValue,
    String? loanAmount,
    String? usdtValue,
    String? iconUrl,
  }) = _LevelMoneyModel;

  factory LevelMoneyModel.fromJson(Map<String, Object?> json) =>
      _$LevelMoneyModelFromJson(json);
}
