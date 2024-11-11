part of 'contract_view_cubit.dart';

@freezed
class ContractViewState with _$ContractViewState {
  const factory ContractViewState.initial({
    BbChooseType? bbChooseType,
    String? price,
    List<ContractEntrustModel>? items,
    List<UserAccountMoneyModel>? assetsList,
    double? rates,
    double? usdtRates,
    String? usdtNum,
    String? baseTokenNum,
    List<OrderModel>? orderList,
    List<OrderModel>? historyOrderList,
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
    bool? isShowHistoryOnly,
    String? basePrecision, // 最小数量精度
    String? minPricePrecision, // 最小价格精度/ 最小交易价格/ 每次价格变动，最小的变动单位
    String? quotePrecision, // 最小金额精度
    String? minTradeQuantity, // 单次交易最小交易base的数量
    String? minTradeAmount, // 最小交易额
    String? marketPrice,// 市价
    bool? changePrice,// 是否更改价格
    bool? needRefreshData,
    bool? isBuyIng,
  }) = _Initial;
}
