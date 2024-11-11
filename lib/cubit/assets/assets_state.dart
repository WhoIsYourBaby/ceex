part of 'assets_cubit.dart';


@freezed
class AssetsState with  _$AssetsState{
  const factory AssetsState.initial({
    bool? showAssets,// 是否显示资产
    List<AssetsBalanceFlowModel>? balanceFlow,
    List<dynamic>? flow,
    List<dynamic>? spotList,
    String? total,// 资产总估值
    TotalType? totalType,// 资产总估值
    String? btcValue,// btc资产总估值
    String? usdtValue,// usdt资产总估值
    List<EChartPieBean>? eChartList,
    List<UserAccountMoneyChangeModel>? zichanList,
    bool? showZero,
    double? rates,// 汇率
    String? money,// 法币
    String? walletMoney,// 钱包的钱
    String? financingtMoney,// 合约的钱
    String? leverMoney,// 杠杆的钱
    List<UserAccountMoneyModel>? connectMoneyList,// 合约的主账户钱列表
    List<LevelMoneyModel>? leverMoneyList,// 杠杆的主账户钱列表
    // List<UserAccountMoneyModel>? leverMoneyList,// 财富的主账户钱列表
    String? contractMoney,// 财富的钱

  }) = _Initial;
}

enum TotalType{
  btcValue,
  usdtValue
}

enum WalletType{
  /// 钱包
  wallet,
  /// 财富
  contract,
  /// 合约
  financing,
  /// 杠杆
  lever,
  /// 其他
  other,
}