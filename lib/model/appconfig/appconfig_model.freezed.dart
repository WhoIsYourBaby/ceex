// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appconfig_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppConfigQuery _$AppConfigQueryFromJson(Map<String, dynamic> json) {
  return _AppConfigQuery.fromJson(json);
}

/// @nodoc
mixin _$AppConfigQuery {
  @JsonKey(name: "app_id")
  String get appId => throw _privateConstructorUsedError;
  @JsonKey(name: "app_version")
  String get appVersion => throw _privateConstructorUsedError;
  @JsonKey(name: "device_type")
  String get deviceType => throw _privateConstructorUsedError;
  @JsonKey(name: "device_version")
  String get deviceVersion => throw _privateConstructorUsedError; // 夜晚：2，白天1
  int get lightModel => throw _privateConstructorUsedError; // 固定值：1,2,4
  String get moduleTypes => throw _privateConstructorUsedError; // 固定值：all
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppConfigQueryCopyWith<AppConfigQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigQueryCopyWith<$Res> {
  factory $AppConfigQueryCopyWith(
          AppConfigQuery value, $Res Function(AppConfigQuery) then) =
      _$AppConfigQueryCopyWithImpl<$Res, AppConfigQuery>;
  @useResult
  $Res call(
      {@JsonKey(name: "app_id") String appId,
      @JsonKey(name: "app_version") String appVersion,
      @JsonKey(name: "device_type") String deviceType,
      @JsonKey(name: "device_version") String deviceVersion,
      int lightModel,
      String moduleTypes,
      String type});
}

/// @nodoc
class _$AppConfigQueryCopyWithImpl<$Res, $Val extends AppConfigQuery>
    implements $AppConfigQueryCopyWith<$Res> {
  _$AppConfigQueryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appId = null,
    Object? appVersion = null,
    Object? deviceType = null,
    Object? deviceVersion = null,
    Object? lightModel = null,
    Object? moduleTypes = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as String,
      appVersion: null == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      deviceType: null == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String,
      deviceVersion: null == deviceVersion
          ? _value.deviceVersion
          : deviceVersion // ignore: cast_nullable_to_non_nullable
              as String,
      lightModel: null == lightModel
          ? _value.lightModel
          : lightModel // ignore: cast_nullable_to_non_nullable
              as int,
      moduleTypes: null == moduleTypes
          ? _value.moduleTypes
          : moduleTypes // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppConfigQueryImplCopyWith<$Res>
    implements $AppConfigQueryCopyWith<$Res> {
  factory _$$AppConfigQueryImplCopyWith(_$AppConfigQueryImpl value,
          $Res Function(_$AppConfigQueryImpl) then) =
      __$$AppConfigQueryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "app_id") String appId,
      @JsonKey(name: "app_version") String appVersion,
      @JsonKey(name: "device_type") String deviceType,
      @JsonKey(name: "device_version") String deviceVersion,
      int lightModel,
      String moduleTypes,
      String type});
}

