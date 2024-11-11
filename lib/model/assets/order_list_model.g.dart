// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderListModelImpl _$$OrderListModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderListModelImpl(
      id: json['id'] as String?,
      tokenId: json['tokenId'] as String?,
      tokenName: json['tokenName'] as String?,
      address: json['address'] as String?,
      time: json['time'] as String?,
      addressExt: json['addressExt'] as String?,
      fromAddress: json['fromAddress'] as String?,
      statusCode: json['statusCode'] as String?,
      statusDesc: json['statusDesc'] as String?,
      quantity: json['quantity'] as String?,
      txid: json['txid'] as String?,
      walletHandleTime: json['walletHandleTime'] as String?,
      feeTokenId: json['feeTokenId'] as String?,
      feeTokenName: json['feeTokenName'] as String?,
      fee: json['fee'] as String?,
      orderId: json['orderId'] as String?,
      requiredConfirmNum: json['requiredConfirmNum'] as num?,
      confirmNum: json['confirmNum'] as num?,
      failedReasonDesc: json['failedReasonDesc'] as String?,
    );

Map<String, dynamic> _$$OrderListModelImplToJson(
        _$OrderListModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tokenId': instance.tokenId,
      'tokenName': instance.tokenName,
      'address': instance.address,
      'time': instance.time,
      'addressExt': instance.addressExt,
      'fromAddress': instance.fromAddress,
      'statusCode': instance.statusCode,
      'statusDesc': instance.statusDesc,
      'quantity': instance.quantity,
      'txid': instance.txid,
      'walletHandleTime': instance.walletHandleTime,
      'feeTokenId': instance.feeTokenId,
      'feeTokenName': instance.feeTokenName,
      'fee': instance.fee,
      'orderId': instance.orderId,
      'requiredConfirmNum': instance.requiredConfirmNum,
      'confirmNum': instance.confirmNum,
      'failedReasonDesc': instance.failedReasonDesc,
    };
