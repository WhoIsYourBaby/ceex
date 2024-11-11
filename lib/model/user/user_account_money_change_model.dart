import 'dart:core';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_account_money_change_model.g.dart';

/**
 * [{tokenId: DOGE, 
 * tokenName: DOGE, 
 * total: 0.889, 
 * free: 0.889, 
 * locked: 0, 
 * btcValue: 0.00000201, 
 * usdtValue: 0.13, 
 * position: 0, 
 * balanceCreatedAt: 1710823798634, 
 * balanceUpdatedAt: 1710823813299}, 
 * {tokenId: USDT, 
 * tokenName: USDT, 
 * total: 997.269463, 
 * free: 997.269403, 
 * locked: 0.00006, btcValue: 0.01490917, usdtValue: 997.26, position: 0, 
 * balanceCreatedAt: 1709174700726, balanceUpdatedAt: 1710988801779}]
 */
@JsonSerializable()
class UserAccountMoneyChangeModel {
  String? tokenId;
  String? tokenName;
  String? tokenFullName;
  String? iconUrl;
  String? total;
  String? free;
  String? locked;
  String? btcValue;
  String? usdtValue;
  String? position;
  String? balanceCreatedAt;
  String? balanceUpdatedAt;
  String? quotePrecision;

  UserAccountMoneyChangeModel({
    this.tokenId,
    this.tokenName,
    this.tokenFullName,
    this.iconUrl,
    this.total,
    this.free,
    this.locked,
    this.btcValue,
    this.usdtValue,
    this.position,
    this.balanceCreatedAt,
    this.balanceUpdatedAt,
    this.quotePrecision,
  });

  // 添加工厂方法用于从 Map 中创建对象
  factory UserAccountMoneyChangeModel.fromJson(Map<String, dynamic> json) =>
      _$UserAccountMoneyChangeModelFromJson(json);

  // 添加方法用于将对象转换为 Map
  Map<String, dynamic> toJson() => _$UserAccountMoneyChangeModelToJson(this);
}