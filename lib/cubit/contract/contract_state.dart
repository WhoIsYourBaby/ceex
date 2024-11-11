import 'package:ceex_flutter/model/contract/contract_entrust_model.dart';
import 'package:ceex_flutter/model/order/order_model.dart';
import 'package:ceex_flutter/model/user/user_account_money_model.dart';

class ContractState {
  final BbChooseType bbChooseType;
  final String price;
  final List<ContractEntrustModel> items;
  final double? rates;
  final String? usdtNum;
  final List<UserAccountMoneyModel>? assetsList; // 资产
  final List<OrderModel>? orderList; // 委托
  final double? usdtRates;

  final String? symbolName; // 币对名称（页面显示 格式自定义)
  final String? symbolId; // 币对id
  final String? exchangeId;
  final String? baseTokenId;

  final List<List<String>?>? a;
  final double? aMax;
  final List<List<String>?>? b;
  final double? bMax;

  final String? limitType;
  final String? ticker;
  final String? digitMerge;
  final List<String>? digitMergeNameList;
  final String? digitMergeConn;
  final bool? isShowOnly;
  ContractState({
    this.bbChooseType = BbChooseType.buy,
    this.price = "",
    this.items = const [],
    this.rates,
    this.usdtNum,
    this.assetsList = const [],
    this.orderList,
    this.usdtRates,
    this.symbolName,
    this.symbolId,
    this.a,
    this.aMax,
    this.b,
    this.bMax,
    this.exchangeId,
    this.baseTokenId = "",
    this.limitType,
    this.ticker,
    this.digitMerge,
    this.digitMergeNameList,
    this.digitMergeConn,
    this.isShowOnly,
  });

  // 初始化
  factory ContractState.initialState() {
    return ContractState(
        bbChooseType: BbChooseType.buy,
        price: "",
        items: [],
        rates: 0,
        usdtNum: "0",
        assetsList: const [],
        orderList: const [],
        symbolName: "1INCH/USDT",
        symbolId: "1INCHUSDT",
        usdtRates: 0,
        exchangeId: "301",
        baseTokenId: "1INCH",
        a: const [],
        aMax: 0,
        b: const [],
        bMax: 0,
        limitType: "limit",
        ticker: "--",
        digitMerge: "",
        digitMergeNameList:[],
        digitMergeConn:"",
        isShowOnly:false,
        );
  }

  // 赋值
  ContractState copyWith({
    BbChooseType? bbChooseType,
    String? price,
    List<ContractEntrustModel>? items,
    List<UserAccountMoneyModel>? assetsList,
    double? rates,
    double? usdtRates,
    String? usdtNum,
    List<OrderModel>? orderList,
    String? symbolName,
    String? symbolId,
    List<List<String>?>? a,
    double? aMax,
    List<List<String>?>? b,
    double? bMax,
    String? exchangeId,
    String? baseTokenId,
    String? limitType,
    String? ticker,
    String? digitMerge,
    List<String>? digitMergeNameList,
    String? digitMergeConn,
    bool? isShowOnly,
  }) {
    return ContractState(
      bbChooseType: bbChooseType ?? this.bbChooseType,
      price: price ?? this.price,
      items: items ?? this.items,
      rates: rates ?? this.rates,
      usdtNum: usdtNum ?? this.usdtNum,
      assetsList: assetsList ?? this.assetsList,
      orderList: orderList ?? this.orderList,
      usdtRates: usdtRates ?? this.usdtRates,
      symbolName: symbolName ?? this.symbolName,
      symbolId: symbolId ?? this.symbolId,
      a: a ?? this.a,
      aMax: aMax ?? this.aMax,
      b: b ?? this.b,
      bMax: bMax ?? this.bMax,
      exchangeId: exchangeId ?? this.exchangeId,
      baseTokenId: baseTokenId ?? this.baseTokenId,
      limitType: limitType ?? this.limitType,
      ticker: ticker ?? this.ticker,
      digitMerge: digitMerge ?? this.digitMerge,
      digitMergeNameList: digitMergeNameList ?? this.digitMergeNameList,
      digitMergeConn: digitMergeConn ?? this.digitMergeConn,
      isShowOnly: isShowOnly ?? this.isShowOnly
    );
  }
}

enum BbChooseType {
  buy,
  sell,
}
