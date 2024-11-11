import "dart:convert";
import "dart:math";

import "package:crypto/crypto.dart";
import "package:date_format/date_format.dart";
import "package:flutter/material.dart";

extension MapJsonString on Map {
  String toJSONString() {
    return json.encode(this);
  }
}

extension ListJsonString on List {
  String toJSONString() {
    return json.encode(this);
  }
}

extension StringExt on String {
  /// return List/Map
  dynamic toJSON() {
    return json.decode(this);
  }

  num? toNum() {
    return num.tryParse(this);
  }

  String toMd5() {
    try {
      var md5Str = md5.convert(utf8.encode(this));
      return md5Str.bytes
          .map((byte) => byte.toRadixString(16).padLeft(2, '0'))
          .join('');
    } catch (e) {
      return "";
    }
  }
}

extension DateTimeFormat on DateTime {
  formatHHMMnnSS() {
    return formatDate(this, ["HH", ":", "nn", ":", "ss"]);
  }

  formatyyyymmddHHMMnnSS() {
    return formatDate(
        this, ["yyyy", "-", "mm", "-", "dd", " ", "HH", ":", "nn", ":", "ss"]);
  }
}

extension NumberExt on num {
  /// 指定小数位长度
  num toDigit(int digit) {
    final str = this.toStringAsFixed(digit);
    return str.toNum()!;
  }

  /// 转换为指定总长度的字符串
  /// 如果整数部分超过length，则只展示整数部分
  /// 如果整数+小数部分超过length，则截断小数
  String toStringLimitLength(int length) {
    final str = this.toString();
    if (str.length <= length || !str.contains(".")) {
      return str;
    } else {
      final list = str.split(".");
      final intStr = list[0];
      if (intStr.length >= length) {
        return intStr;
      }
      String digitStr = list[1];
      final digit = digitStr.substring(
        0,
        min(length - intStr.length, digitStr.length),
      );
      return list[0] + "." + digit;
    }
  }
}

/// 获取数字有几位小数
int getDecimalCount(String number) {
  // 判断字符串中是否包含小数点
  if (number.contains('.')) {
    // 使用split方法将字符串分割成整数部分和小数部分
    List<String> parts = number.split('.');
    // 如果分割后数组的长度为2，说明有小数部分
    if (parts.length == 2) {
      // 返回小数部分的长度，即小数位数
      return parts[1].length;
    }
  }
  // 默认情况下，返回0表示整数
  return 0;
}
