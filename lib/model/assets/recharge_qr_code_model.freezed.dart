// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recharge_qr_code_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RechargeQrCodeModel _$RechargeQrCodeModelFromJson(Map<String, dynamic> json) {
  return _RechargeQrCodeModel.fromJson(json);
}

/// @nodoc
mixin _$RechargeQrCodeModel {
  bool? get allowDeposit => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError; // 充币地址
  String? get addressExt => throw _privateConstructorUsedError;
  String? get qrcode => throw _privateConstructorUsedError; // 二维码base64编码
  String? get minQuantity => throw _privateConstructorUsedError; // 最小充币入账数量
  bool? get isEOS => throw _privateConstructorUsedError;
  int? get requiredConfirmNum => throw _privateConstructorUsedError; //需要的网络确认数
  int? get canWithdrawConfirmNum =>
      throw _privateConstructorUsedError; // 提笔网络确认数
  String? get tokenType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RechargeQrCodeModelCopyWith<RechargeQrCodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RechargeQrCodeModelCopyWith<$Res> {
  factory $RechargeQrCodeModelCopyWith(
          RechargeQrCodeModel value, $Res Function(RechargeQrCodeModel) then) =
      _$RechargeQrCodeModelCopyWithImpl<$Res, RechargeQrCodeModel>;
  @useResult
  $Res call(
      {bool? allowDeposit,
      String? address,
      String? addressExt,
      String? qrcode,
      String? minQuantity,
      bool? isEOS,
      int? requiredConfirmNum,
      int? canWithdrawConfirmNum,
      String? tokenType});
}

/// @nodoc
class _$RechargeQrCodeModelCopyWithImpl<$Res, $Val extends RechargeQrCodeModel>
    implements $RechargeQrCodeModelCopyWith<$Res> {
  _$RechargeQrCodeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allowDeposit = freezed,
    Object? address = freezed,
    Object? addressExt = freezed,
    Object? qrcode = freezed,
    Object? minQuantity = freezed,
    Object? isEOS = freezed,
    Object? requiredConfirmNum = freezed,
    Object? canWithdrawConfirmNum = freezed,
    Object? tokenType = freezed,
  }) {
    return _then(_value.copyWith(
      allowDeposit: freezed == allowDeposit
          ? _value.allowDeposit
          : allowDeposit // ignore: cast_nullable_to_non_nullable
              as bool?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      addressExt: freezed == addressExt
          ? _value.addressExt
          : addressExt // ignore: cast_nullable_to_non_nullable
              as String?,
      qrcode: freezed == qrcode
          ? _value.qrcode
          : qrcode // ignore: cast_nullable_to_non_nullable
              as String?,
      minQuantity: freezed == minQuantity
          ? _value.minQuantity
          : minQuantity // ignore: cast_nullable_to_non_nullable
              as String?,
      isEOS: freezed == isEOS
          ? _value.isEOS
          : isEOS // ignore: cast_nullable_to_non_nullable
              as bool?,
      requiredConfirmNum: freezed == requiredConfirmNum
          ? _value.requiredConfirmNum
          : requiredConfirmNum // ignore: cast_nullable_to_non_nullable
              as int?,
      canWithdrawConfirmNum: freezed == canWithdrawConfirmNum
          ? _value.canWithdrawConfirmNum
          : canWithdrawConfirmNum // ignore: cast_nullable_to_non_nullable
              as int?,
      tokenType: freezed == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RechargeQrCodeModelImplCopyWith<$Res>
    implements $RechargeQrCodeModelCopyWith<$Res> {
  factory _$$RechargeQrCodeModelImplCopyWith(_$RechargeQrCodeModelImpl value,
          $Res Function(_$RechargeQrCodeModelImpl) then) =
      __$$RechargeQrCodeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? allowDeposit,
      String? address,
      String? addressExt,
      String? qrcode,
      String? minQuantity,
      bool? isEOS,
      int? requiredConfirmNum,
      int? canWithdrawConfirmNum,
      String? tokenType});
}

/// @nodoc
class __$$RechargeQrCodeModelImplCopyWithImpl<$Res>
    extends _$RechargeQrCodeModelCopyWithImpl<$Res, _$RechargeQrCodeModelImpl>
    implements _$$RechargeQrCodeModelImplCopyWith<$Res> {
  __$$RechargeQrCodeModelImplCopyWithImpl(_$RechargeQrCodeModelImpl _value,
      $Res Function(_$RechargeQrCodeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allowDeposit = freezed,
    Object? address = freezed,
    Object? addressExt = freezed,
    Object? qrcode = freezed,
    Object? minQuantity = freezed,
    Object? isEOS = freezed,
    Object? requiredConfirmNum = freezed,
    Object? canWithdrawConfirmNum = freezed,
    Object? tokenType = freezed,
  }) {
    return _then(_$RechargeQrCodeModelImpl(
      allowDeposit: freezed == allowDeposit
          ? _value.allowDeposit
          : allowDeposit // ignore: cast_nullable_to_non_nullable
              as bool?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      addressExt: freezed == addressExt
          ? _value.addressExt
          : addressExt // ignore: cast_nullable_to_non_nullable
              as String?,
      qrcode: freezed == qrcode
          ? _value.qrcode
          : qrcode // ignore: cast_nullable_to_non_nullable
              as String?,
      minQuantity: freezed == minQuantity
          ? _value.minQuantity
          : minQuantity // ignore: cast_nullable_to_non_nullable
              as String?,
      isEOS: freezed == isEOS
          ? _value.isEOS
          : isEOS // ignore: cast_nullable_to_non_nullable
              as bool?,
      requiredConfirmNum: freezed == requiredConfirmNum
          ? _value.requiredConfirmNum
          : requiredConfirmNum // ignore: cast_nullable_to_non_nullable
              as int?,
      canWithdrawConfirmNum: freezed == canWithdrawConfirmNum
          ? _value.canWithdrawConfirmNum
          : canWithdrawConfirmNum // ignore: cast_nullable_to_non_nullable
              as int?,
      tokenType: freezed == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RechargeQrCodeModelImpl
    with DiagnosticableTreeMixin
    implements _RechargeQrCodeModel {
  const _$RechargeQrCodeModelImpl(
      {this.allowDeposit,
      this.address,
      this.addressExt,
      this.qrcode,
      this.minQuantity,
      this.isEOS,
      this.requiredConfirmNum,
      this.canWithdrawConfirmNum,
      this.tokenType});

  factory _$RechargeQrCodeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RechargeQrCodeModelImplFromJson(json);

  @override
  final bool? allowDeposit;
  @override
  final String? address;
// 充币地址
  @override
  final String? addressExt;
  @override
  final String? qrcode;
// 二维码base64编码
  @override
  final String? minQuantity;
// 最小充币入账数量
  @override
  final bool? isEOS;
  @override
  final int? requiredConfirmNum;
//需要的网络确认数
  @override
  final int? canWithdrawConfirmNum;
// 提笔网络确认数
  @override
  final String? tokenType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RechargeQrCodeModel(allowDeposit: $allowDeposit, address: $address, addressExt: $addressExt, qrcode: $qrcode, minQuantity: $minQuantity, isEOS: $isEOS, requiredConfirmNum: $requiredConfirmNum, canWithdrawConfirmNum: $canWithdrawConfirmNum, tokenType: $tokenType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RechargeQrCodeModel'))
      ..add(DiagnosticsProperty('allowDeposit', allowDeposit))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('addressExt', addressExt))
      ..add(DiagnosticsProperty('qrcode', qrcode))
      ..add(DiagnosticsProperty('minQuantity', minQuantity))
      ..add(DiagnosticsProperty('isEOS', isEOS))
      ..add(DiagnosticsProperty('requiredConfirmNum', requiredConfirmNum))
      ..add(DiagnosticsProperty('canWithdrawConfirmNum', canWithdrawConfirmNum))
      ..add(DiagnosticsProperty('tokenType', tokenType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RechargeQrCodeModelImpl &&
            (identical(other.allowDeposit, allowDeposit) ||
                other.allowDeposit == allowDeposit) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.addressExt, addressExt) ||
                other.addressExt == addressExt) &&
            (identical(other.qrcode, qrcode) || other.qrcode == qrcode) &&
            (identical(other.minQuantity, minQuantity) ||
                other.minQuantity == minQuantity) &&
            (identical(other.isEOS, isEOS) || other.isEOS == isEOS) &&
            (identical(other.requiredConfirmNum, requiredConfirmNum) ||
                other.requiredConfirmNum == requiredConfirmNum) &&
            (identical(other.canWithdrawConfirmNum, canWithdrawConfirmNum) ||
                other.canWithdrawConfirmNum == canWithdrawConfirmNum) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      allowDeposit,
      address,
      addressExt,
      qrcode,
      minQuantity,
      isEOS,
      requiredConfirmNum,
      canWithdrawConfirmNum,
      tokenType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RechargeQrCodeModelImplCopyWith<_$RechargeQrCodeModelImpl> get copyWith =>
      __$$RechargeQrCodeModelImplCopyWithImpl<_$RechargeQrCodeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RechargeQrCodeModelImplToJson(
      this,
    );
  }
}

abstract class _RechargeQrCodeModel implements RechargeQrCodeModel {
  const factory _RechargeQrCodeModel(
      {final bool? allowDeposit,
      final String? address,
      final String? addressExt,
      final String? qrcode,
      final String? minQuantity,
      final bool? isEOS,
      final int? requiredConfirmNum,
      final int? canWithdrawConfirmNum,
      final String? tokenType}) = _$RechargeQrCodeModelImpl;

  factory _RechargeQrCodeModel.fromJson(Map<String, dynamic> json) =
      _$RechargeQrCodeModelImpl.fromJson;

  @override
  bool? get allowDeposit;
  @override
  String? get address;
  @override // 充币地址
  String? get addressExt;
  @override
  String? get qrcode;
  @override // 二维码base64编码
  String? get minQuantity;
  @override // 最小充币入账数量
  bool? get isEOS;
  @override
  int? get requiredConfirmNum;
  @override //需要的网络确认数
  int? get canWithdrawConfirmNum;
  @override // 提笔网络确认数
  String? get tokenType;
  @override
  @JsonKey(ignore: true)
  _$$RechargeQrCodeModelImplCopyWith<_$RechargeQrCodeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
