import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// 必要的：关联 `main.dart` 到 Freezed 代码生成器
part 'rate_model.freezed.dart';
// 可选的：因为 Person 类是可序列化的，所以我们必须添加这一行。
// 但是如果 Person 不是可序列化的，我们可以跳过它。
part 'rate_model.g.dart';

/// 汇率
@freezed
class RateModel with _$RateModel {
  const RateModel._();
  const factory RateModel({
    String? token,
    RateMoneyModel? rates,
  }) = _RateModel;

  factory RateModel.fromJson(Map<String, Object?> json) =>
      _$RateModelFromJson(json);

  /// [srcMoney]源货币数量
  /// [targetToken]目标货币:BTC/USDT...
  num equalTo(num srcMoney, String targetToken) {
    switch (targetToken) {
      case "BTC":
        return srcMoney * (num.tryParse(rates?.BTC ?? "0.0") ?? 0);
      case "USDT":
        return srcMoney * (num.tryParse(rates?.USDT ?? "0.0") ?? 0);
      case "USD":
        return srcMoney * (num.tryParse(rates?.USD ?? "0.0") ?? 0);
      case "CNY":
        return srcMoney * (num.tryParse(rates?.CNY ?? "0.0") ?? 0);
    }
    return 0.0;
  }
}

/// 汇率
@freezed
class RateMoneyModel with _$RateMoneyModel {
  const factory RateMoneyModel({
    String? BTC,
    String? USD,
    String? USDT,
    String? CNY,
  }) = _RateMoneyModel;

  factory RateMoneyModel.fromJson(Map<String, Object?> json) =>
      _$RateMoneyModelFromJson(json);
}
