import "package:freezed_annotation/freezed_annotation.dart";
import "package:flutter/foundation.dart";

part "add_address_model.freezed.dart";
part "add_address_model.g.dart";

/// 添加地址
@freezed
class AddAddressModel with _$AddAddressModel {
  const factory AddAddressModel({
    String? id,
    String? token,
    String? tokenId,
    String? chainType,
    String? tokenName,
    String? address,
    String? addressExt,
    String? remark,
  }) = _AddAddressModel;

  factory AddAddressModel.fromJson(Map<String, Object?> json) =>
      _$AddAddressModelFromJson(json);
}