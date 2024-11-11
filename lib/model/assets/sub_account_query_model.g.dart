// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_account_query_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubAccountQueryModelImpl _$$SubAccountQueryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SubAccountQueryModelImpl(
      accountId: json['accountId'] as String?,
      accountName: json['accountName'] as String?,
      accountType: json['accountType'] as int?,
      accountIndex: json['accountIndex'] as int?,
      canChoose: json['canChoose'] as bool?,
    );

Map<String, dynamic> _$$SubAccountQueryModelImplToJson(
        _$SubAccountQueryModelImpl instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'accountName': instance.accountName,
      'accountType': instance.accountType,
      'accountIndex': instance.accountIndex,
      'canChoose': instance.canChoose,
    };
