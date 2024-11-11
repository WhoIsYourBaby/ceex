import 'package:decimal/decimal.dart';
import 'package:rational/rational.dart';

// 计算汇率
class NumberUtils {
  static double mul(double j, double k) {
    try {
      Decimal d1 = Decimal.parse(j.toString());
      Decimal d2 = Decimal.parse(k.toString());
      Decimal result = d1 * d2;
      return double.parse(result.toString());
    } catch (e) {
      return 0.00;
    }
  }

  static double divReverse(String j, String k) {
    if (j == "" || k == "" || j == "0" || k == "0") return 0.0;
    Decimal d1 = Decimal.parse(j);
    Decimal d2 = Decimal.parse(k);
    Rational rationalResult = d1 / d2;
    String i = rationalResult.toDouble().toStringAsFixed(5);
    Decimal d3 = Decimal.parse(i) * Decimal.parse("100");
    return double.parse(d3.toString());
  }

  static double div(String j, String k) {
    if (j == "" || k == "" || j == "0" || k == "0") return 0.0;
    Decimal d1 = Decimal.parse(j);
    Decimal d2 = Decimal.parse(k);
    Rational rationalResult = d1 / d2;
    String i = rationalResult.toDouble().toString();
    return double.parse(i);
  }

  // 计算成交额百分比
  static double pricePercent(String price, String percent) {
    Decimal d1 = Decimal.parse(price);
    Decimal d2 = Decimal.parse(percent);
    Decimal d3 = Decimal.parse("0.01");
    Decimal result = d1 * (d2 * d3);
    return double.parse(result.toString());
  }

  // String加法
  static String addString(String price1, String price2) {
    if (price1.isEmpty || price2.isEmpty) {
      return "0";
    }
    Decimal d1 = Decimal.parse(price1);
    Decimal d2 = Decimal.parse(price2);
    Decimal d3 = d1 + d2;
    return d3.toString();
  }

  /// String减法 price1 - price2
  static String subtractionString(String price1, String price2) {
    if (price1.isEmpty || price2.isEmpty) {
      return "0";
    }
    Decimal d1 = Decimal.parse(price1);
    Decimal d2 = Decimal.parse(price2);
    Decimal d3 = d1 - d2;
    return d3.toString();
  }

  /// String乘法
  static String mulString(String price1, String price2) {
    if (price1.isEmpty || price2.isEmpty) {
      return "0";
    }
    Decimal d1 = Decimal.parse(price1);
    Decimal d2 = Decimal.parse(price2);
    Decimal d3 = d1 * d2;
    return d3.toString();
  }

  /// String除法
  static String divString(String j, String k) {
    if (j == "" || k == "" || j == "0" || k == "0") return "0";
    Decimal d1 = Decimal.parse(j);
    Decimal d2 = Decimal.parse(k);
    Rational rationalResult = d1 / d2;
    String i = rationalResult.toDouble().toString();
    return i;
  }

  /// 计算币币数量百分比
  static double divPerReverse(String j, String k) {
    if (j == "" || k == "" || j == "0" || k == "0") return 0.0;
    Decimal d1 = Decimal.parse(j);
    Decimal d2 = Decimal.parse(k);
    Rational rationalResult = d2 / d1;
    String i = rationalResult.toDouble().toStringAsFixed(5);
    Decimal d3 = Decimal.parse(i) * Decimal.parse("100");
    return double.parse(d3.toString());
  }

  /// 保留数字几位小数 不进行四舍五入
  static String getCountConn(String number, int digit) {
    // 判断字符串中是否包含小数点
    if (number.contains('.')) {
      // 使用split方法将字符串分割成整数部分和小数部分
      List<String> parts = number.split('.');
      // 如果分割后数组的长度为2，说明有小数部分
      if (digit == 0) {
        // 如果不需要小位数则直接将整数位输出
        return parts[0];
      }

      if (parts.length == 2) {
        String res = "0";
        if (parts[1].length < digit) {
          res = parts[1];
        }else{
          res = parts[1].substring(0, digit);
        }
        // 返回小数部分的长度，即小数位数
        return "${parts[0]}.$res";
      }
    }
    return number;
  }

  /// 获取数字有几位小数
  static int getDecimalCount(String number) {
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

  /// 计算数字的百分比
  static String calPer(String num) {
    Decimal d1 = Decimal.parse(num);
    Decimal d2 = Decimal.parse("0.01");
    Decimal res = d1 * d2;
    return res.toString();
  }
}
