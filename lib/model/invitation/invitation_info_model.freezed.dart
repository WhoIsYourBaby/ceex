// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invitation_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvitationInfoModel _$InvitationInfoModelFromJson(Map<String, dynamic> json) {
  return _InvitationInfoModel.fromJson(json);
}

/// @nodoc
mixin _$InvitationInfoModel {
  String? get inviteCode => throw _privateConstructorUsedError; //券商Logo
  InvitationInfoDtoModel? get inviteInfoDTO =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvitationInfoModelCopyWith<InvitationInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationInfoModelCopyWith<$Res> {
  factory $InvitationInfoModelCopyWith(
          InvitationInfoModel value, $Res Function(InvitationInfoModel) then) =
      _$InvitationInfoModelCopyWithImpl<$Res, InvitationInfoModel>;
  @useResult
  $Res call({String? inviteCode, InvitationInfoDtoModel? inviteInfoDTO});

  $InvitationInfoDtoModelCopyWith<$Res>? get inviteInfoDTO;
}

/// @nodoc
class _$InvitationInfoModelCopyWithImpl<$Res, $Val extends InvitationInfoModel>
    implements $InvitationInfoModelCopyWith<$Res> {
  _$InvitationInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inviteCode = freezed,
    Object? inviteInfoDTO = freezed,
  }) {
    return _then(_value.copyWith(
      inviteCode: freezed == inviteCode
          ? _value.inviteCode
          : inviteCode // ignore: cast_nullable_to_non_nullable
              as String?,
      inviteInfoDTO: freezed == inviteInfoDTO
          ? _value.inviteInfoDTO
          : inviteInfoDTO // ignore: cast_nullable_to_non_nullable
              as InvitationInfoDtoModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InvitationInfoDtoModelCopyWith<$Res>? get inviteInfoDTO {
    if (_value.inviteInfoDTO == null) {
      return null;
    }

    return $InvitationInfoDtoModelCopyWith<$Res>(_value.inviteInfoDTO!,
        (value) {
      return _then(_value.copyWith(inviteInfoDTO: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InvitationInfoModelImplCopyWith<$Res>
    implements $InvitationInfoModelCopyWith<$Res> {
  factory _$$InvitationInfoModelImplCopyWith(_$InvitationInfoModelImpl value,
          $Res Function(_$InvitationInfoModelImpl) then) =
      __$$InvitationInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? inviteCode, InvitationInfoDtoModel? inviteInfoDTO});

  @override
  $InvitationInfoDtoModelCopyWith<$Res>? get inviteInfoDTO;
}

/// @nodoc
class __$$InvitationInfoModelImplCopyWithImpl<$Res>
    extends _$InvitationInfoModelCopyWithImpl<$Res, _$InvitationInfoModelImpl>
    implements _$$InvitationInfoModelImplCopyWith<$Res> {
  __$$InvitationInfoModelImplCopyWithImpl(_$InvitationInfoModelImpl _value,
      $Res Function(_$InvitationInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inviteCode = freezed,
    Object? inviteInfoDTO = freezed,
  }) {
    return _then(_$InvitationInfoModelImpl(
      inviteCode: freezed == inviteCode
          ? _value.inviteCode
          : inviteCode // ignore: cast_nullable_to_non_nullable
              as String?,
      inviteInfoDTO: freezed == inviteInfoDTO
          ? _value.inviteInfoDTO
          : inviteInfoDTO // ignore: cast_nullable_to_non_nullable
              as InvitationInfoDtoModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvitationInfoModelImpl implements _InvitationInfoModel {
  const _$InvitationInfoModelImpl({this.inviteCode, this.inviteInfoDTO});

  factory _$InvitationInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvitationInfoModelImplFromJson(json);

  @override
  final String? inviteCode;
//券商Logo
  @override
  final InvitationInfoDtoModel? inviteInfoDTO;

  @override
  String toString() {
    return 'InvitationInfoModel(inviteCode: $inviteCode, inviteInfoDTO: $inviteInfoDTO)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvitationInfoModelImpl &&
            (identical(other.inviteCode, inviteCode) ||
                other.inviteCode == inviteCode) &&
            (identical(other.inviteInfoDTO, inviteInfoDTO) ||
                other.inviteInfoDTO == inviteInfoDTO));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, inviteCode, inviteInfoDTO);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvitationInfoModelImplCopyWith<_$InvitationInfoModelImpl> get copyWith =>
      __$$InvitationInfoModelImplCopyWithImpl<_$InvitationInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvitationInfoModelImplToJson(
      this,
    );
  }
}

abstract class _InvitationInfoModel implements InvitationInfoModel {
  const factory _InvitationInfoModel(
      {final String? inviteCode,
      final InvitationInfoDtoModel? inviteInfoDTO}) = _$InvitationInfoModelImpl;

  factory _InvitationInfoModel.fromJson(Map<String, dynamic> json) =
      _$InvitationInfoModelImpl.fromJson;

  @override
  String? get inviteCode;
  @override //券商Logo
  InvitationInfoDtoModel? get inviteInfoDTO;
  @override
  @JsonKey(ignore: true)
  _$$InvitationInfoModelImplCopyWith<_$InvitationInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvitationInfoDtoModel _$InvitationInfoDtoModelFromJson(
    Map<String, dynamic> json) {
  return _InvitationInfoDtoModel.fromJson(json);
}

/// @nodoc
mixin _$InvitationInfoDtoModel {
  String? get userId => throw _privateConstructorUsedError; //券商Logo
  int? get inviteCount => throw _privateConstructorUsedError; // 总邀请数
  int? get inviteVaildCount => throw _privateConstructorUsedError; // 有效邀请数
  int? get inviteDirectVaildCount =>
      throw _privateConstructorUsedError; // 直接邀请数
  int? get inviteIndirectVaildCount =>
      throw _privateConstructorUsedError; // 间接邀请数
  int? get inviteLevel => throw _privateConstructorUsedError; //邀请等级
  double? get directRate => throw _privateConstructorUsedError;
  double? get indirectRate => throw _privateConstructorUsedError;
  double? get bonusCoin => throw _privateConstructorUsedError;
  double? get bonusPoint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvitationInfoDtoModelCopyWith<InvitationInfoDtoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationInfoDtoModelCopyWith<$Res> {
  factory $InvitationInfoDtoModelCopyWith(InvitationInfoDtoModel value,
          $Res Function(InvitationInfoDtoModel) then) =
      _$InvitationInfoDtoModelCopyWithImpl<$Res, InvitationInfoDtoModel>;
  @useResult
  $Res call(
      {String? userId,
      int? inviteCount,
      int? inviteVaildCount,
      int? inviteDirectVaildCount,
      int? inviteIndirectVaildCount,
      int? inviteLevel,
      double? directRate,
      double? indirectRate,
      double? bonusCoin,
      double? bonusPoint});
}

/// @nodoc
class _$InvitationInfoDtoModelCopyWithImpl<$Res,
        $Val extends InvitationInfoDtoModel>
    implements $InvitationInfoDtoModelCopyWith<$Res> {
  _$InvitationInfoDtoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? inviteCount = freezed,
    Object? inviteVaildCount = freezed,
    Object? inviteDirectVaildCount = freezed,
    Object? inviteIndirectVaildCount = freezed,
    Object? inviteLevel = freezed,
    Object? directRate = freezed,
    Object? indirectRate = freezed,
    Object? bonusCoin = freezed,
    Object? bonusPoint = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      inviteCount: freezed == inviteCount
          ? _value.inviteCount
          : inviteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      inviteVaildCount: freezed == inviteVaildCount
          ? _value.inviteVaildCount
          : inviteVaildCount // ignore: cast_nullable_to_non_nullable
              as int?,
      inviteDirectVaildCount: freezed == inviteDirectVaildCount
          ? _value.inviteDirectVaildCount
          : inviteDirectVaildCount // ignore: cast_nullable_to_non_nullable
              as int?,
      inviteIndirectVaildCount: freezed == inviteIndirectVaildCount
          ? _value.inviteIndirectVaildCount
          : inviteIndirectVaildCount // ignore: cast_nullable_to_non_nullable
              as int?,
      inviteLevel: freezed == inviteLevel
          ? _value.inviteLevel
          : inviteLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      directRate: freezed == directRate
          ? _value.directRate
          : directRate // ignore: cast_nullable_to_non_nullable
              as double?,
      indirectRate: freezed == indirectRate
          ? _value.indirectRate
          : indirectRate // ignore: cast_nullable_to_non_nullable
              as double?,
      bonusCoin: freezed == bonusCoin
          ? _value.bonusCoin
          : bonusCoin // ignore: cast_nullable_to_non_nullable
              as double?,
      bonusPoint: freezed == bonusPoint
          ? _value.bonusPoint
          : bonusPoint // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvitationInfoDtoModelImplCopyWith<$Res>
    implements $InvitationInfoDtoModelCopyWith<$Res> {
  factory _$$InvitationInfoDtoModelImplCopyWith(
          _$InvitationInfoDtoModelImpl value,
          $Res Function(_$InvitationInfoDtoModelImpl) then) =
      __$$InvitationInfoDtoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userId,
      int? inviteCount,
      int? inviteVaildCount,
      int? inviteDirectVaildCount,
      int? inviteIndirectVaildCount,
      int? inviteLevel,
      double? directRate,
      double? indirectRate,
      double? bonusCoin,
      double? bonusPoint});
}

/// @nodoc
class __$$InvitationInfoDtoModelImplCopyWithImpl<$Res>
    extends _$InvitationInfoDtoModelCopyWithImpl<$Res,
        _$InvitationInfoDtoModelImpl>
    implements _$$InvitationInfoDtoModelImplCopyWith<$Res> {
  __$$InvitationInfoDtoModelImplCopyWithImpl(
      _$InvitationInfoDtoModelImpl _value,
      $Res Function(_$InvitationInfoDtoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? inviteCount = freezed,
    Object? inviteVaildCount = freezed,
    Object? inviteDirectVaildCount = freezed,
    Object? inviteIndirectVaildCount = freezed,
    Object? inviteLevel = freezed,
    Object? directRate = freezed,
    Object? indirectRate = freezed,
    Object? bonusCoin = freezed,
    Object? bonusPoint = freezed,
  }) {
    return _then(_$InvitationInfoDtoModelImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      inviteCount: freezed == inviteCount
          ? _value.inviteCount
          : inviteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      inviteVaildCount: freezed == inviteVaildCount
          ? _value.inviteVaildCount
          : inviteVaildCount // ignore: cast_nullable_to_non_nullable
              as int?,
      inviteDirectVaildCount: freezed == inviteDirectVaildCount
          ? _value.inviteDirectVaildCount
          : inviteDirectVaildCount // ignore: cast_nullable_to_non_nullable
              as int?,
      inviteIndirectVaildCount: freezed == inviteIndirectVaildCount
          ? _value.inviteIndirectVaildCount
          : inviteIndirectVaildCount // ignore: cast_nullable_to_non_nullable
              as int?,
      inviteLevel: freezed == inviteLevel
          ? _value.inviteLevel
          : inviteLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      directRate: freezed == directRate
          ? _value.directRate
          : directRate // ignore: cast_nullable_to_non_nullable
              as double?,
      indirectRate: freezed == indirectRate
          ? _value.indirectRate
          : indirectRate // ignore: cast_nullable_to_non_nullable
              as double?,
      bonusCoin: freezed == bonusCoin
          ? _value.bonusCoin
          : bonusCoin // ignore: cast_nullable_to_non_nullable
              as double?,
      bonusPoint: freezed == bonusPoint
          ? _value.bonusPoint
          : bonusPoint // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvitationInfoDtoModelImpl implements _InvitationInfoDtoModel {
  const _$InvitationInfoDtoModelImpl(
      {this.userId,
      this.inviteCount,
      this.inviteVaildCount,
      this.inviteDirectVaildCount,
      this.inviteIndirectVaildCount,
      this.inviteLevel,
      this.directRate,
      this.indirectRate,
      this.bonusCoin,
      this.bonusPoint});

  factory _$InvitationInfoDtoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvitationInfoDtoModelImplFromJson(json);

  @override
  final String? userId;
//券商Logo
  @override
  final int? inviteCount;
// 总邀请数
  @override
  final int? inviteVaildCount;
// 有效邀请数
  @override
  final int? inviteDirectVaildCount;
// 直接邀请数
  @override
  final int? inviteIndirectVaildCount;
// 间接邀请数
  @override
  final int? inviteLevel;
//邀请等级
  @override
  final double? directRate;
  @override
  final double? indirectRate;
  @override
  final double? bonusCoin;
  @override
  final double? bonusPoint;

  @override
  String toString() {
    return 'InvitationInfoDtoModel(userId: $userId, inviteCount: $inviteCount, inviteVaildCount: $inviteVaildCount, inviteDirectVaildCount: $inviteDirectVaildCount, inviteIndirectVaildCount: $inviteIndirectVaildCount, inviteLevel: $inviteLevel, directRate: $directRate, indirectRate: $indirectRate, bonusCoin: $bonusCoin, bonusPoint: $bonusPoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvitationInfoDtoModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.inviteCount, inviteCount) ||
                other.inviteCount == inviteCount) &&
            (identical(other.inviteVaildCount, inviteVaildCount) ||
                other.inviteVaildCount == inviteVaildCount) &&
            (identical(other.inviteDirectVaildCount, inviteDirectVaildCount) ||
                other.inviteDirectVaildCount == inviteDirectVaildCount) &&
            (identical(
                    other.inviteIndirectVaildCount, inviteIndirectVaildCount) ||
                other.inviteIndirectVaildCount == inviteIndirectVaildCount) &&
            (identical(other.inviteLevel, inviteLevel) ||
                other.inviteLevel == inviteLevel) &&
            (identical(other.directRate, directRate) ||
                other.directRate == directRate) &&
            (identical(other.indirectRate, indirectRate) ||
                other.indirectRate == indirectRate) &&
            (identical(other.bonusCoin, bonusCoin) ||
                other.bonusCoin == bonusCoin) &&
            (identical(other.bonusPoint, bonusPoint) ||
                other.bonusPoint == bonusPoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      inviteCount,
      inviteVaildCount,
      inviteDirectVaildCount,
      inviteIndirectVaildCount,
      inviteLevel,
      directRate,
      indirectRate,
      bonusCoin,
      bonusPoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvitationInfoDtoModelImplCopyWith<_$InvitationInfoDtoModelImpl>
      get copyWith => __$$InvitationInfoDtoModelImplCopyWithImpl<
          _$InvitationInfoDtoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvitationInfoDtoModelImplToJson(
      this,
    );
  }
}

abstract class _InvitationInfoDtoModel implements InvitationInfoDtoModel {
  const factory _InvitationInfoDtoModel(
      {final String? userId,
      final int? inviteCount,
      final int? inviteVaildCount,
      final int? inviteDirectVaildCount,
      final int? inviteIndirectVaildCount,
      final int? inviteLevel,
      final double? directRate,
      final double? indirectRate,
      final double? bonusCoin,
      final double? bonusPoint}) = _$InvitationInfoDtoModelImpl;

  factory _InvitationInfoDtoModel.fromJson(Map<String, dynamic> json) =
      _$InvitationInfoDtoModelImpl.fromJson;

  @override
  String? get userId;
  @override //券商Logo
  int? get inviteCount;
  @override // 总邀请数
  int? get inviteVaildCount;
  @override // 有效邀请数
  int? get inviteDirectVaildCount;
  @override // 直接邀请数
  int? get inviteIndirectVaildCount;
  @override // 间接邀请数
  int? get inviteLevel;
  @override //邀请等级
  double? get directRate;
  @override
  double? get indirectRate;
  @override
  double? get bonusCoin;
  @override
  double? get bonusPoint;
  @override
  @JsonKey(ignore: true)
  _$$InvitationInfoDtoModelImplCopyWith<_$InvitationInfoDtoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
