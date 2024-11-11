// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddAddressModelImpl _$$AddAddressModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AddAddressModelImpl(
      id: json['id'] as String?,
      token: json['token'] as String?,
      tokenId: json['tokenId'] as String?,
      chainType: json['chainType'] as String?,
      tokenName: json['tokenName'] as String?,
      address: json['address'] as String?,
      addressExt: json['addressExt'] as String?,
      remark: json['remark'] as String?,
    );

Map<String, dynamic> _$$AddAddressModelImplToJson(
        _$AddAddressModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'tokenId': instance.tokenId,
      'chainType': instance.chainType,
      'tokenName': instance.tokenName,
      'address': instance.address,
      'addressExt': instance.addressExt,
      'remark': instance.remark,
    };
