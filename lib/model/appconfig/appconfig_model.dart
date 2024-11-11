import "package:ceex_flutter/model/appconfig/custom_quote_token.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:flutter/foundation.dart";
import 'symbol_model.dart';
part "appconfig_model.freezed.dart";
part "appconfig_model.g.dart";

@freezed
class AppConfigQuery with _$AppConfigQuery {
  const factory AppConfigQuery({
    @JsonKey(name: "app_id") required String appId,
    @JsonKey(name: "app_version") required String appVersion,
    @JsonKey(name: "device_type") required String deviceType,
    @JsonKey(name: "device_version") required String deviceVersion,
    // 夜晚：2，白天1
    required int lightModel,
    // 固定值：1,2,4
    @Default("1,2,4") String moduleTypes,
    // 固定值：all
    @Default("all") String type,
  }) = _AppConfigQuery;

  factory AppConfigQuery.fromJson(Map<String, Object?> json) =>
      _$AppConfigQueryFromJson(json);
}

@freezed
class AppConfigModel with _$AppConfigModel {
  const AppConfigModel._();
  const factory AppConfigModel({
    String? orgId,
    String? responseRandomKey,
    String? domains,
    bool? checkInviteCode,
    bool? checkCompliance,
    bool? checkDepositKyt,
    bool? checkWithdrawKyt,
    String? contractHelpUrl,
    int? registerOption,
    String? realtimeInterval,
    String? announcementMoreUrl,
    String? checksum,
    bool? updated,
    List<TokenModel>? token,
    List<SymbolModel>? symbol,
    List<SymbolModel>? recommendSymbols,
    List<CustomQuoteTokenModel>? customQuoteToken,
  }) = _AppConfigModel;

  factory AppConfigModel.fromJson(Map<String, Object?> json) =>
      _$AppConfigModelFromJson(json);

  Map<String, dynamic> createTokenIconMap() {
    final Map<String, dynamic> iconMap = {};
    for (var i = 0; i < (token ?? []).length; i++) {
      final tk = token![i];
      iconMap[tk.tokenId ?? ""] = tk.iconUrl;
    }
    return iconMap;
  }
  Map<String, dynamic> createSymbolIconMap() {
    final Map<String, dynamic> iconMap = {};
    for (var i = 0; i < (symbol ?? []).length; i++) {
      final tk = symbol![i];
      iconMap[tk.symbolId ?? ""] = tk.iconUrl;
    }
    return iconMap;
  }
}