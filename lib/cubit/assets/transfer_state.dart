part of 'transfer_cubit.dart';


@freezed
class TransferState with  _$TransferState{
  const factory TransferState.initial({
    bool? showAssets,// 是否显示资产
    String? fromType,// 从
    String? toType,// 到
    SubAccountQueryModel? sourceAssetType,//转出账户
    SubAccountQueryModel? targetAssetType,//接收到账账户
    String? amount,
    double? slideValue,
    String? priceText,
    List<SubAccountQueryModel>? accountList,
    bool? success,
    String? tokenName,
    String? tokenNameImage,

  }) = _Initial;
}