// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appconfig_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppConfigQueryImpl _$$AppConfigQueryImplFromJson(Map<String, dynamic> json) =>
    _$AppConfigQueryImpl(
      appId: json['app_id'] as String,
      appVersion: json['app_version'] as String,
      deviceType: json['device_type'] as String,
      deviceVersion: json['device_version'] as String,
      lightModel: json['lightModel'] as int,
      moduleTypes: json['moduleTypes'] as String? ?? "1,2,4",
      type: json['type'] as String? ?? "all",
    );

Map<String, dynamic> _$$AppConfigQueryImplToJson(
        _$AppConfigQueryImpl instance) =>
    <String, dynamic>{
      'app_id': instance.appId,
      'app_version': instance.appVersion,
      'device_type': instance.deviceType,
      'device_version': instance.deviceVersion,
      'lightModel': instance.lightModel,
      'moduleTypes': instance.moduleTypes,
      'type': instance.type,
    };

_$AppConfigModelImpl _$$AppConfigModelImplFromJson(Map<String, dynamic> json) =>
    _$AppConfigModelImpl(
      orgId: json['orgId'] as String?,
      responseRandomKey: json['responseRandomKey'] as String?,
      domains: json['domains'] as String?,
      checkInviteCode: json['checkInviteCode'] as bool?,
      checkCompliance: json['checkCompliance'] as bool?,
      checkDepositKyt: json['checkDepositKyt'] as bool?,
      checkWithdrawKyt: json['checkWithdrawKyt'] as bool?,
      contractHelpUrl: json['contractHelpUrl'] as String?,
      registerOption: json['registerOption'] as int?,
      realtimeInterval: json['realtimeInterval'] as String?,
      announcementMoreUrl: json['announcementMoreUrl'] as String?,
      checksum: json['checksum'] as String?,
      updated: json['updated'] as bool?,
      token: (json['token'] as List<dynamic>?)
          ?.map((e) => TokenModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      symbol: (json['symbol'] as List<dynamic>?)
          ?.map((e) => SymbolModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommendSymbols: (json['recommendSymbols'] as List<dynamic>?)
          ?.map((e) => SymbolModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      customQuoteToken: (json['customQuoteToken'] as List<dynamic>?)
          ?.map(
              (e) => CustomQuoteTokenModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AppConfigModelImplToJson(
        _$AppConfigModelImpl instance) =>
    <String, dynamic>{
      'orgId': instance.orgId,
      'responseRandomKey': instance.responseRandomKey,
      'domains': instance.domains,
      'checkInviteCode': instance.checkInviteCode,
      'checkCompliance': instance.checkCompliance,
      'checkDepositKyt': instance.checkDepositKyt,
      'checkWithdrawKyt': instance.checkWithdrawKyt,
      'contractHelpUrl': instance.contractHelpUrl,
      'registerOption': instance.registerOption,
      'realtimeInterval': instance.realtimeInterval,
      'announcementMoreUrl': instance.announcementMoreUrl,
      'checksum': instance.checksum,
      'updated': instance.updated,
      'token': instance.token,
      'symbol': instance.symbol,
      'recommendSymbols': instance.recommendSymbols,
      'customQuoteToken': instance.customQuoteToken,
    };
