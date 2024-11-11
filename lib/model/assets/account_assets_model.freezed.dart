// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_assets_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountAssetsModel _$AccountAssetsModelFromJson(Map<String, dynamic> json) {
  return _AccountAssetsModel.fromJson(json);
}

/// @nodoc
mixin _$AccountAssetsModel {
  String? get accountId => throw _privateConstructorUsedError;
  String? get accountName => throw _privateConstructorUsedError;
  int? get accountType => throw _privateConstructorUsedError;
  int? get accountIndex => throw _privateConstructorUsedError;
  bool? get canTrade => throw _privateConstructorUsedError;
  bool? get canDeposit => throw _privateConstructorUsedError;
  bool? get canWithdraw => throw _privateConstructorUsedError;
  List<UserAccountMoneyModel>? get balance =>
      throw _privateConstructorUsedError;
  String? get btcValue => throw _privateConstructorUsedError;
  String? get usdtValue => throw _privateConstructorUsedError;
  WalletType? get walletType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountAssetsModelCopyWith<AccountAssetsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountAssetsModelCopyWith<$Res> {
  factory $AccountAssetsModelCopyWith(
          AccountAssetsModel value, $Res Function(AccountAssetsModel) then) =
      _$AccountAssetsModelCopyWithImpl<$Res, AccountAssetsModel>;
  @useResult
  $Res call(
      {String? accountId,
      String? accountName,
      int? accountType,
      int? accountIndex,
      bool? canTrade,
      bool? canDeposit,
      bool? canWithdraw,
      List<UserAccountMoneyModel>? balance,
      String? btcValue,
      String? usdtValue,
      WalletType? walletType});
}

/// @nodoc
class _$AccountAssetsModelCopyWithImpl<$Res, $Val extends AccountAssetsModel>
    implements $AccountAssetsModelCopyWith<$Res> {
  _$AccountAssetsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = freezed,
    Object? accountName = freezed,
    Object? accountType = freezed,
    Object? accountIndex = freezed,
    Object? canTrade = freezed,
    Object? canDeposit = freezed,
    Object? canWithdraw = freezed,
    Object? balance = freezed,
    Object? btcValue = freezed,
    Object? usdtValue = freezed,
    Object? walletType = freezed,
  }) {
    return _then(_value.copyWith(
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String?,
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as int?,
      accountIndex: freezed == accountIndex
          ? _value.accountIndex
          : accountIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      canTrade: freezed == canTrade
          ? _value.canTrade
          : canTrade // ignore: cast_nullable_to_non_nullable
              as bool?,
      canDeposit: freezed == canDeposit
          ? _value.canDeposit
          : canDeposit // ignore: cast_nullable_to_non_nullable
              as bool?,
      canWithdraw: freezed == canWithdraw
          ? _value.canWithdraw
          : canWithdraw // ignore: cast_nullable_to_non_nullable
              as bool?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as List<UserAccountMoneyModel>?,
      btcValue: freezed == btcValue
          ? _value.btcValue
          : btcValue // ignore: cast_nullable_to_non_nullable
              as String?,
      usdtValue: freezed == usdtValue
          ? _value.usdtValue
          : usdtValue // ignore: cast_nullable_to_non_nullable
              as String?,
      walletType: freezed == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as WalletType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountAssetsModelImplCopyWith<$Res>
    implements $AccountAssetsModelCopyWith<$Res> {
  factory _$$AccountAssetsModelImplCopyWith(_$AccountAssetsModelImpl value,
          $Res Function(_$AccountAssetsModelImpl) then) =
      __$$AccountAssetsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? accountId,
      String? accountName,
      int? accountType,
      int? accountIndex,
      bool? canTrade,
      bool? canDeposit,
      bool? canWithdraw,
      List<UserAccountMoneyModel>? balance,
      String? btcValue,
      String? usdtValue,
      WalletType? walletType});
}

/// @nodoc
class __$$AccountAssetsModelImplCopyWithImpl<$Res>
    extends _$AccountAssetsModelCopyWithImpl<$Res, _$AccountAssetsModelImpl>
    implements _$$AccountAssetsModelImplCopyWith<$Res> {
  __$$AccountAssetsModelImplCopyWithImpl(_$AccountAssetsModelImpl _value,
      $Res Function(_$AccountAssetsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = freezed,
    Object? accountName = freezed,
    Object? accountType = freezed,
    Object? accountIndex = freezed,
    Object? canTrade = freezed,
    Object? canDeposit = freezed,
    Object? canWithdraw = freezed,
    Object? balance = freezed,
    Object? btcValue = freezed,
    Object? usdtValue = freezed,
    Object? walletType = freezed,
  }) {
    return _then(_$AccountAssetsModelImpl(
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String?,
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as int?,
      accountIndex: freezed == accountIndex
          ? _value.accountIndex
          : accountIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      canTrade: freezed == canTrade
          ? _value.canTrade
          : canTrade // ignore: cast_nullable_to_non_nullable
              as bool?,
      canDeposit: freezed == canDeposit
          ? _value.canDeposit
          : canDeposit // ignore: cast_nullable_to_non_nullable
              as bool?,
      canWithdraw: freezed == canWithdraw
          ? _value.canWithdraw
          : canWithdraw // ignore: cast_nullable_to_non_nullable
              as bool?,
      balance: freezed == balance
          ? _value._balance
          : balance // ignore: cast_nullable_to_non_nullable
              as List<UserAccountMoneyModel>?,
      btcValue: freezed == btcValue
          ? _value.btcValue
          : btcValue // ignore: cast_nullable_to_non_nullable
              as String?,
      usdtValue: freezed == usdtValue
          ? _value.usdtValue
          : usdtValue // ignore: cast_nullable_to_non_nullable
              as String?,
      walletType: freezed == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as WalletType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountAssetsModelImpl
    with DiagnosticableTreeMixin
    implements _AccountAssetsModel {
  const _$AccountAssetsModelImpl(
      {this.accountId,
      this.accountName,
      this.accountType,
      this.accountIndex,
      this.canTrade,
      this.canDeposit,
      this.canWithdraw,
      final List<UserAccountMoneyModel>? balance,
      this.btcValue,
      this.usdtValue,
      this.walletType})
      : _balance = balance;

  factory _$AccountAssetsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountAssetsModelImplFromJson(json);

  @override
  final String? accountId;
  @override
  final String? accountName;
  @override
  final int? accountType;
  @override
  final int? accountIndex;
  @override
  final bool? canTrade;
  @override
  final bool? canDeposit;
  @override
  final bool? canWithdraw;
  final List<UserAccountMoneyModel>? _balance;
  @override
  List<UserAccountMoneyModel>? get balance {
    final value = _balance;
    if (value == null) return null;
    if (_balance is EqualUnmodifiableListView) return _balance;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? btcValue;
  @override
  final String? usdtValue;
  @override
  final WalletType? walletType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountAssetsModel(accountId: $accountId, accountName: $accountName, accountType: $accountType, accountIndex: $accountIndex, canTrade: $canTrade, canDeposit: $canDeposit, canWithdraw: $canWithdraw, balance: $balance, btcValue: $btcValue, usdtValue: $usdtValue, walletType: $walletType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountAssetsModel'))
      ..add(DiagnosticsProperty('accountId', accountId))
      ..add(DiagnosticsProperty('accountName', accountName))
      ..add(DiagnosticsProperty('accountType', accountType))
      ..add(DiagnosticsProperty('accountIndex', accountIndex))
      ..add(DiagnosticsProperty('canTrade', canTrade))
      ..add(DiagnosticsProperty('canDeposit', canDeposit))
      ..add(DiagnosticsProperty('canWithdraw', canWithdraw))
      ..add(DiagnosticsProperty('balance', balance))
      ..add(DiagnosticsProperty('btcValue', btcValue))
      ..add(DiagnosticsProperty('usdtValue', usdtValue))
      ..add(DiagnosticsProperty('walletType', walletType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountAssetsModelImpl &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.accountIndex, accountIndex) ||
                other.accountIndex == accountIndex) &&
            (identical(other.canTrade, canTrade) ||
                other.canTrade == canTrade) &&
            (identical(other.canDeposit, canDeposit) ||
                other.canDeposit == canDeposit) &&
            (identical(other.canWithdraw, canWithdraw) ||
                other.canWithdraw == canWithdraw) &&
            const DeepCollectionEquality().equals(other._balance, _balance) &&
            (identical(other.btcValue, btcValue) ||
                other.btcValue == btcValue) &&
            (identical(other.usdtValue, usdtValue) ||
                other.usdtValue == usdtValue) &&
            (identical(other.walletType, walletType) ||
                other.walletType == walletType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      accountId,
      accountName,
      accountType,
      accountIndex,
      canTrade,
      canDeposit,
      canWithdraw,
      const DeepCollectionEquality().hash(_balance),
      btcValue,
      usdtValue,
      walletType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountAssetsModelImplCopyWith<_$AccountAssetsModelImpl> get copyWith =>
      __$$AccountAssetsModelImplCopyWithImpl<_$AccountAssetsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountAssetsModelImplToJson(
      this,
    );
  }
}

abstract class _AccountAssetsModel implements AccountAssetsModel {
  const factory _AccountAssetsModel(
      {final String? accountId,
      final String? accountName,
      final int? accountType,
      final int? accountIndex,
      final bool? canTrade,
      final bool? canDeposit,
      final bool? canWithdraw,
      final List<UserAccountMoneyModel>? balance,
      final String? btcValue,
      final String? usdtValue,
      final WalletType? walletType}) = _$AccountAssetsModelImpl;

  factory _AccountAssetsModel.fromJson(Map<String, dynamic> json) =
      _$AccountAssetsModelImpl.fromJson;

  @override
  String? get accountId;
  @override
  String? get accountName;
  @override
  int? get accountType;
  @override
  int? get accountIndex;
  @override
  bool? get canTrade;
  @override
  bool? get canDeposit;
  @override
  bool? get canWithdraw;
  @override
  List<UserAccountMoneyModel>? get balance;
  @override
  String? get btcValue;
  @override
  String? get usdtValue;
  @override
  WalletType? get walletType;
  @override
  @JsonKey(ignore: true)
  _$$AccountAssetsModelImplCopyWith<_$AccountAssetsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
