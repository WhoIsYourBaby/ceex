// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc_authentication_information_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KycAuthenticationInformationModel _$KycAuthenticationInformationModelFromJson(
    Map<String, dynamic> json) {
  return _KycAuthenticationInformationModel.fromJson(json);
}

/// @nodoc
mixin _$KycAuthenticationInformationModel {
  int? get kycLevel => throw _privateConstructorUsedError; // kyc认证级别
  String? get displayLevel => throw _privateConstructorUsedError; // 显示的kyc级别
  String? get countryCode => throw _privateConstructorUsedError; // 国家代码
  bool? get faceCompare => throw _privateConstructorUsedError; // 是否走人脸识别
  String? get otcDailyLimit => throw _privateConstructorUsedError; // otc每日限额
  String? get otcLimitCurrency => throw _privateConstructorUsedError; // 限额货币单位
  String? get withdrawDailyLimit =>
      throw _privateConstructorUsedError; // 提币每日限额
  String? get withdrawLimitToken =>
      throw _privateConstructorUsedError; // 提币限额计价token
  int? get verifyStatus =>
      throw _privateConstructorUsedError; // 当前级别的认证状态 0未提交审核 1审核中 2审核通过 3未通过审核
  bool? get allowVerify =>
      throw _privateConstructorUsedError; // 是否允许认证 true=允许 false=不允许
  String? get videoAgreement => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KycAuthenticationInformationModelCopyWith<KycAuthenticationInformationModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KycAuthenticationInformationModelCopyWith<$Res> {
  factory $KycAuthenticationInformationModelCopyWith(
          KycAuthenticationInformationModel value,
          $Res Function(KycAuthenticationInformationModel) then) =
      _$KycAuthenticationInformationModelCopyWithImpl<$Res,
          KycAuthenticationInformationModel>;
  @useResult
  $Res call(
      {int? kycLevel,
      String? displayLevel,
      String? countryCode,
      bool? faceCompare,
      String? otcDailyLimit,
      String? otcLimitCurrency,
      String? withdrawDailyLimit,
      String? withdrawLimitToken,
      int? verifyStatus,
      bool? allowVerify,
      String? videoAgreement});
}

/// @nodoc
class _$KycAuthenticationInformationModelCopyWithImpl<$Res,
        $Val extends KycAuthenticationInformationModel>
    implements $KycAuthenticationInformationModelCopyWith<$Res> {
  _$KycAuthenticationInformationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kycLevel = freezed,
    Object? displayLevel = freezed,
    Object? countryCode = freezed,
    Object? faceCompare = freezed,
    Object? otcDailyLimit = freezed,
    Object? otcLimitCurrency = freezed,
    Object? withdrawDailyLimit = freezed,
    Object? withdrawLimitToken = freezed,
    Object? verifyStatus = freezed,
    Object? allowVerify = freezed,
    Object? videoAgreement = freezed,
  }) {
    return _then(_value.copyWith(
      kycLevel: freezed == kycLevel
          ? _value.kycLevel
          : kycLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      displayLevel: freezed == displayLevel
          ? _value.displayLevel
          : displayLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      faceCompare: freezed == faceCompare
          ? _value.faceCompare
          : faceCompare // ignore: cast_nullable_to_non_nullable
              as bool?,
      otcDailyLimit: freezed == otcDailyLimit
          ? _value.otcDailyLimit
          : otcDailyLimit // ignore: cast_nullable_to_non_nullable
              as String?,
      otcLimitCurrency: freezed == otcLimitCurrency
          ? _value.otcLimitCurrency
          : otcLimitCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      withdrawDailyLimit: freezed == withdrawDailyLimit
          ? _value.withdrawDailyLimit
          : withdrawDailyLimit // ignore: cast_nullable_to_non_nullable
              as String?,
      withdrawLimitToken: freezed == withdrawLimitToken
          ? _value.withdrawLimitToken
          : withdrawLimitToken // ignore: cast_nullable_to_non_nullable
              as String?,
      verifyStatus: freezed == verifyStatus
          ? _value.verifyStatus
          : verifyStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      allowVerify: freezed == allowVerify
          ? _value.allowVerify
          : allowVerify // ignore: cast_nullable_to_non_nullable
              as bool?,
      videoAgreement: freezed == videoAgreement
          ? _value.videoAgreement
          : videoAgreement // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KycAuthenticationInformationModelImplCopyWith<$Res>
    implements $KycAuthenticationInformationModelCopyWith<$Res> {
  factory _$$KycAuthenticationInformationModelImplCopyWith(
          _$KycAuthenticationInformationModelImpl value,
          $Res Function(_$KycAuthenticationInformationModelImpl) then) =
      __$$KycAuthenticationInformationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? kycLevel,
      String? displayLevel,
      String? countryCode,
      bool? faceCompare,
      String? otcDailyLimit,
      String? otcLimitCurrency,
      String? withdrawDailyLimit,
      String? withdrawLimitToken,
      int? verifyStatus,
      bool? allowVerify,
      String? videoAgreement});
}

/// @nodoc
class __$$KycAuthenticationInformationModelImplCopyWithImpl<$Res>
    extends _$KycAuthenticationInformationModelCopyWithImpl<$Res,
        _$KycAuthenticationInformationModelImpl>
    implements _$$KycAuthenticationInformationModelImplCopyWith<$Res> {
  __$$KycAuthenticationInformationModelImplCopyWithImpl(
      _$KycAuthenticationInformationModelImpl _value,
      $Res Function(_$KycAuthenticationInformationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kycLevel = freezed,
    Object? displayLevel = freezed,
    Object? countryCode = freezed,
    Object? faceCompare = freezed,
    Object? otcDailyLimit = freezed,
    Object? otcLimitCurrency = freezed,
    Object? withdrawDailyLimit = freezed,
    Object? withdrawLimitToken = freezed,
    Object? verifyStatus = freezed,
    Object? allowVerify = freezed,
    Object? videoAgreement = freezed,
  }) {
    return _then(_$KycAuthenticationInformationModelImpl(
      kycLevel: freezed == kycLevel
          ? _value.kycLevel
          : kycLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      displayLevel: freezed == displayLevel
          ? _value.displayLevel
          : displayLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      faceCompare: freezed == faceCompare
          ? _value.faceCompare
          : faceCompare // ignore: cast_nullable_to_non_nullable
              as bool?,
      otcDailyLimit: freezed == otcDailyLimit
          ? _value.otcDailyLimit
          : otcDailyLimit // ignore: cast_nullable_to_non_nullable
              as String?,
      otcLimitCurrency: freezed == otcLimitCurrency
          ? _value.otcLimitCurrency
          : otcLimitCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      withdrawDailyLimit: freezed == withdrawDailyLimit
          ? _value.withdrawDailyLimit
          : withdrawDailyLimit // ignore: cast_nullable_to_non_nullable
              as String?,
      withdrawLimitToken: freezed == withdrawLimitToken
          ? _value.withdrawLimitToken
          : withdrawLimitToken // ignore: cast_nullable_to_non_nullable
              as String?,
      verifyStatus: freezed == verifyStatus
          ? _value.verifyStatus
          : verifyStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      allowVerify: freezed == allowVerify
          ? _value.allowVerify
          : allowVerify // ignore: cast_nullable_to_non_nullable
              as bool?,
      videoAgreement: freezed == videoAgreement
          ? _value.videoAgreement
          : videoAgreement // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KycAuthenticationInformationModelImpl
    implements _KycAuthenticationInformationModel {
  const _$KycAuthenticationInformationModelImpl(
      {this.kycLevel,
      this.displayLevel,
      this.countryCode,
      this.faceCompare,
      this.otcDailyLimit,
      this.otcLimitCurrency,
      this.withdrawDailyLimit,
      this.withdrawLimitToken,
      this.verifyStatus,
      this.allowVerify,
      this.videoAgreement});

  factory _$KycAuthenticationInformationModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$KycAuthenticationInformationModelImplFromJson(json);

  @override
  final int? kycLevel;
// kyc认证级别
  @override
  final String? displayLevel;
// 显示的kyc级别
  @override
  final String? countryCode;
// 国家代码
  @override
  final bool? faceCompare;
// 是否走人脸识别
  @override
  final String? otcDailyLimit;
// otc每日限额
  @override
  final String? otcLimitCurrency;
// 限额货币单位
  @override
  final String? withdrawDailyLimit;
// 提币每日限额
  @override
  final String? withdrawLimitToken;
// 提币限额计价token
  @override
  final int? verifyStatus;
// 当前级别的认证状态 0未提交审核 1审核中 2审核通过 3未通过审核
  @override
  final bool? allowVerify;
// 是否允许认证 true=允许 false=不允许
  @override
  final String? videoAgreement;

  @override
  String toString() {
    return 'KycAuthenticationInformationModel(kycLevel: $kycLevel, displayLevel: $displayLevel, countryCode: $countryCode, faceCompare: $faceCompare, otcDailyLimit: $otcDailyLimit, otcLimitCurrency: $otcLimitCurrency, withdrawDailyLimit: $withdrawDailyLimit, withdrawLimitToken: $withdrawLimitToken, verifyStatus: $verifyStatus, allowVerify: $allowVerify, videoAgreement: $videoAgreement)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KycAuthenticationInformationModelImpl &&
            (identical(other.kycLevel, kycLevel) ||
                other.kycLevel == kycLevel) &&
            (identical(other.displayLevel, displayLevel) ||
                other.displayLevel == displayLevel) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.faceCompare, faceCompare) ||
                other.faceCompare == faceCompare) &&
            (identical(other.otcDailyLimit, otcDailyLimit) ||
                other.otcDailyLimit == otcDailyLimit) &&
            (identical(other.otcLimitCurrency, otcLimitCurrency) ||
                other.otcLimitCurrency == otcLimitCurrency) &&
            (identical(other.withdrawDailyLimit, withdrawDailyLimit) ||
                other.withdrawDailyLimit == withdrawDailyLimit) &&
            (identical(other.withdrawLimitToken, withdrawLimitToken) ||
                other.withdrawLimitToken == withdrawLimitToken) &&
            (identical(other.verifyStatus, verifyStatus) ||
                other.verifyStatus == verifyStatus) &&
            (identical(other.allowVerify, allowVerify) ||
                other.allowVerify == allowVerify) &&
            (identical(other.videoAgreement, videoAgreement) ||
                other.videoAgreement == videoAgreement));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      kycLevel,
      displayLevel,
      countryCode,
      faceCompare,
      otcDailyLimit,
      otcLimitCurrency,
      withdrawDailyLimit,
      withdrawLimitToken,
      verifyStatus,
      allowVerify,
      videoAgreement);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KycAuthenticationInformationModelImplCopyWith<
          _$KycAuthenticationInformationModelImpl>
      get copyWith => __$$KycAuthenticationInformationModelImplCopyWithImpl<
          _$KycAuthenticationInformationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KycAuthenticationInformationModelImplToJson(
      this,
    );
  }
}

abstract class _KycAuthenticationInformationModel
    implements KycAuthenticationInformationModel {
  const factory _KycAuthenticationInformationModel(
      {final int? kycLevel,
      final String? displayLevel,
      final String? countryCode,
      final bool? faceCompare,
      final String? otcDailyLimit,
      final String? otcLimitCurrency,
      final String? withdrawDailyLimit,
      final String? withdrawLimitToken,
      final int? verifyStatus,
      final bool? allowVerify,
      final String? videoAgreement}) = _$KycAuthenticationInformationModelImpl;

  factory _KycAuthenticationInformationModel.fromJson(
          Map<String, dynamic> json) =
      _$KycAuthenticationInformationModelImpl.fromJson;

  @override
  int? get kycLevel;
  @override // kyc认证级别
  String? get displayLevel;
  @override // 显示的kyc级别
  String? get countryCode;
  @override // 国家代码
  bool? get faceCompare;
  @override // 是否走人脸识别
  String? get otcDailyLimit;
  @override // otc每日限额
  String? get otcLimitCurrency;
  @override // 限额货币单位
  String? get withdrawDailyLimit;
  @override // 提币每日限额
  String? get withdrawLimitToken;
  @override // 提币限额计价token
  int? get verifyStatus;
  @override // 当前级别的认证状态 0未提交审核 1审核中 2审核通过 3未通过审核
  bool? get allowVerify;
  @override // 是否允许认证 true=允许 false=不允许
  String? get videoAgreement;
  @override
  @JsonKey(ignore: true)
  _$$KycAuthenticationInformationModelImplCopyWith<
          _$KycAuthenticationInformationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
