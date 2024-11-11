// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_check_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressCheckModelImpl _$$AddressCheckModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AddressCheckModelImpl(
      address: json['address'] as String?,
      addressExt: json['addressExt'] as String?,
      addressIsUserId: json['addressIsUserId'] as bool?,
      isIllegal: json['isIllegal'] as bool?,
      isInnerAddress: json['isInnerAddress'] as bool?,
      isInBlackList: json['isInBlackList'] as bool?,
    );

Map<String, dynamic> _$$AddressCheckModelImplToJson(
        _$AddressCheckModelImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'addressExt': instance.addressExt,
      'addressIsUserId': instance.addressIsUserId,
      'isIllegal': instance.isIllegal,
      'isInnerAddress': instance.isInnerAddress,
      'isInBlackList': instance.isInBlackList,
    };

_$WithdrawalCreateBodyImpl _$$WithdrawalCreateBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$WithdrawalCreateBodyImpl(
      accountId: json['account_id'] as String,
      address: json['address'] as String,
      addressId: json['address_id'] as String?,
      chainType: json['chain_type'] as String,
      clientOrderId: json['client_order_id'] as String,
      convertRate: json['convert_rate'] as num,
      minerFee: json['miner_fee'] as num,
      quantity: json['quantity'] as num,
      tokenId: json['token_id'] as String,
      tradePassword: json['trade_password'] as String,
      verifyCode: json['verify_code'] as String?,
      orderId: json['order_id'] as String?,
      authType: json['auth_type'] as int?,
    );

Map<String, dynamic> _$$WithdrawalCreateBodyImplToJson(
        _$WithdrawalCreateBodyImpl instance) =>
    <String, dynamic>{
      'account_id': instance.accountId,
      'address': instance.address,
      'address_id': instance.addressId,
      'chain_type': instance.chainType,
      'client_order_id': instance.clientOrderId,
      'convert_rate': instance.convertRate,
      'miner_fee': instance.minerFee,
      'quantity': instance.quantity,
      'token_id': instance.tokenId,
      'trade_password': instance.tradePassword,
      'verify_code': instance.verifyCode,
      'order_id': instance.orderId,
      'auth_type': instance.authType,
    };
