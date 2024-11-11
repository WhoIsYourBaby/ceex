// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invitation_feeback_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvitationFeebackModel _$InvitationFeebackModelFromJson(
    Map<String, dynamic> json) {
  return _InvitationFeebackModel.fromJson(json);
}

/// @nodoc
mixin _$InvitationFeebackModel {
  String? get id => throw _privateConstructorUsedError;
  String? get actId => throw _privateConstructorUsedError;
  int? get level => throw _privateConstructorUsedError; // 等级
  String? get levelTag => throw _privateConstructorUsedError; // 标签名称
  double? get levelCondition => throw _privateConstructorUsedError; // 等级条件
  double? get directRate => throw _privateConstructorUsedError; //直接费率
  double? get indirectRate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvitationFeebackModelCopyWith<InvitationFeebackModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationFeebackModelCopyWith<$Res> {
  factory $InvitationFeebackModelCopyWith(InvitationFeebackModel value,
          $Res Function(InvitationFeebackModel) then) =
      _$InvitationFeebackModelCopyWithImpl<$Res, InvitationFeebackModel>;
  @useResult
  $Res call(
      {String? id,
      String? actId,
      int? level,
      String? levelTag,
      double? levelCondition,
      double? directRate,
      double? indirectRate});
}

/// @nodoc
class _$InvitationFeebackModelCopyWithImpl<$Res,
        $Val extends InvitationFeebackModel>
    implements $InvitationFeebackModelCopyWith<$Res> {
  _$InvitationFeebackModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? actId = freezed,
    Object? level = freezed,
    Object? levelTag = freezed,
    Object? levelCondition = freezed,
    Object? directRate = freezed,
    Object? indirectRate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      actId: freezed == actId
          ? _value.actId
          : actId // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      levelTag: freezed == levelTag
          ? _value.levelTag
          : levelTag // ignore: cast_nullable_to_non_nullable
              as String?,
      levelCondition: freezed == levelCondition
          ? _value.levelCondition
          : levelCondition // ignore: cast_nullable_to_non_nullable
              as double?,
      directRate: freezed == directRate
          ? _value.directRate
          : directRate // ignore: cast_nullable_to_non_nullable
              as double?,
      indirectRate: freezed == indirectRate
          ? _value.indirectRate
          : indirectRate // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvitationFeebackModelImplCopyWith<$Res>
    implements $InvitationFeebackModelCopyWith<$Res> {
  factory _$$InvitationFeebackModelImplCopyWith(
          _$InvitationFeebackModelImpl value,
          $Res Function(_$InvitationFeebackModelImpl) then) =
      __$$InvitationFeebackModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? actId,
      int? level,
      String? levelTag,
      double? levelCondition,
      double? directRate,
      double? indirectRate});
}

/// @nodoc
class __$$InvitationFeebackModelImplCopyWithImpl<$Res>
    extends _$InvitationFeebackModelCopyWithImpl<$Res,
        _$InvitationFeebackModelImpl>
    implements _$$InvitationFeebackModelImplCopyWith<$Res> {
  __$$InvitationFeebackModelImplCopyWithImpl(
      _$InvitationFeebackModelImpl _value,
      $Res Function(_$InvitationFeebackModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? actId = freezed,
    Object? level = freezed,
    Object? levelTag = freezed,
    Object? levelCondition = freezed,
    Object? directRate = freezed,
    Object? indirectRate = freezed,
  }) {
    return _then(_$InvitationFeebackModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      actId: freezed == actId
          ? _value.actId
          : actId // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      levelTag: freezed == levelTag
          ? _value.levelTag
          : levelTag // ignore: cast_nullable_to_non_nullable
              as String?,
      levelCondition: freezed == levelCondition
          ? _value.levelCondition
          : levelCondition // ignore: cast_nullable_to_non_nullable
              as double?,
      directRate: freezed == directRate
          ? _value.directRate
          : directRate // ignore: cast_nullable_to_non_nullable
              as double?,
      indirectRate: freezed == indirectRate
          ? _value.indirectRate
          : indirectRate // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvitationFeebackModelImpl implements _InvitationFeebackModel {
  const _$InvitationFeebackModelImpl(
      {this.id,
      this.actId,
      this.level,
      this.levelTag,
      this.levelCondition,
      this.directRate,
      this.indirectRate});

  factory _$InvitationFeebackModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvitationFeebackModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? actId;
  @override
  final int? level;
// 等级
  @override
  final String? levelTag;
// 标签名称
  @override
  final double? levelCondition;
// 等级条件
  @override
  final double? directRate;
//直接费率
  @override
  final double? indirectRate;

  @override
  String toString() {
    return 'InvitationFeebackModel(id: $id, actId: $actId, level: $level, levelTag: $levelTag, levelCondition: $levelCondition, directRate: $directRate, indirectRate: $indirectRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvitationFeebackModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.actId, actId) || other.actId == actId) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.levelTag, levelTag) ||
                other.levelTag == levelTag) &&
            (identical(other.levelCondition, levelCondition) ||
                other.levelCondition == levelCondition) &&
            (identical(other.directRate, directRate) ||
                other.directRate == directRate) &&
            (identical(other.indirectRate, indirectRate) ||
                other.indirectRate == indirectRate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, actId, level, levelTag,
      levelCondition, directRate, indirectRate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvitationFeebackModelImplCopyWith<_$InvitationFeebackModelImpl>
      get copyWith => __$$InvitationFeebackModelImplCopyWithImpl<
          _$InvitationFeebackModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvitationFeebackModelImplToJson(
      this,
    );
  }
}

abstract class _InvitationFeebackModel implements InvitationFeebackModel {
  const factory _InvitationFeebackModel(
      {final String? id,
      final String? actId,
      final int? level,
      final String? levelTag,
      final double? levelCondition,
      final double? directRate,
      final double? indirectRate}) = _$InvitationFeebackModelImpl;

  factory _InvitationFeebackModel.fromJson(Map<String, dynamic> json) =
      _$InvitationFeebackModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get actId;
  @override
  int? get level;
  @override // 等级
  String? get levelTag;
  @override // 标签名称
  double? get levelCondition;
  @override // 等级条件
  double? get directRate;
  @override //直接费率
  double? get indirectRate;
  @override
  @JsonKey(ignore: true)
  _$$InvitationFeebackModelImplCopyWith<_$InvitationFeebackModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
