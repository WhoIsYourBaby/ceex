// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invitation_relation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvitationRelationModel _$InvitationRelationModelFromJson(
    Map<String, dynamic> json) {
  return _InvitationRelationModel.fromJson(json);
}

/// @nodoc
mixin _$InvitationRelationModel {
  int? get status => throw _privateConstructorUsedError;
  List<InvitationDataModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvitationRelationModelCopyWith<InvitationRelationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationRelationModelCopyWith<$Res> {
  factory $InvitationRelationModelCopyWith(InvitationRelationModel value,
          $Res Function(InvitationRelationModel) then) =
      _$InvitationRelationModelCopyWithImpl<$Res, InvitationRelationModel>;
  @useResult
  $Res call({int? status, List<InvitationDataModel>? data});
}

/// @nodoc
class _$InvitationRelationModelCopyWithImpl<$Res,
        $Val extends InvitationRelationModel>
    implements $InvitationRelationModelCopyWith<$Res> {
  _$InvitationRelationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<InvitationDataModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvitationRelationModelImplCopyWith<$Res>
    implements $InvitationRelationModelCopyWith<$Res> {
  factory _$$InvitationRelationModelImplCopyWith(
          _$InvitationRelationModelImpl value,
          $Res Function(_$InvitationRelationModelImpl) then) =
      __$$InvitationRelationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, List<InvitationDataModel>? data});
}

