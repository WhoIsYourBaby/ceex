/*
 * @Description: 
 * @Author: zhaojijin
 * @LastEditors: zhaojijin
 * @Date: 2019-04-16 15:02:34
 * @LastEditTime: 2019-10-11 10:29:43
 */
import 'dart:math';

import 'package:flutter/material.dart';
import 'klineBlocProvider.dart';
import '../manager/klineDataManager.dart';
import '../model/klineModel.dart';
import '../model/klineConstrants.dart';
import 'package:rxdart/rxdart.dart';

class KlineBloc extends KlineBlocBase {
  // 总数据的流入流出
  BehaviorSubject<List<Market>> _klineListSubject =
      BehaviorSubject<List<Market>>();
  Sink<List<Market>> get _klineListSink => _klineListSubject.sink;
  Stream<List<Market>> get klineListStream => _klineListSubject.stream;

  // 当前数据的流入流出
  BehaviorSubject<List<Market>> _klineCurrentListSubject =
      BehaviorSubject<List<Market>>();
  Sink<List<Market>> get _currentKlineListSink => _klineCurrentListSubject.sink;
  Stream<List<Market>> get currentKlineListStream =>
      _klineCurrentListSubject.stream;

  // 点击获取单条k线数据
  PublishSubject<Market> _klineMarketSubject = PublishSubject<Market>();
  Sink<Market> get _klineMarketSink => _klineMarketSubject.sink;
  Stream<Market> get klineMarketStream => _klineMarketSubject.stream;

  // periodSwitch
  PublishSubject<String> _klinePeriodSwitchSubject = PublishSubject<String>();
  Sink<String> get _klinePeriodSwitchSink => _klinePeriodSwitchSubject.sink;
  Stream<String> get _klinePeriodSwitchStream =>
      _klinePeriodSwitchSubject.stream;

  // showloading
  PublishSubject<bool> _klineShowLoadingSubject = PublishSubject<bool>();
  Sink<bool> get _klineShowLoadingSink => _klineShowLoadingSubject.sink;
  Stream<bool> get klineShowLoadingStream => _klineShowLoadingSubject.stream;

  final List<YKLineType> _lineTypes = [
    YKLineType.MA5,
    YKLineType.MA10,
    YKLineType.MA30,
  ];
  final BehaviorSubject<List<YKLineType>> _lineTypesSubject =
      BehaviorSubject<List<YKLineType>>();
  Sink<List<YKLineType>> get _lineTypesSink => _lineTypesSubject.sink;
  Stream<List<YKLineType>> get lineTypesStream => _lineTypesSubject.stream;

  /// 单屏显示的kline数据
  List<Market> klineCurrentList = [];

  /// 总数据
  List<Market> klineTotalList = [];

  double screenWidth = 375;
  double? priceMax;
  double? priceMin;

  double? pMax;
  double? pMin;

  double? volumeMax;
  int? firstScreenCandleCount;
  double? candlestickWidth = kCandlestickWidth;

  GlobalKey candleWidgetKey = GlobalKey();
  GlobalKey volumeWidgetKey = GlobalKey();

  /// 当前K线滑到的起点位置
  int? fromIndex;

  /// 当前K线滑到的终点位置
  int? toIndex;

  KlineBloc() {
    initData();
    _lineTypesSink.add(_lineTypes);
    _klinePeriodSwitchStream.listen(periodSwitch);
  }
  void periodSwitch(String period) {}
  void initData() {}

  @override
  void dispose() {
    _klineListSubject.close();
    _klineCurrentListSubject.close();
    _klineMarketSubject.close();
    _klinePeriodSwitchSubject.close();
    _klineShowLoadingSubject.close();
  }

  void refreshAllKlineData(List<Market> dataList) {
    if (dataList.length > 0) {
      klineTotalList.clear();
      klineTotalList = KlineDataManager.calculatePriceMa(dataList, [
        YKLineType.MA5,
        YKLineType.MA10,
        YKLineType.MA30,
      ]);
      klineTotalList = KlineDataManager.calculatePriceEma(dataList, [
        YKLineType.EMA12,
        YKLineType.EMA26,
      ]);
      // klineTotalList = KlineDataManager.calculateVolumeMa(dataList);
      _klineListSink.add(klineTotalList);
    }
  }

