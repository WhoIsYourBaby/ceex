/*
 * @Description: 
 * @Author: zhaojijin
 * @LastEditors: zhaojijin
 * @Date: 2019-04-16 14:30:22
 * @LastEditTime: 2019-04-28 16:25:54
 */

import 'package:ceex_flutter/model/model.dart';
import 'package:ceex_flutter/utils/ext.dart';
import 'package:flutter/material.dart';
import 'klineConstrants.dart';

class Market {
  Market(
    this.open,
    this.high,
    this.low,
    this.close,
    this.vol,
    this.id, {
    this.isShowCandleInfo,
  });
  double? open;
  double? high;
  double? low;
  double? close;
  double? vol;
  int? id;

  //指标线数据
  double? priceMa5;
  double? priceMa10;
  double? priceMa30;

  // 十字交叉点
  Offset? offset;
  double? candleWidgetOriginY;
  double? gridTotalHeight;

  bool? isShowCandleInfo;
  List<String> candleInfo() {
    double limitUpDownAmount = (close ?? 0) - (open ?? 0);
    double limitUpDownPercent = (limitUpDownAmount / (open ?? 0)) * 100;
    String pre = '';
    if (limitUpDownAmount < 0) {
      pre = '';
    } else if (limitUpDownAmount > 0) {
      pre = '+';
    }
    String limitUpDownAmountStr = '$pre${limitUpDownAmount.toStringAsFixed(2)}';
    String limitPercentStr = '$pre${limitUpDownPercent.toStringAsFixed(2)}%';
    return [
      readTimestamp(id),
      (open ?? 0).toStringLimitLength(kGridPricePrecision),
      (high ?? 0).toStringLimitLength(kGridPricePrecision),
      (low ?? 0).toStringLimitLength(kGridPricePrecision),
      (close ?? 0).toStringLimitLength(kGridPricePrecision),
      limitUpDownAmountStr,
      limitPercentStr,
      (vol ?? 0).toStringLimitLength(kGridPricePrecision)
    ];
  }

  final Map<YKLineType, double> _calcValues = {};

  double? getValueForType(YKLineType type) {
    final value = _calcValues[type];
    return value;
  }

  void setValueForType(YKLineType type, double? value) {
    if (value == null) {
      _calcValues.remove(type);
    } else {
      _calcValues[type] = value;
    }
  }

  void printDesc() {
    print(
        'id :$id open :$open close :$close high :$high low :$low vol :$vol offset: $offset');
  }

  factory Market.fromKlineModel(KlineModel model) {
    return Market(
      double.tryParse(model.o ?? "0.0"),
      double.tryParse(model.h ?? "0.0"),
      double.tryParse(model.l ?? "0.0"),
      double.tryParse(model.c ?? "0.0"),
      double.tryParse(model.v ?? "0.0"),
      (model.t?.toInt() ?? 0) ~/ 1000,
    );
  }
}

String readTimestamp(int? timestamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch((timestamp ?? 0) * 1000);
  String time =
      '${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  if (date.hour == 0 && date.minute == 0) {
    time =
        '${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
  return time;
}