/// @nodoc
class __$$AppConfigQueryImplCopyWithImpl<$Res>
    extends _$AppConfigQueryCopyWithImpl<$Res, _$AppConfigQueryImpl>
    implements _$$AppConfigQueryImplCopyWith<$Res> {
  __$$AppConfigQueryImplCopyWithImpl(
      _$AppConfigQueryImpl _value, $Res Function(_$AppConfigQueryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appId = null,
    Object? appVersion = null,
    Object? deviceType = null,
    Object? deviceVersion = null,
    Object? lightModel = null,
    Object? moduleTypes = null,
    Object? type = null,
  }) {
    return _then(_$AppConfigQueryImpl(
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as String,
      appVersion: null == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      deviceType: null == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String,
      deviceVersion: null == deviceVersion
          ? _value.deviceVersion
          : deviceVersion // ignore: cast_nullable_to_non_nullable
              as String,
      lightModel: null == lightModel
          ? _value.lightModel
          : lightModel // ignore: cast_nullable_to_non_nullable
              as int,
      moduleTypes: null == moduleTypes
          ? _value.moduleTypes
          : moduleTypes // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppConfigQueryImpl
    with DiagnosticableTreeMixin
    implements _AppConfigQuery {
  const _$AppConfigQueryImpl(
      {@JsonKey(name: "app_id") required this.appId,
      @JsonKey(name: "app_version") required this.appVersion,
      @JsonKey(name: "device_type") required this.deviceType,
      @JsonKey(name: "device_version") required this.deviceVersion,
      required this.lightModel,
      this.moduleTypes = "1,2,4",
      this.type = "all"});

  factory _$AppConfigQueryImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppConfigQueryImplFromJson(json);

  @override
  @JsonKey(name: "app_id")
  final String appId;
  @override
  @JsonKey(name: "app_version")
  final String appVersion;
  @override
  @JsonKey(name: "device_type")
  final String deviceType;
  @override
  @JsonKey(name: "device_version")
  final String deviceVersion;
// 夜晚：2，白天1
  @override
  final int lightModel;
// 固定值：1,2,4
  @override
  @JsonKey()
  final String moduleTypes;
// 固定值：all
  @override
  @JsonKey()
  final String type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppConfigQuery(appId: $appId, appVersion: $appVersion, deviceType: $deviceType, deviceVersion: $deviceVersion, lightModel: $lightModel, moduleTypes: $moduleTypes, type: $type)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppConfigQuery'))
      ..add(DiagnosticsProperty('appId', appId))
      ..add(DiagnosticsProperty('appVersion', appVersion))
      ..add(DiagnosticsProperty('deviceType', deviceType))
      ..add(DiagnosticsProperty('deviceVersion', deviceVersion))
      ..add(DiagnosticsProperty('lightModel', lightModel))
      ..add(DiagnosticsProperty('moduleTypes', moduleTypes))
      ..add(DiagnosticsProperty('type', type));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConfigQueryImpl &&
            (identical(other.appId, appId) || other.appId == appId) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType) &&
            (identical(other.deviceVersion, deviceVersion) ||
                other.deviceVersion == deviceVersion) &&
            (identical(other.lightModel, lightModel) ||
                other.lightModel == lightModel) &&
            (identical(other.moduleTypes, moduleTypes) ||
                other.moduleTypes == moduleTypes) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, appId, appVersion, deviceType,
      deviceVersion, lightModel, moduleTypes, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppConfigQueryImplCopyWith<_$AppConfigQueryImpl> get copyWith =>
      __$$AppConfigQueryImplCopyWithImpl<_$AppConfigQueryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppConfigQueryImplToJson(
      this,
    );
  }
}

abstract class _AppConfigQuery implements AppConfigQuery {
  const factory _AppConfigQuery(
      {@JsonKey(name: "app_id") required final String appId,
      @JsonKey(name: "app_version") required final String appVersion,
      @JsonKey(name: "device_type") required final String deviceType,
      @JsonKey(name: "device_version") required final String deviceVersion,
      required final int lightModel,
      final String moduleTypes,
      final String type}) = _$AppConfigQueryImpl;

  factory _AppConfigQuery.fromJson(Map<String, dynamic> json) =
      _$AppConfigQueryImpl.fromJson;

  @override
  @JsonKey(name: "app_id")
  String get appId;
  @override
  @JsonKey(name: "app_version")
  String get appVersion;
  @override
  @JsonKey(name: "device_type")
  String get deviceType;
  @override
  @JsonKey(name: "device_version")
  String get deviceVersion;
  @override // 夜晚：2，白天1
  int get lightModel;
  @override // 固定值：1,2,4
  String get moduleTypes;
  @override // 固定值：all
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$AppConfigQueryImplCopyWith<_$AppConfigQueryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppConfigModel _$AppConfigModelFromJson(Map<String, dynamic> json) {
  return _AppConfigModel.fromJson(json);
}

/// @nodoc
mixin _$AppConfigModel {
  String? get orgId => throw _privateConstructorUsedError;
  String? get responseRandomKey => throw _privateConstructorUsedError;
  String? get domains => throw _privateConstructorUsedError;
  bool? get checkInviteCode => throw _privateConstructorUsedError;
  bool? get checkCompliance => throw _privateConstructorUsedError;
  bool? get checkDepositKyt => throw _privateConstructorUsedError;
  bool? get checkWithdrawKyt => throw _privateConstructorUsedError;
  String? get contractHelpUrl => throw _privateConstructorUsedError;
  int? get registerOption => throw _privateConstructorUsedError;
  String? get realtimeInterval => throw _privateConstructorUsedError;
  String? get announcementMoreUrl => throw _privateConstructorUsedError;
  String? get checksum => throw _privateConstructorUsedError;
  bool? get updated => throw _privateConstructorUsedError;
  List<TokenModel>? get token => throw _privateConstructorUsedError;
  List<SymbolModel>? get symbol => throw _privateConstructorUsedError;
  List<SymbolModel>? get recommendSymbols => throw _privateConstructorUsedError;
  List<CustomQuoteTokenModel>? get customQuoteToken =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppConfigModelCopyWith<AppConfigModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigModelCopyWith<$Res> {
  factory $AppConfigModelCopyWith(
          AppConfigModel value, $Res Function(AppConfigModel) then) =
      _$AppConfigModelCopyWithImpl<$Res, AppConfigModel>;
  @useResult
  $Res call(
      {String? orgId,
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
      List<CustomQuoteTokenModel>? customQuoteToken});
}

/// @nodoc
class _$AppConfigModelCopyWithImpl<$Res, $Val extends AppConfigModel>
    implements $AppConfigModelCopyWith<$Res> {
  _$AppConfigModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orgId = freezed,
    Object? responseRandomKey = freezed,
    Object? domains = freezed,
    Object? checkInviteCode = freezed,
    Object? checkCompliance = freezed,
    Object? checkDepositKyt = freezed,
    Object? checkWithdrawKyt = freezed,
    Object? contractHelpUrl = freezed,
    Object? registerOption = freezed,
    Object? realtimeInterval = freezed,
    Object? announcementMoreUrl = freezed,
    Object? checksum = freezed,
    Object? updated = freezed,
    Object? token = freezed,
    Object? symbol = freezed,
    Object? recommendSymbols = freezed,
    Object? customQuoteToken = freezed,
  }) {
    return _then(_value.copyWith(
      orgId: freezed == orgId
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as String?,
      responseRandomKey: freezed == responseRandomKey
          ? _value.responseRandomKey
          : responseRandomKey // ignore: cast_nullable_to_non_nullable
              as String?,
      domains: freezed == domains
          ? _value.domains
          : domains // ignore: cast_nullable_to_non_nullable
              as String?,
      checkInviteCode: freezed == checkInviteCode
          ? _value.checkInviteCode
          : checkInviteCode // ignore: cast_nullable_to_non_nullable
              as bool?,
      checkCompliance: freezed == checkCompliance
          ? _value.checkCompliance
          : checkCompliance // ignore: cast_nullable_to_non_nullable
              as bool?,
      checkDepositKyt: freezed == checkDepositKyt
          ? _value.checkDepositKyt
          : checkDepositKyt // ignore: cast_nullable_to_non_nullable
              as bool?,
      checkWithdrawKyt: freezed == checkWithdrawKyt
          ? _value.checkWithdrawKyt
          : checkWithdrawKyt // ignore: cast_nullable_to_non_nullable
              as bool?,
      contractHelpUrl: freezed == contractHelpUrl
          ? _value.contractHelpUrl
          : contractHelpUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      registerOption: freezed == registerOption
          ? _value.registerOption
          : registerOption // ignore: cast_nullable_to_non_nullable
              as int?,
      realtimeInterval: freezed == realtimeInterval
          ? _value.realtimeInterval
          : realtimeInterval // ignore: cast_nullable_to_non_nullable
              as String?,
      announcementMoreUrl: freezed == announcementMoreUrl
          ? _value.announcementMoreUrl
          : announcementMoreUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      checksum: freezed == checksum
          ? _value.checksum
          : checksum // ignore: cast_nullable_to_non_nullable
              as String?,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as bool?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as List<TokenModel>?,
      symbol: freezed == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as List<SymbolModel>?,
      recommendSymbols: freezed == recommendSymbols
          ? _value.recommendSymbols
          : recommendSymbols // ignore: cast_nullable_to_non_nullable
              as List<SymbolModel>?,
      customQuoteToken: freezed == customQuoteToken
          ? _value.customQuoteToken
          : customQuoteToken // ignore: cast_nullable_to_non_nullable
              as List<CustomQuoteTokenModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppConfigModelImplCopyWith<$Res>
    implements $AppConfigModelCopyWith<$Res> {
  factory _$$AppConfigModelImplCopyWith(_$AppConfigModelImpl value,
          $Res Function(_$AppConfigModelImpl) then) =
      __$$AppConfigModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? orgId,
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
      List<CustomQuoteTokenModel>? customQuoteToken});
}

/// @nodoc
class __$$AppConfigModelImplCopyWithImpl<$Res>
    extends _$AppConfigModelCopyWithImpl<$Res, _$AppConfigModelImpl>
    implements _$$AppConfigModelImplCopyWith<$Res> {
  __$$AppConfigModelImplCopyWithImpl(
      _$AppConfigModelImpl _value, $Res Function(_$AppConfigModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orgId = freezed,
    Object? responseRandomKey = freezed,
    Object? domains = freezed,
    Object? checkInviteCode = freezed,
    Object? checkCompliance = freezed,
    Object? checkDepositKyt = freezed,
    Object? checkWithdrawKyt = freezed,
    Object? contractHelpUrl = freezed,
    Object? registerOption = freezed,
    Object? realtimeInterval = freezed,
    Object? announcementMoreUrl = freezed,
    Object? checksum = freezed,
    Object? updated = freezed,
    Object? token = freezed,
    Object? symbol = freezed,
    Object? recommendSymbols = freezed,
    Object? customQuoteToken = freezed,
  }) {
    return _then(_$AppConfigModelImpl(
      orgId: freezed == orgId
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as String?,
      responseRandomKey: freezed == responseRandomKey
          ? _value.responseRandomKey
          : responseRandomKey // ignore: cast_nullable_to_non_nullable
              as String?,
      domains: freezed == domains
          ? _value.domains
          : domains // ignore: cast_nullable_to_non_nullable
              as String?,
      checkInviteCode: freezed == checkInviteCode
          ? _value.checkInviteCode
          : checkInviteCode // ignore: cast_nullable_to_non_nullable
              as bool?,
      checkCompliance: freezed == checkCompliance
          ? _value.checkCompliance
          : checkCompliance // ignore: cast_nullable_to_non_nullable
              as bool?,
      checkDepositKyt: freezed == checkDepositKyt
          ? _value.checkDepositKyt
          : checkDepositKyt // ignore: cast_nullable_to_non_nullable
              as bool?,
      checkWithdrawKyt: freezed == checkWithdrawKyt
          ? _value.checkWithdrawKyt
          : checkWithdrawKyt // ignore: cast_nullable_to_non_nullable
              as bool?,
      contractHelpUrl: freezed == contractHelpUrl
          ? _value.contractHelpUrl
          : contractHelpUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      registerOption: freezed == registerOption
          ? _value.registerOption
          : registerOption // ignore: cast_nullable_to_non_nullable
              as int?,
      realtimeInterval: freezed == realtimeInterval
          ? _value.realtimeInterval
          : realtimeInterval // ignore: cast_nullable_to_non_nullable
              as String?,
      announcementMoreUrl: freezed == announcementMoreUrl
          ? _value.announcementMoreUrl
          : announcementMoreUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      checksum: freezed == checksum
          ? _value.checksum
          : checksum // ignore: cast_nullable_to_non_nullable
              as String?,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as bool?,
      token: freezed == token
          ? _value._token
          : token // ignore: cast_nullable_to_non_nullable
              as List<TokenModel>?,
      symbol: freezed == symbol
          ? _value._symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as List<SymbolModel>?,
      recommendSymbols: freezed == recommendSymbols
          ? _value._recommendSymbols
          : recommendSymbols // ignore: cast_nullable_to_non_nullable
              as List<SymbolModel>?,
      customQuoteToken: freezed == customQuoteToken
          ? _value._customQuoteToken
          : customQuoteToken // ignore: cast_nullable_to_non_nullable
              as List<CustomQuoteTokenModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppConfigModelImpl extends _AppConfigModel
    with DiagnosticableTreeMixin {
  const _$AppConfigModelImpl(
      {this.orgId,
      this.responseRandomKey,
      this.domains,
      this.checkInviteCode,
      this.checkCompliance,
      this.checkDepositKyt,
      this.checkWithdrawKyt,
      this.contractHelpUrl,
      this.registerOption,
      this.realtimeInterval,
      this.announcementMoreUrl,
      this.checksum,
      this.updated,
      final List<TokenModel>? token,
      final List<SymbolModel>? symbol,
      final List<SymbolModel>? recommendSymbols,
      final List<CustomQuoteTokenModel>? customQuoteToken})
      : _token = token,
        _symbol = symbol,
        _recommendSymbols = recommendSymbols,
        _customQuoteToken = customQuoteToken,
        super._();

  factory _$AppConfigModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppConfigModelImplFromJson(json);

  @override
  final String? orgId;
  @override
  final String? responseRandomKey;
  @override
  final String? domains;
  @override
  final bool? checkInviteCode;
  @override
  final bool? checkCompliance;
  @override
  final bool? checkDepositKyt;
  @override
  final bool? checkWithdrawKyt;
  @override
  final String? contractHelpUrl;
  @override
  final int? registerOption;
  @override
  final String? realtimeInterval;
  @override
  final String? announcementMoreUrl;
  @override
  final String? checksum;
  @override
  final bool? updated;
  final List<TokenModel>? _token;
  @override
  List<TokenModel>? get token {
    final value = _token;
    if (value == null) return null;
    if (_token is EqualUnmodifiableListView) return _token;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SymbolModel>? _symbol;
  @override
  List<SymbolModel>? get symbol {
    final value = _symbol;
    if (value == null) return null;
    if (_symbol is EqualUnmodifiableListView) return _symbol;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SymbolModel>? _recommendSymbols;
  @override
  List<SymbolModel>? get recommendSymbols {
    final value = _recommendSymbols;
    if (value == null) return null;
    if (_recommendSymbols is EqualUnmodifiableListView)
      return _recommendSymbols;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CustomQuoteTokenModel>? _customQuoteToken;
  @override
  List<CustomQuoteTokenModel>? get customQuoteToken {
    final value = _customQuoteToken;
    if (value == null) return null;
    if (_customQuoteToken is EqualUnmodifiableListView)
      return _customQuoteToken;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppConfigModel(orgId: $orgId, responseRandomKey: $responseRandomKey, domains: $domains, checkInviteCode: $checkInviteCode, checkCompliance: $checkCompliance, checkDepositKyt: $checkDepositKyt, checkWithdrawKyt: $checkWithdrawKyt, contractHelpUrl: $contractHelpUrl, registerOption: $registerOption, realtimeInterval: $realtimeInterval, announcementMoreUrl: $announcementMoreUrl, checksum: $checksum, updated: $updated, token: $token, symbol: $symbol, recommendSymbols: $recommendSymbols, customQuoteToken: $customQuoteToken)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppConfigModel'))
      ..add(DiagnosticsProperty('orgId', orgId))
      ..add(DiagnosticsProperty('responseRandomKey', responseRandomKey))
      ..add(DiagnosticsProperty('domains', domains))
      ..add(DiagnosticsProperty('checkInviteCode', checkInviteCode))
      ..add(DiagnosticsProperty('checkCompliance', checkCompliance))
      ..add(DiagnosticsProperty('checkDepositKyt', checkDepositKyt))
      ..add(DiagnosticsProperty('checkWithdrawKyt', checkWithdrawKyt))
      ..add(DiagnosticsProperty('contractHelpUrl', contractHelpUrl))
      ..add(DiagnosticsProperty('registerOption', registerOption))
      ..add(DiagnosticsProperty('realtimeInterval', realtimeInterval))
      ..add(DiagnosticsProperty('announcementMoreUrl', announcementMoreUrl))
      ..add(DiagnosticsProperty('checksum', checksum))
      ..add(DiagnosticsProperty('updated', updated))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('symbol', symbol))
      ..add(DiagnosticsProperty('recommendSymbols', recommendSymbols))
      ..add(DiagnosticsProperty('customQuoteToken', customQuoteToken));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConfigModelImpl &&
            (identical(other.orgId, orgId) || other.orgId == orgId) &&
            (identical(other.responseRandomKey, responseRandomKey) ||
                other.responseRandomKey == responseRandomKey) &&
            (identical(other.domains, domains) || other.domains == domains) &&
            (identical(other.checkInviteCode, checkInviteCode) ||
                other.checkInviteCode == checkInviteCode) &&
            (identical(other.checkCompliance, checkCompliance) ||
                other.checkCompliance == checkCompliance) &&
            (identical(other.checkDepositKyt, checkDepositKyt) ||
                other.checkDepositKyt == checkDepositKyt) &&
            (identical(other.checkWithdrawKyt, checkWithdrawKyt) ||
                other.checkWithdrawKyt == checkWithdrawKyt) &&
            (identical(other.contractHelpUrl, contractHelpUrl) ||
                other.contractHelpUrl == contractHelpUrl) &&
            (identical(other.registerOption, registerOption) ||
                other.registerOption == registerOption) &&
            (identical(other.realtimeInterval, realtimeInterval) ||
                other.realtimeInterval == realtimeInterval) &&
            (identical(other.announcementMoreUrl, announcementMoreUrl) ||
                other.announcementMoreUrl == announcementMoreUrl) &&
            (identical(other.checksum, checksum) ||
                other.checksum == checksum) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            const DeepCollectionEquality().equals(other._token, _token) &&
            const DeepCollectionEquality().equals(other._symbol, _symbol) &&
            const DeepCollectionEquality()
                .equals(other._recommendSymbols, _recommendSymbols) &&
            const DeepCollectionEquality()
                .equals(other._customQuoteToken, _customQuoteToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orgId,
      responseRandomKey,
      domains,
      checkInviteCode,
      checkCompliance,
      checkDepositKyt,
      checkWithdrawKyt,
      contractHelpUrl,
      registerOption,
      realtimeInterval,
      announcementMoreUrl,
      checksum,
      updated,
      const DeepCollectionEquality().hash(_token),
      const DeepCollectionEquality().hash(_symbol),
      const DeepCollectionEquality().hash(_recommendSymbols),
      const DeepCollectionEquality().hash(_customQuoteToken));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppConfigModelImplCopyWith<_$AppConfigModelImpl> get copyWith =>
      __$$AppConfigModelImplCopyWithImpl<_$AppConfigModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppConfigModelImplToJson(
      this,
    );
  }
}

abstract class _AppConfigModel extends AppConfigModel {
  const factory _AppConfigModel(
          {final String? orgId,
          final String? responseRandomKey,
          final String? domains,
          final bool? checkInviteCode,
          final bool? checkCompliance,
          final bool? checkDepositKyt,
          final bool? checkWithdrawKyt,
          final String? contractHelpUrl,
          final int? registerOption,
          final String? realtimeInterval,
          final String? announcementMoreUrl,
          final String? checksum,
          final bool? updated,
          final List<TokenModel>? token,
          final List<SymbolModel>? symbol,
          final List<SymbolModel>? recommendSymbols,
          final List<CustomQuoteTokenModel>? customQuoteToken}) =
      _$AppConfigModelImpl;
  const _AppConfigModel._() : super._();

  factory _AppConfigModel.fromJson(Map<String, dynamic> json) =
      _$AppConfigModelImpl.fromJson;

  @override
  String? get orgId;
  @override
  String? get responseRandomKey;
  @override
  String? get domains;
  @override
  bool? get checkInviteCode;
  @override
  bool? get checkCompliance;
  @override
  bool? get checkDepositKyt;
  @override
  bool? get checkWithdrawKyt;
  @override
  String? get contractHelpUrl;
  @override
  int? get registerOption;
  @override
  String? get realtimeInterval;
  @override
  String? get announcementMoreUrl;
  @override
  String? get checksum;
  @override
  bool? get updated;
  @override
  List<TokenModel>? get token;
  @override
  List<SymbolModel>? get symbol;
  @override
  List<SymbolModel>? get recommendSymbols;
  @override
  List<CustomQuoteTokenModel>? get customQuoteToken;
  @override
  @JsonKey(ignore: true)
  _$$AppConfigModelImplCopyWith<_$AppConfigModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