  void setCandlestickWidth(double scaleWidth) {
    if (scaleWidth > 25 || scaleWidth < 2) {
      return;
    }
    candlestickWidth = scaleWidth;
  }

  int getSingleScreenCandleCount(double width) {
    screenWidth = width;
    double count = (screenWidth - kCandlestickGap) /
        ((candlestickWidth ?? 0) + kCandlestickGap);
    int totalScreenCountNum = count.toInt();
    return totalScreenCountNum;
  }

  double getFirstScreenScale() {
    return (kGridColumCount - 1) / kGridColumCount;
  }

  void setScreenWidth(double width) {
    screenWidth = width;
    int singleScreenCandleCount = getSingleScreenCandleCount(screenWidth);
    int maxCount = this.klineTotalList.length;
    int firstScreenNum =
        (getFirstScreenScale() * singleScreenCandleCount).toInt();
    if (singleScreenCandleCount > maxCount) {
      firstScreenNum = maxCount;
    }
    firstScreenCandleCount = firstScreenNum;

    resetCurrentKlineList(0, firstScreenCandleCount ?? 0);
  }

  void resetCurrentKlineList(int from, int to) {
    fromIndex = from;
    toIndex = to;
    List<Market> list = this.klineTotalList;
    klineCurrentList.clear();
    klineCurrentList = list.sublist(from, to);
    _calculateCurrentKlineDataLimit();
    _currentKlineListSink.add(klineCurrentList);
  }

  void _calculateCurrentKlineDataLimit() {
    double _priceMax = -double.infinity;
    double _priceMin = double.infinity;
    double _pMax = -double.infinity;
    double _pMin = double.infinity;
    double _volumeMax = -double.infinity;
    for (var item in klineCurrentList) {
      _volumeMax = max((item.vol ?? 0), _volumeMax);

      _priceMax = max(_priceMax, (item.high ?? 0));
      _priceMin = min(_priceMin, (item.low ?? 0));

      _pMax = max(_pMax, (item.high ?? 0));
      _pMin = min(_pMin, (item.low ?? 0));

      /// 与x日均线数据对比计算最高最低价格
      pMax = _pMax;
      pMin = _pMin;
      final priceMa5 = item.getValueForType(YKLineType.MA5);
      final priceMa10 = item.getValueForType(YKLineType.MA10);
      final priceMa30 = item.getValueForType(YKLineType.MA30);
      priceMax = [
        priceMa5 ?? 0,
        priceMa10 ?? 0,
        priceMa30 ?? 0,
        _priceMax,
      ].reduce((value, element) => max(value, element));
      priceMin = [
        priceMa5 ?? 0,
        priceMa10 ?? 0,
        priceMa30 ?? 0,
        _priceMin,
      ].reduce((value, element) => min(value, element));
      volumeMax = _volumeMax;
    }
  }

  void marketSinkAdd(Market market) {
    _klineMarketSink.add(market);
  }

  void periodSwitchSinkAdd(String period) {
    _klinePeriodSwitchSink.add(period);
  }

  void showLoadingSinkAdd(bool show) {
    // if (show != null) {
    _klineShowLoadingSink.add(show);
    // }
  }

  void addKlineTypes(List<YKLineType> types) {
    types.forEach((element) {
      final index = _lineTypes.indexOf(element);
      if (index < 0) {
        _lineTypes.add(element);
      }
    });
    _lineTypesSink.add(_lineTypes);
  }

  void removeKlineTypes(List<YKLineType> types) {
    types.forEach((element) {
      final index = _lineTypes.indexOf(element);
      if (index >= 0) {
        _lineTypes.removeAt(index);
      }
    });
    _lineTypesSink.add(_lineTypes);
  }
}
