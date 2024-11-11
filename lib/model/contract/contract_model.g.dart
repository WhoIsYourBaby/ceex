// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContractModelImpl _$$ContractModelImplFromJson(Map<String, dynamic> json) =>
    _$ContractModelImpl(
      time: json['time'] as String?,
      orderId: json['orderId'] as String?,
      accountId: json['accountId'] as String?,
      symbolId: json['symbolId'] as String?,
      symbolName: json['symbolName'] as String?,
      baseTokenId: json['baseTokenId'] as String?,
      baseTokenName: json['baseTokenName'] as String?,
      quoteTokenId: json['quoteTokenId'] as String?,
      quoteTokenName: json['quoteTokenName'] as String?,
      price: json['price'] as String?,
      origQty: json['origQty'] as String?,
      executedQty: json['executedQty'] as String?,
      executedAmount: json['executedAmount'] as String?,
      avgPrice: json['avgPrice'] as String?,
      type: json['type'] as String?,
      side: json['side'] as String?,
      status: json['status'] as String?,
      statusDesc: json['statusDesc'] as String?,
      averagePrice: json['averagePrice'] as String?,
      noExecutedQty: json['noExecutedQty'] as String?,
      amount: json['amount'] as String?,
      tradeId: json['tradeId'] as String?,
      quantity: json['quantity'] as String?,
      fees: (json['fees'] as List<dynamic>?)
          ?.map((e) => FeesBeanModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ContractModelImplToJson(_$ContractModelImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'orderId': instance.orderId,
      'accountId': instance.accountId,
      'symbolId': instance.symbolId,
      'symbolName': instance.symbolName,
      'baseTokenId': instance.baseTokenId,
      'baseTokenName': instance.baseTokenName,
      'quoteTokenId': instance.quoteTokenId,
      'quoteTokenName': instance.quoteTokenName,
      'price': instance.price,
      'origQty': instance.origQty,
      'executedQty': instance.executedQty,
      'executedAmount': instance.executedAmount,
      'avgPrice': instance.avgPrice,
      'type': instance.type,
      'side': instance.side,
      'status': instance.status,
      'statusDesc': instance.statusDesc,
      'averagePrice': instance.averagePrice,
      'noExecutedQty': instance.noExecutedQty,
      'amount': instance.amount,
      'tradeId': instance.tradeId,
      'quantity': instance.quantity,
      'fees': instance.fees,
    };

_$FeesBeanModelImpl _$$FeesBeanModelImplFromJson(Map<String, dynamic> json) =>
    _$FeesBeanModelImpl(
      feeTokenId: json['feeTokenId'] as String?,
      feeTokenName: json['feeTokenName'] as String?,
      fee: json['fee'] as String?,
    );

Map<String, dynamic> _$$FeesBeanModelImplToJson(_$FeesBeanModelImpl instance) =>
    <String, dynamic>{
      'feeTokenId': instance.feeTokenId,
      'feeTokenName': instance.feeTokenName,
      'fee': instance.fee,
    };
