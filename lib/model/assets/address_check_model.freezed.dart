// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_check_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddressCheckModel _$AddressCheckModelFromJson(Map<String, dynamic> json) {
  return _AddressCheckModel.fromJson(json);
}

/// @nodoc
mixin _$AddressCheckModel {
  String? get address => throw _privateConstructorUsedError;
  String? get addressExt => throw _privateConstructorUsedError;
  bool? get addressIsUserId => throw _privateConstructorUsedError;
  bool? get isIllegal => throw _privateConstructorUsedError;
  bool? get isInnerAddress => throw _privateConstructorUsedError;
  bool? get isInBlackList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressCheckModelCopyWith<AddressCheckModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCheckModelCopyWith<$Res> {
  factory $AddressCheckModelCopyWith(
          AddressCheckModel value, $Res Function(AddressCheckModel) then) =
      _$AddressCheckModelCopyWithImpl<$Res, AddressCheckModel>;
  @useResult
  $Res call(
      {String? address,
      String? addressExt,
      bool? addressIsUserId,
      bool? isIllegal,
      bool? isInnerAddress,
      bool? isInBlackList});
}

/// @nodoc
class _$AddressCheckModelCopyWithImpl<$Res, $Val extends AddressCheckModel>
    implements $AddressCheckModelCopyWith<$Res> {
  _$AddressCheckModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? addressExt = freezed,
    Object? addressIsUserId = freezed,
    Object? isIllegal = freezed,
    Object? isInnerAddress = freezed,
    Object? isInBlackList = freezed,
  }) {
    return _then(_value.copyWith(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      addressExt: freezed == addressExt
          ? _value.addressExt
          : addressExt // ignore: cast_nullable_to_non_nullable
              as String?,
      addressIsUserId: freezed == addressIsUserId
          ? _value.addressIsUserId
          : addressIsUserId // ignore: cast_nullable_to_non_nullable
              as bool?,
      isIllegal: freezed == isIllegal
          ? _value.isIllegal
          : isIllegal // ignore: cast_nullable_to_non_nullable
              as bool?,
      isInnerAddress: freezed == isInnerAddress
          ? _value.isInnerAddress
          : isInnerAddress // ignore: cast_nullable_to_non_nullable
              as bool?,
      isInBlackList: freezed == isInBlackList
          ? _value.isInBlackList
          : isInBlackList // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressCheckModelImplCopyWith<$Res>
    implements $AddressCheckModelCopyWith<$Res> {
  factory _$$AddressCheckModelImplCopyWith(_$AddressCheckModelImpl value,
          $Res Function(_$AddressCheckModelImpl) then) =
      __$$AddressCheckModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? address,
      String? addressExt,
      bool? addressIsUserId,
      bool? isIllegal,
      bool? isInnerAddress,
      bool? isInBlackList});
}

/// @nodoc
class __$$AddressCheckModelImplCopyWithImpl<$Res>
    extends _$AddressCheckModelCopyWithImpl<$Res, _$AddressCheckModelImpl>
    implements _$$AddressCheckModelImplCopyWith<$Res> {
  __$$AddressCheckModelImplCopyWithImpl(_$AddressCheckModelImpl _value,
      $Res Function(_$AddressCheckModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? addressExt = freezed,
    Object? addressIsUserId = freezed,
    Object? isIllegal = freezed,
    Object? isInnerAddress = freezed,
    Object? isInBlackList = freezed,
  }) {
    return _then(_$AddressCheckModelImpl(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      addressExt: freezed == addressExt
          ? _value.addressExt
          : addressExt // ignore: cast_nullable_to_non_nullable
              as String?,
      addressIsUserId: freezed == addressIsUserId
          ? _value.addressIsUserId
          : addressIsUserId // ignore: cast_nullable_to_non_nullable
              as bool?,
      isIllegal: freezed == isIllegal
          ? _value.isIllegal
          : isIllegal // ignore: cast_nullable_to_non_nullable
              as bool?,
      isInnerAddress: freezed == isInnerAddress
          ? _value.isInnerAddress
          : isInnerAddress // ignore: cast_nullable_to_non_nullable
              as bool?,
      isInBlackList: freezed == isInBlackList
          ? _value.isInBlackList
          : isInBlackList // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressCheckModelImpl implements _AddressCheckModel {
  const _$AddressCheckModelImpl(
      {this.address,
      this.addressExt,
      this.addressIsUserId,
      this.isIllegal,
      this.isInnerAddress,
      this.isInBlackList});

  factory _$AddressCheckModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressCheckModelImplFromJson(json);

  @override
  final String? address;
  @override
  final String? addressExt;
  @override
  final bool? addressIsUserId;
  @override
  final bool? isIllegal;
  @override
  final bool? isInnerAddress;
  @override
  final bool? isInBlackList;

  @override
  String toString() {
    return 'AddressCheckModel(address: $address, addressExt: $addressExt, addressIsUserId: $addressIsUserId, isIllegal: $isIllegal, isInnerAddress: $isInnerAddress, isInBlackList: $isInBlackList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressCheckModelImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.addressExt, addressExt) ||
                other.addressExt == addressExt) &&
            (identical(other.addressIsUserId, addressIsUserId) ||
                other.addressIsUserId == addressIsUserId) &&
            (identical(other.isIllegal, isIllegal) ||
                other.isIllegal == isIllegal) &&
            (identical(other.isInnerAddress, isInnerAddress) ||
                other.isInnerAddress == isInnerAddress) &&
            (identical(other.isInBlackList, isInBlackList) ||
                other.isInBlackList == isInBlackList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, address, addressExt,
      addressIsUserId, isIllegal, isInnerAddress, isInBlackList);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressCheckModelImplCopyWith<_$AddressCheckModelImpl> get copyWith =>
      __$$AddressCheckModelImplCopyWithImpl<_$AddressCheckModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressCheckModelImplToJson(
      this,
    );
  }
}

abstract class _AddressCheckModel implements AddressCheckModel {
  const factory _AddressCheckModel(
      {final String? address,
      final String? addressExt,
      final bool? addressIsUserId,
      final bool? isIllegal,
      final bool? isInnerAddress,
      final bool? isInBlackList}) = _$AddressCheckModelImpl;

  factory _AddressCheckModel.fromJson(Map<String, dynamic> json) =
      _$AddressCheckModelImpl.fromJson;

  @override
  String? get address;
  @override
  String? get addressExt;
  @override
  bool? get addressIsUserId;
  @override
  bool? get isIllegal;
  @override
  bool? get isInnerAddress;
  @override
  bool? get isInBlackList;
  @override
  @JsonKey(ignore: true)
  _$$AddressCheckModelImplCopyWith<_$AddressCheckModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WithdrawalCreateBody _$WithdrawalCreateBodyFromJson(Map<String, dynamic> json) {
  return _WithdrawalCreateBody.fromJson(json);
}

/// @nodoc
mixin _$WithdrawalCreateBody {
  @JsonKey(name: "account_id")
  String get accountId => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: "address_id")
  String? get addressId => throw _privateConstructorUsedError;
  @JsonKey(name: "chain_type")
  String get chainType => throw _privateConstructorUsedError;
  @JsonKey(name: "client_order_id")
  String get clientOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: "convert_rate")
  num get convertRate => throw _privateConstructorUsedError;
  @JsonKey(name: "miner_fee")
  num get minerFee => throw _privateConstructorUsedError; // 数量
  num get quantity => throw _privateConstructorUsedError; // String? remarks,
  @JsonKey(name: "token_id")
  String get tokenId => throw _privateConstructorUsedError;
  @JsonKey(name: "trade_password")
  String get tradePassword => throw _privateConstructorUsedError; // 带入二次验证
  @JsonKey(name: "verify_code")
  String? get verifyCode => throw _privateConstructorUsedError;
  @JsonKey(name: "order_id")
  String? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: "auth_type")
  int? get authType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WithdrawalCreateBodyCopyWith<WithdrawalCreateBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WithdrawalCreateBodyCopyWith<$Res> {
  factory $WithdrawalCreateBodyCopyWith(WithdrawalCreateBody value,
          $Res Function(WithdrawalCreateBody) then) =
      _$WithdrawalCreateBodyCopyWithImpl<$Res, WithdrawalCreateBody>;
  @useResult
  $Res call(
      {@JsonKey(name: "account_id") String accountId,
      String address,
      @JsonKey(name: "address_id") String? addressId,
      @JsonKey(name: "chain_type") String chainType,
      @JsonKey(name: "client_order_id") String clientOrderId,
      @JsonKey(name: "convert_rate") num convertRate,
      @JsonKey(name: "miner_fee") num minerFee,
      num quantity,
      @JsonKey(name: "token_id") String tokenId,
      @JsonKey(name: "trade_password") String tradePassword,
      @JsonKey(name: "verify_code") String? verifyCode,
      @JsonKey(name: "order_id") String? orderId,
      @JsonKey(name: "auth_type") int? authType});
}

/// @nodoc
class _$WithdrawalCreateBodyCopyWithImpl<$Res,
        $Val extends WithdrawalCreateBody>
    implements $WithdrawalCreateBodyCopyWith<$Res> {
  _$WithdrawalCreateBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? address = null,
    Object? addressId = freezed,
    Object? chainType = null,
    Object? clientOrderId = null,
    Object? convertRate = null,
    Object? minerFee = null,
    Object? quantity = null,
    Object? tokenId = null,
    Object? tradePassword = null,
    Object? verifyCode = freezed,
    Object? orderId = freezed,
    Object? authType = freezed,
  }) {
    return _then(_value.copyWith(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      addressId: freezed == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as String?,
      chainType: null == chainType
          ? _value.chainType
          : chainType // ignore: cast_nullable_to_non_nullable
              as String,
      clientOrderId: null == clientOrderId
          ? _value.clientOrderId
          : clientOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      convertRate: null == convertRate
          ? _value.convertRate
          : convertRate // ignore: cast_nullable_to_non_nullable
              as num,
      minerFee: null == minerFee
          ? _value.minerFee
          : minerFee // ignore: cast_nullable_to_non_nullable
              as num,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as num,
      tokenId: null == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String,
      tradePassword: null == tradePassword
          ? _value.tradePassword
          : tradePassword // ignore: cast_nullable_to_non_nullable
              as String,
      verifyCode: freezed == verifyCode
          ? _value.verifyCode
          : verifyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      authType: freezed == authType
          ? _value.authType
          : authType // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WithdrawalCreateBodyImplCopyWith<$Res>
    implements $WithdrawalCreateBodyCopyWith<$Res> {
  factory _$$WithdrawalCreateBodyImplCopyWith(_$WithdrawalCreateBodyImpl value,
          $Res Function(_$WithdrawalCreateBodyImpl) then) =
      __$$WithdrawalCreateBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "account_id") String accountId,
      String address,
      @JsonKey(name: "address_id") String? addressId,
      @JsonKey(name: "chain_type") String chainType,
      @JsonKey(name: "client_order_id") String clientOrderId,
      @JsonKey(name: "convert_rate") num convertRate,
      @JsonKey(name: "miner_fee") num minerFee,
      num quantity,
      @JsonKey(name: "token_id") String tokenId,
      @JsonKey(name: "trade_password") String tradePassword,
      @JsonKey(name: "verify_code") String? verifyCode,
      @JsonKey(name: "order_id") String? orderId,
      @JsonKey(name: "auth_type") int? authType});
}

/// @nodoc
class __$$WithdrawalCreateBodyImplCopyWithImpl<$Res>
    extends _$WithdrawalCreateBodyCopyWithImpl<$Res, _$WithdrawalCreateBodyImpl>
    implements _$$WithdrawalCreateBodyImplCopyWith<$Res> {
  __$$WithdrawalCreateBodyImplCopyWithImpl(_$WithdrawalCreateBodyImpl _value,
      $Res Function(_$WithdrawalCreateBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? address = null,
    Object? addressId = freezed,
    Object? chainType = null,
    Object? clientOrderId = null,
    Object? convertRate = null,
    Object? minerFee = null,
    Object? quantity = null,
    Object? tokenId = null,
    Object? tradePassword = null,
    Object? verifyCode = freezed,
    Object? orderId = freezed,
    Object? authType = freezed,
  }) {
    return _then(_$WithdrawalCreateBodyImpl(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      addressId: freezed == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as String?,
      chainType: null == chainType
          ? _value.chainType
          : chainType // ignore: cast_nullable_to_non_nullable
              as String,
      clientOrderId: null == clientOrderId
          ? _value.clientOrderId
          : clientOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      convertRate: null == convertRate
          ? _value.convertRate
          : convertRate // ignore: cast_nullable_to_non_nullable
              as num,
      minerFee: null == minerFee
          ? _value.minerFee
          : minerFee // ignore: cast_nullable_to_non_nullable
              as num,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as num,
      tokenId: null == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String,
      tradePassword: null == tradePassword
          ? _value.tradePassword
          : tradePassword // ignore: cast_nullable_to_non_nullable
              as String,
      verifyCode: freezed == verifyCode
          ? _value.verifyCode
          : verifyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      authType: freezed == authType
          ? _value.authType
          : authType // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WithdrawalCreateBodyImpl implements _WithdrawalCreateBody {
  const _$WithdrawalCreateBodyImpl(
      {@JsonKey(name: "account_id") required this.accountId,
      required this.address,
      @JsonKey(name: "address_id") this.addressId,
      @JsonKey(name: "chain_type") required this.chainType,
      @JsonKey(name: "client_order_id") required this.clientOrderId,
      @JsonKey(name: "convert_rate") required this.convertRate,
      @JsonKey(name: "miner_fee") required this.minerFee,
      required this.quantity,
      @JsonKey(name: "token_id") required this.tokenId,
      @JsonKey(name: "trade_password") required this.tradePassword,
      @JsonKey(name: "verify_code") this.verifyCode,
      @JsonKey(name: "order_id") this.orderId,
      @JsonKey(name: "auth_type") this.authType});

  factory _$WithdrawalCreateBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$WithdrawalCreateBodyImplFromJson(json);

  @override
  @JsonKey(name: "account_id")
  final String accountId;
  @override
  final String address;
  @override
  @JsonKey(name: "address_id")
  final String? addressId;
  @override
  @JsonKey(name: "chain_type")
  final String chainType;
  @override
  @JsonKey(name: "client_order_id")
  final String clientOrderId;
  @override
  @JsonKey(name: "convert_rate")
  final num convertRate;
  @override
  @JsonKey(name: "miner_fee")
  final num minerFee;
// 数量
  @override
  final num quantity;
// String? remarks,
  @override
  @JsonKey(name: "token_id")
  final String tokenId;
  @override
  @JsonKey(name: "trade_password")
  final String tradePassword;
// 带入二次验证
  @override
  @JsonKey(name: "verify_code")
  final String? verifyCode;
  @override
  @JsonKey(name: "order_id")
  final String? orderId;
  @override
  @JsonKey(name: "auth_type")
  final int? authType;

  @override
  String toString() {
    return 'WithdrawalCreateBody(accountId: $accountId, address: $address, addressId: $addressId, chainType: $chainType, clientOrderId: $clientOrderId, convertRate: $convertRate, minerFee: $minerFee, quantity: $quantity, tokenId: $tokenId, tradePassword: $tradePassword, verifyCode: $verifyCode, orderId: $orderId, authType: $authType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WithdrawalCreateBodyImpl &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId) &&
            (identical(other.chainType, chainType) ||
                other.chainType == chainType) &&
            (identical(other.clientOrderId, clientOrderId) ||
                other.clientOrderId == clientOrderId) &&
            (identical(other.convertRate, convertRate) ||
                other.convertRate == convertRate) &&
            (identical(other.minerFee, minerFee) ||
                other.minerFee == minerFee) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId) &&
            (identical(other.tradePassword, tradePassword) ||
                other.tradePassword == tradePassword) &&
            (identical(other.verifyCode, verifyCode) ||
                other.verifyCode == verifyCode) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.authType, authType) ||
                other.authType == authType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      accountId,
      address,
      addressId,
      chainType,
      clientOrderId,
      convertRate,
      minerFee,
      quantity,
      tokenId,
      tradePassword,
      verifyCode,
      orderId,
      authType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WithdrawalCreateBodyImplCopyWith<_$WithdrawalCreateBodyImpl>
      get copyWith =>
          __$$WithdrawalCreateBodyImplCopyWithImpl<_$WithdrawalCreateBodyImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WithdrawalCreateBodyImplToJson(
      this,
    );
  }
}

abstract class _WithdrawalCreateBody implements WithdrawalCreateBody {
  const factory _WithdrawalCreateBody(
          {@JsonKey(name: "account_id") required final String accountId,
          required final String address,
          @JsonKey(name: "address_id") final String? addressId,
          @JsonKey(name: "chain_type") required final String chainType,
          @JsonKey(name: "client_order_id") required final String clientOrderId,
          @JsonKey(name: "convert_rate") required final num convertRate,
          @JsonKey(name: "miner_fee") required final num minerFee,
          required final num quantity,
          @JsonKey(name: "token_id") required final String tokenId,
          @JsonKey(name: "trade_password") required final String tradePassword,
          @JsonKey(name: "verify_code") final String? verifyCode,
          @JsonKey(name: "order_id") final String? orderId,
          @JsonKey(name: "auth_type") final int? authType}) =
      _$WithdrawalCreateBodyImpl;

  factory _WithdrawalCreateBody.fromJson(Map<String, dynamic> json) =
      _$WithdrawalCreateBodyImpl.fromJson;

  @override
  @JsonKey(name: "account_id")
  String get accountId;
  @override
  String get address;
  @override
  @JsonKey(name: "address_id")
  String? get addressId;
  @override
  @JsonKey(name: "chain_type")
  String get chainType;
  @override
  @JsonKey(name: "client_order_id")
  String get clientOrderId;
  @override
  @JsonKey(name: "convert_rate")
  num get convertRate;
  @override
  @JsonKey(name: "miner_fee")
  num get minerFee;
  @override // 数量
  num get quantity;
  @override // String? remarks,
  @JsonKey(name: "token_id")
  String get tokenId;
  @override
  @JsonKey(name: "trade_password")
  String get tradePassword;
  @override // 带入二次验证
  @JsonKey(name: "verify_code")
  String? get verifyCode;
  @override
  @JsonKey(name: "order_id")
  String? get orderId;
  @override
  @JsonKey(name: "auth_type")
  int? get authType;
  @override
  @JsonKey(ignore: true)
  _$$WithdrawalCreateBodyImplCopyWith<_$WithdrawalCreateBodyImpl>
      get copyWith => throw _privateConstructorUsedError;
}
