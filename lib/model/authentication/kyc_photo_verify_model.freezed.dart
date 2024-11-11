// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc_photo_verify_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KycPhotoVerifyModel _$KycPhotoVerifyModelFromJson(Map<String, dynamic> json) {
  return _KycPhotoVerifyModel.fromJson(json);
}

/// @nodoc
mixin _$KycPhotoVerifyModel {
  int? get kycLevel => throw _privateConstructorUsedError; // kyc认证级别
  bool? get faceCompare =>
      throw _privateConstructorUsedError; // 是否需要人脸活体检测 true=需要 false=不需要
  SdkPrepareInfoModel? get sdkPrepareInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KycPhotoVerifyModelCopyWith<KycPhotoVerifyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KycPhotoVerifyModelCopyWith<$Res> {
  factory $KycPhotoVerifyModelCopyWith(
          KycPhotoVerifyModel value, $Res Function(KycPhotoVerifyModel) then) =
      _$KycPhotoVerifyModelCopyWithImpl<$Res, KycPhotoVerifyModel>;
  @useResult
  $Res call(
      {int? kycLevel, bool? faceCompare, SdkPrepareInfoModel? sdkPrepareInfo});

  $SdkPrepareInfoModelCopyWith<$Res>? get sdkPrepareInfo;
}

/// @nodoc
class _$KycPhotoVerifyModelCopyWithImpl<$Res, $Val extends KycPhotoVerifyModel>
    implements $KycPhotoVerifyModelCopyWith<$Res> {
  _$KycPhotoVerifyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kycLevel = freezed,
    Object? faceCompare = freezed,
    Object? sdkPrepareInfo = freezed,
  }) {
    return _then(_value.copyWith(
      kycLevel: freezed == kycLevel
          ? _value.kycLevel
          : kycLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      faceCompare: freezed == faceCompare
          ? _value.faceCompare
          : faceCompare // ignore: cast_nullable_to_non_nullable
              as bool?,
      sdkPrepareInfo: freezed == sdkPrepareInfo
          ? _value.sdkPrepareInfo
          : sdkPrepareInfo // ignore: cast_nullable_to_non_nullable
              as SdkPrepareInfoModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SdkPrepareInfoModelCopyWith<$Res>? get sdkPrepareInfo {
    if (_value.sdkPrepareInfo == null) {
      return null;
    }

    return $SdkPrepareInfoModelCopyWith<$Res>(_value.sdkPrepareInfo!, (value) {
      return _then(_value.copyWith(sdkPrepareInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$KycPhotoVerifyModelImplCopyWith<$Res>
    implements $KycPhotoVerifyModelCopyWith<$Res> {
  factory _$$KycPhotoVerifyModelImplCopyWith(_$KycPhotoVerifyModelImpl value,
          $Res Function(_$KycPhotoVerifyModelImpl) then) =
      __$$KycPhotoVerifyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? kycLevel, bool? faceCompare, SdkPrepareInfoModel? sdkPrepareInfo});

  @override
  $SdkPrepareInfoModelCopyWith<$Res>? get sdkPrepareInfo;
}

/// @nodoc
class __$$KycPhotoVerifyModelImplCopyWithImpl<$Res>
    extends _$KycPhotoVerifyModelCopyWithImpl<$Res, _$KycPhotoVerifyModelImpl>
    implements _$$KycPhotoVerifyModelImplCopyWith<$Res> {
  __$$KycPhotoVerifyModelImplCopyWithImpl(_$KycPhotoVerifyModelImpl _value,
      $Res Function(_$KycPhotoVerifyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kycLevel = freezed,
    Object? faceCompare = freezed,
    Object? sdkPrepareInfo = freezed,
  }) {
    return _then(_$KycPhotoVerifyModelImpl(
      kycLevel: freezed == kycLevel
          ? _value.kycLevel
          : kycLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      faceCompare: freezed == faceCompare
          ? _value.faceCompare
          : faceCompare // ignore: cast_nullable_to_non_nullable
              as bool?,
      sdkPrepareInfo: freezed == sdkPrepareInfo
          ? _value.sdkPrepareInfo
          : sdkPrepareInfo // ignore: cast_nullable_to_non_nullable
              as SdkPrepareInfoModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KycPhotoVerifyModelImpl implements _KycPhotoVerifyModel {
  const _$KycPhotoVerifyModelImpl(
      {this.kycLevel, this.faceCompare, this.sdkPrepareInfo});

  factory _$KycPhotoVerifyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KycPhotoVerifyModelImplFromJson(json);

  @override
  final int? kycLevel;
// kyc认证级别
  @override
  final bool? faceCompare;
// 是否需要人脸活体检测 true=需要 false=不需要
  @override
  final SdkPrepareInfoModel? sdkPrepareInfo;

  @override
  String toString() {
    return 'KycPhotoVerifyModel(kycLevel: $kycLevel, faceCompare: $faceCompare, sdkPrepareInfo: $sdkPrepareInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KycPhotoVerifyModelImpl &&
            (identical(other.kycLevel, kycLevel) ||
                other.kycLevel == kycLevel) &&
            (identical(other.faceCompare, faceCompare) ||
                other.faceCompare == faceCompare) &&
            (identical(other.sdkPrepareInfo, sdkPrepareInfo) ||
                other.sdkPrepareInfo == sdkPrepareInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, kycLevel, faceCompare, sdkPrepareInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KycPhotoVerifyModelImplCopyWith<_$KycPhotoVerifyModelImpl> get copyWith =>
      __$$KycPhotoVerifyModelImplCopyWithImpl<_$KycPhotoVerifyModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KycPhotoVerifyModelImplToJson(
      this,
    );
  }
}

abstract class _KycPhotoVerifyModel implements KycPhotoVerifyModel {
  const factory _KycPhotoVerifyModel(
      {final int? kycLevel,
      final bool? faceCompare,
      final SdkPrepareInfoModel? sdkPrepareInfo}) = _$KycPhotoVerifyModelImpl;

  factory _KycPhotoVerifyModel.fromJson(Map<String, dynamic> json) =
      _$KycPhotoVerifyModelImpl.fromJson;

  @override
  int? get kycLevel;
  @override // kyc认证级别
  bool? get faceCompare;
  @override // 是否需要人脸活体检测 true=需要 false=不需要
  SdkPrepareInfoModel? get sdkPrepareInfo;
  @override
  @JsonKey(ignore: true)
  _$$KycPhotoVerifyModelImplCopyWith<_$KycPhotoVerifyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SdkPrepareInfoModel _$SdkPrepareInfoModelFromJson(Map<String, dynamic> json) {
  return _SdkPrepareInfoModel.fromJson(json);
}

/// @nodoc
mixin _$SdkPrepareInfoModel {
  String? get appId => throw _privateConstructorUsedError; // appid
  String? get version => throw _privateConstructorUsedError; // 版本号
  String? get nonce => throw _privateConstructorUsedError; // 32位的随机字符串 nonceStr
  String? get sign => throw _privateConstructorUsedError; // 签名
  String? get orderNo => throw _privateConstructorUsedError; // 第三方KYC认证订单号
  String? get faceId => throw _privateConstructorUsedError; // 第三方KYC认证faceId
  String? get userId => throw _privateConstructorUsedError; // 唯一用户标识
  String? get license => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SdkPrepareInfoModelCopyWith<SdkPrepareInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SdkPrepareInfoModelCopyWith<$Res> {
  factory $SdkPrepareInfoModelCopyWith(
          SdkPrepareInfoModel value, $Res Function(SdkPrepareInfoModel) then) =
      _$SdkPrepareInfoModelCopyWithImpl<$Res, SdkPrepareInfoModel>;
  @useResult
  $Res call(
      {String? appId,
      String? version,
      String? nonce,
      String? sign,
      String? orderNo,
      String? faceId,
      String? userId,
      String? license});
}

/// @nodoc
class _$SdkPrepareInfoModelCopyWithImpl<$Res, $Val extends SdkPrepareInfoModel>
    implements $SdkPrepareInfoModelCopyWith<$Res> {
  _$SdkPrepareInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appId = freezed,
    Object? version = freezed,
    Object? nonce = freezed,
    Object? sign = freezed,
    Object? orderNo = freezed,
    Object? faceId = freezed,
    Object? userId = freezed,
    Object? license = freezed,
  }) {
    return _then(_value.copyWith(
      appId: freezed == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      nonce: freezed == nonce
          ? _value.nonce
          : nonce // ignore: cast_nullable_to_non_nullable
              as String?,
      sign: freezed == sign
          ? _value.sign
          : sign // ignore: cast_nullable_to_non_nullable
              as String?,
      orderNo: freezed == orderNo
          ? _value.orderNo
          : orderNo // ignore: cast_nullable_to_non_nullable
              as String?,
      faceId: freezed == faceId
          ? _value.faceId
          : faceId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SdkPrepareInfoModelImplCopyWith<$Res>
    implements $SdkPrepareInfoModelCopyWith<$Res> {
  factory _$$SdkPrepareInfoModelImplCopyWith(_$SdkPrepareInfoModelImpl value,
          $Res Function(_$SdkPrepareInfoModelImpl) then) =
      __$$SdkPrepareInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? appId,
      String? version,
      String? nonce,
      String? sign,
      String? orderNo,
      String? faceId,
      String? userId,
      String? license});
}

/// @nodoc
class __$$SdkPrepareInfoModelImplCopyWithImpl<$Res>
    extends _$SdkPrepareInfoModelCopyWithImpl<$Res, _$SdkPrepareInfoModelImpl>
    implements _$$SdkPrepareInfoModelImplCopyWith<$Res> {
  __$$SdkPrepareInfoModelImplCopyWithImpl(_$SdkPrepareInfoModelImpl _value,
      $Res Function(_$SdkPrepareInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appId = freezed,
    Object? version = freezed,
    Object? nonce = freezed,
    Object? sign = freezed,
    Object? orderNo = freezed,
    Object? faceId = freezed,
    Object? userId = freezed,
    Object? license = freezed,
  }) {
    return _then(_$SdkPrepareInfoModelImpl(
      appId: freezed == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      nonce: freezed == nonce
          ? _value.nonce
          : nonce // ignore: cast_nullable_to_non_nullable
              as String?,
      sign: freezed == sign
          ? _value.sign
          : sign // ignore: cast_nullable_to_non_nullable
              as String?,
      orderNo: freezed == orderNo
          ? _value.orderNo
          : orderNo // ignore: cast_nullable_to_non_nullable
              as String?,
      faceId: freezed == faceId
          ? _value.faceId
          : faceId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SdkPrepareInfoModelImpl implements _SdkPrepareInfoModel {
  const _$SdkPrepareInfoModelImpl(
      {this.appId,
      this.version,
      this.nonce,
      this.sign,
      this.orderNo,
      this.faceId,
      this.userId,
      this.license});

  factory _$SdkPrepareInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SdkPrepareInfoModelImplFromJson(json);

  @override
  final String? appId;
// appid
  @override
  final String? version;
// 版本号
  @override
  final String? nonce;
// 32位的随机字符串 nonceStr
  @override
  final String? sign;
// 签名
  @override
  final String? orderNo;
// 第三方KYC认证订单号
  @override
  final String? faceId;
// 第三方KYC认证faceId
  @override
  final String? userId;
// 唯一用户标识
  @override
  final String? license;

  @override
  String toString() {
    return 'SdkPrepareInfoModel(appId: $appId, version: $version, nonce: $nonce, sign: $sign, orderNo: $orderNo, faceId: $faceId, userId: $userId, license: $license)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SdkPrepareInfoModelImpl &&
            (identical(other.appId, appId) || other.appId == appId) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.nonce, nonce) || other.nonce == nonce) &&
            (identical(other.sign, sign) || other.sign == sign) &&
            (identical(other.orderNo, orderNo) || other.orderNo == orderNo) &&
            (identical(other.faceId, faceId) || other.faceId == faceId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.license, license) || other.license == license));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, appId, version, nonce, sign,
      orderNo, faceId, userId, license);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SdkPrepareInfoModelImplCopyWith<_$SdkPrepareInfoModelImpl> get copyWith =>
      __$$SdkPrepareInfoModelImplCopyWithImpl<_$SdkPrepareInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SdkPrepareInfoModelImplToJson(
      this,
    );
  }
}

abstract class _SdkPrepareInfoModel implements SdkPrepareInfoModel {
  const factory _SdkPrepareInfoModel(
      {final String? appId,
      final String? version,
      final String? nonce,
      final String? sign,
      final String? orderNo,
      final String? faceId,
      final String? userId,
      final String? license}) = _$SdkPrepareInfoModelImpl;

  factory _SdkPrepareInfoModel.fromJson(Map<String, dynamic> json) =
      _$SdkPrepareInfoModelImpl.fromJson;

  @override
  String? get appId;
  @override // appid
  String? get version;
  @override // 版本号
  String? get nonce;
  @override // 32位的随机字符串 nonceStr
  String? get sign;
  @override // 签名
  String? get orderNo;
  @override // 第三方KYC认证订单号
  String? get faceId;
  @override // 第三方KYC认证faceId
  String? get userId;
  @override // 唯一用户标识
  String? get license;
  @override
  @JsonKey(ignore: true)
  _$$SdkPrepareInfoModelImplCopyWith<_$SdkPrepareInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
