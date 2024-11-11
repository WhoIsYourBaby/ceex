/*
 * @Description: 
 * @Author: zhaojijin
 * @LastEditors: zhaojijin
 * @Date: 2019-04-16 14:33:00
 * @LastEditTime: 2019-05-13 16:07:14
 */

import '../../fkline/model/klineConstrants.dart';

import '../model/klineModel.dart';

class KlineDataManager {
  static final List<int> volumeMaList = [5, 10];

  static List<Market> calculatePriceMa(
    List<Market> dataList,
    List<YKLineType> maLines,
  ) {
    List<Market> tmpList = dataList;
    for (int numIndex = 0; numIndex < maLines.length; numIndex++) {
      final maType = maLines[numIndex];
      int maNum = maType.specNum;
      if (maNum <= 0) {
        return tmpList;
      }
      int listCount = tmpList.length;
      for (int i = tmpList.length - 1; i >= 0; i--) {
        Market market = tmpList[i];
        final priceMa = market.getValueForType(maType);
        if (priceMa != null) {
          break;
        }

        if (i <= tmpList.length - maNum) {
          Market? lastData;
          if (i < tmpList.length - 1) {
            lastData = tmpList[i + 1];
          }
          double? lastMa;
          if (lastData != null) {
            lastMa = lastData.getValueForType(maType);
          }
          double priceMa = 0;
          if (lastMa != null) {
            Market deleteData = tmpList[i + maNum];
            priceMa =
                lastMa * maNum + (market.close ?? 0) - (deleteData.close ?? 0);
          } else {
            List<Market> aveArray = tmpList.sublist(i, listCount);
            for (var tmpData in aveArray) {
              priceMa += (tmpData.close ?? 0);
            }
          }
          priceMa = priceMa / maNum;
          tmpList[i].setValueForType(maType, priceMa);
        }
      }
    }
    return tmpList;
  }

  static List<Market> calculatePriceEma(
    List<Market> dataList,
    List<YKLineType> emaLines,
  ) {
    List<Market> tmpList = dataList;
    for (var i = 0; i < emaLines.length; i++) {
      final lineType = emaLines[i];
      final specNum = lineType.specNum;
      // 数据长度不足 || type错误
      if (specNum <= 0 || tmpList.length <= specNum) {
        return dataList;
      }
      // 从specNum前一个开始
      for (int j = tmpList.length - specNum + 1; j >= 0; j--) {
        Market market = tmpList[j];
        if (j == tmpList.length - specNum + 1) {
          market.setValueForType(lineType, market.close);
        } else {
          Market prevMarket = tmpList[j + 1];
          final prevValue =
              prevMarket.getValueForType(lineType) ?? prevMarket.close ?? 0.0;
          /**
           * EMA（指数移动平均数）的计算公式可以表示为EMA(t) = α × V(t) + (1 - α) × EMA(t-1)
           * EMA(t)是在时间t的EMA值，EMA(t-1)是在时间t-1的EMA值，V(t)是在时间t的观测值(当前价格)，α是平滑因子，一般取作2/(N+1)
           * 这个公式是EMA计算的基本形式，用于获取一组数据的平滑处理后的值。
           * EMA1 的取值有几种不同的方法，通常情况下取EMA1为Price1另外有的技术是将EMA1取值为开头4到5个数值的均值。
           */
          final a = 2 / (specNum + 1);
          final curValue = a * (market.close ?? 0.0) + (1 - a) * prevValue;
          market.setValueForType(lineType, curValue);
        }
      }
    }
    return tmpList;
  }

  static List<Market> calculateVolumeMa(List<Market> dataList) {
    // TODO： 计算幅图Ma数据
    return dataList;
  }
}
