// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceOrderModelImpl _$$PlaceOrderModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PlaceOrderModelImpl(
      time: json['time'] as String?,
      orderId: json['orderId'] as String?,
      accountId: json['accountId'] as String?,
      clientOrderId: json['clientOrderId'] as String?,
      symbolId: json['symbolId'] as String?,
      origQty: json['origQty'] as String?,
      executedQty: json['executedQty'] as String?,
      executedAmount: json['executedAmount'] as String?,
      avgPrice: json['avgPrice'] as String?,
      type: json['type'] as String?,
      side: json['side'] as String?,
      fees: (json['fees'] as List<dynamic>?)
          ?.map((e) => FeesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      exchangeId: json['exchangeId'] as String?,
      updateTime: json['updateTime'] as String?,
    );

Map<String, dynamic> _$$PlaceOrderModelImplToJson(
        _$PlaceOrderModelImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'orderId': instance.orderId,
      'accountId': instance.accountId,
      'clientOrderId': instance.clientOrderId,
      'symbolId': instance.symbolId,
      'origQty': instance.origQty,
      'executedQty': instance.executedQty,
      'executedAmount': instance.executedAmount,
      'avgPrice': instance.avgPrice,
      'type': instance.type,
      'side': instance.side,
      'fees': instance.fees,
      'status': instance.status,
      'exchangeId': instance.exchangeId,
      'updateTime': instance.updateTime,
    };