/// @nodoc
class __$$InvitationRelationModelImplCopyWithImpl<$Res>
    extends _$InvitationRelationModelCopyWithImpl<$Res,
        _$InvitationRelationModelImpl>
    implements _$$InvitationRelationModelImplCopyWith<$Res> {
  __$$InvitationRelationModelImplCopyWithImpl(
      _$InvitationRelationModelImpl _value,
      $Res Function(_$InvitationRelationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$InvitationRelationModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<InvitationDataModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvitationRelationModelImpl implements _InvitationRelationModel {
  const _$InvitationRelationModelImpl(
      {this.status, final List<InvitationDataModel>? data})
      : _data = data;

  factory _$InvitationRelationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvitationRelationModelImplFromJson(json);

  @override
  final int? status;
  final List<InvitationDataModel>? _data;
  @override
  List<InvitationDataModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'InvitationRelationModel(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvitationRelationModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvitationRelationModelImplCopyWith<_$InvitationRelationModelImpl>
      get copyWith => __$$InvitationRelationModelImplCopyWithImpl<
          _$InvitationRelationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvitationRelationModelImplToJson(
      this,
    );
  }
}

abstract class _InvitationRelationModel implements InvitationRelationModel {
  const factory _InvitationRelationModel(
      {final int? status,
      final List<InvitationDataModel>? data}) = _$InvitationRelationModelImpl;

  factory _InvitationRelationModel.fromJson(Map<String, dynamic> json) =
      _$InvitationRelationModelImpl.fromJson;

  @override
  int? get status;
  @override
  List<InvitationDataModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$InvitationRelationModelImplCopyWith<_$InvitationRelationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

InvitationDataModel _$InvitationDataModelFromJson(Map<String, dynamic> json) {
  return _InvitationDataModel.fromJson(json);
}

/// @nodoc
mixin _$InvitationDataModel {
  String? get inviteId => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError; // 邀请注册用户id
  String? get nationalCode => throw _privateConstructorUsedError; // 手机号对应的国家区号
  String? get mobile => throw _privateConstructorUsedError; // 手机号
  String? get email => throw _privateConstructorUsedError; // 邮箱
  int? get registerType => throw _privateConstructorUsedError; // 注册方式
  int? get verifyStatus =>
      throw _privateConstructorUsedError; // kyc状态: 0 未提交 1 审核中 2 审核通过 3 审核不通过
  String? get inviteType =>
      throw _privateConstructorUsedError; // 邀请类型 1 直接邀请 2 简介邀请
  String? get registerDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvitationDataModelCopyWith<InvitationDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationDataModelCopyWith<$Res> {
  factory $InvitationDataModelCopyWith(
          InvitationDataModel value, $Res Function(InvitationDataModel) then) =
      _$InvitationDataModelCopyWithImpl<$Res, InvitationDataModel>;
  @useResult
  $Res call(
      {String? inviteId,
      String? userId,
      String? nationalCode,
      String? mobile,
      String? email,
      int? registerType,
      int? verifyStatus,
      String? inviteType,
      String? registerDate});
}

/// @nodoc
class _$InvitationDataModelCopyWithImpl<$Res, $Val extends InvitationDataModel>
    implements $InvitationDataModelCopyWith<$Res> {
  _$InvitationDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inviteId = freezed,
    Object? userId = freezed,
    Object? nationalCode = freezed,
    Object? mobile = freezed,
    Object? email = freezed,
    Object? registerType = freezed,
    Object? verifyStatus = freezed,
    Object? inviteType = freezed,
    Object? registerDate = freezed,
  }) {
    return _then(_value.copyWith(
      inviteId: freezed == inviteId
          ? _value.inviteId
          : inviteId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      nationalCode: freezed == nationalCode
          ? _value.nationalCode
          : nationalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      registerType: freezed == registerType
          ? _value.registerType
          : registerType // ignore: cast_nullable_to_non_nullable
              as int?,
      verifyStatus: freezed == verifyStatus
          ? _value.verifyStatus
          : verifyStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      inviteType: freezed == inviteType
          ? _value.inviteType
          : inviteType // ignore: cast_nullable_to_non_nullable
              as String?,
      registerDate: freezed == registerDate
          ? _value.registerDate
          : registerDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvitationDataModelImplCopyWith<$Res>
    implements $InvitationDataModelCopyWith<$Res> {
  factory _$$InvitationDataModelImplCopyWith(_$InvitationDataModelImpl value,
          $Res Function(_$InvitationDataModelImpl) then) =
      __$$InvitationDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? inviteId,
      String? userId,
      String? nationalCode,
      String? mobile,
      String? email,
      int? registerType,
      int? verifyStatus,
      String? inviteType,
      String? registerDate});
}

/// @nodoc
class __$$InvitationDataModelImplCopyWithImpl<$Res>
    extends _$InvitationDataModelCopyWithImpl<$Res, _$InvitationDataModelImpl>
    implements _$$InvitationDataModelImplCopyWith<$Res> {
  __$$InvitationDataModelImplCopyWithImpl(_$InvitationDataModelImpl _value,
      $Res Function(_$InvitationDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inviteId = freezed,
    Object? userId = freezed,
    Object? nationalCode = freezed,
    Object? mobile = freezed,
    Object? email = freezed,
    Object? registerType = freezed,
    Object? verifyStatus = freezed,
    Object? inviteType = freezed,
    Object? registerDate = freezed,
  }) {
    return _then(_$InvitationDataModelImpl(
      inviteId: freezed == inviteId
          ? _value.inviteId
          : inviteId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      nationalCode: freezed == nationalCode
          ? _value.nationalCode
          : nationalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      registerType: freezed == registerType
          ? _value.registerType
          : registerType // ignore: cast_nullable_to_non_nullable
              as int?,
      verifyStatus: freezed == verifyStatus
          ? _value.verifyStatus
          : verifyStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      inviteType: freezed == inviteType
          ? _value.inviteType
          : inviteType // ignore: cast_nullable_to_non_nullable
              as String?,
      registerDate: freezed == registerDate
          ? _value.registerDate
          : registerDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvitationDataModelImpl implements _InvitationDataModel {
  const _$InvitationDataModelImpl(
      {this.inviteId,
      this.userId,
      this.nationalCode,
      this.mobile,
      this.email,
      this.registerType,
      this.verifyStatus,
      this.inviteType,
      this.registerDate});

  factory _$InvitationDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvitationDataModelImplFromJson(json);

  @override
  final String? inviteId;
  @override
  final String? userId;
// 邀请注册用户id
  @override
  final String? nationalCode;
// 手机号对应的国家区号
  @override
  final String? mobile;
// 手机号
  @override
  final String? email;
// 邮箱
  @override
  final int? registerType;
// 注册方式
  @override
  final int? verifyStatus;
// kyc状态: 0 未提交 1 审核中 2 审核通过 3 审核不通过
  @override
  final String? inviteType;
// 邀请类型 1 直接邀请 2 简介邀请
  @override
  final String? registerDate;

  @override
  String toString() {
    return 'InvitationDataModel(inviteId: $inviteId, userId: $userId, nationalCode: $nationalCode, mobile: $mobile, email: $email, registerType: $registerType, verifyStatus: $verifyStatus, inviteType: $inviteType, registerDate: $registerDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvitationDataModelImpl &&
            (identical(other.inviteId, inviteId) ||
                other.inviteId == inviteId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.nationalCode, nationalCode) ||
                other.nationalCode == nationalCode) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.registerType, registerType) ||
                other.registerType == registerType) &&
            (identical(other.verifyStatus, verifyStatus) ||
                other.verifyStatus == verifyStatus) &&
            (identical(other.inviteType, inviteType) ||
                other.inviteType == inviteType) &&
            (identical(other.registerDate, registerDate) ||
                other.registerDate == registerDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, inviteId, userId, nationalCode,
      mobile, email, registerType, verifyStatus, inviteType, registerDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvitationDataModelImplCopyWith<_$InvitationDataModelImpl> get copyWith =>
      __$$InvitationDataModelImplCopyWithImpl<_$InvitationDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvitationDataModelImplToJson(
      this,
    );
  }
}

abstract class _InvitationDataModel implements InvitationDataModel {
  const factory _InvitationDataModel(
      {final String? inviteId,
      final String? userId,
      final String? nationalCode,
      final String? mobile,
      final String? email,
      final int? registerType,
      final int? verifyStatus,
      final String? inviteType,
      final String? registerDate}) = _$InvitationDataModelImpl;

  factory _InvitationDataModel.fromJson(Map<String, dynamic> json) =
      _$InvitationDataModelImpl.fromJson;

  @override
  String? get inviteId;
  @override
  String? get userId;
  @override // 邀请注册用户id
  String? get nationalCode;
  @override // 手机号对应的国家区号
  String? get mobile;
  @override // 手机号
  String? get email;
  @override // 邮箱
  int? get registerType;
  @override // 注册方式
  int? get verifyStatus;
  @override // kyc状态: 0 未提交 1 审核中 2 审核通过 3 审核不通过
  String? get inviteType;
  @override // 邀请类型 1 直接邀请 2 简介邀请
  String? get registerDate;
  @override
  @JsonKey(ignore: true)
  _$$InvitationDataModelImplCopyWith<_$InvitationDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
