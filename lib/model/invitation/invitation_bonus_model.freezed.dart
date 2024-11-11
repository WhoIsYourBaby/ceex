// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invitation_bonus_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvitationBonusModel _$InvitationBonusModelFromJson(Map<String, dynamic> json) {
  return _InvitationBonusModel.fromJson(json);
}

/// @nodoc
mixin _$InvitationBonusModel {
  double? get totalBonusCoins => throw _privateConstructorUsedError;
  double? get totalBonusPoints => throw _privateConstructorUsedError;
  List<RecordListModel>? get recordList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvitationBonusModelCopyWith<InvitationBonusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationBonusModelCopyWith<$Res> {
  factory $InvitationBonusModelCopyWith(InvitationBonusModel value,
          $Res Function(InvitationBonusModel) then) =
      _$InvitationBonusModelCopyWithImpl<$Res, InvitationBonusModel>;
  @useResult
  $Res call(
      {double? totalBonusCoins,
      double? totalBonusPoints,
      List<RecordListModel>? recordList});
}

/// @nodoc
class _$InvitationBonusModelCopyWithImpl<$Res,
        $Val extends InvitationBonusModel>
    implements $InvitationBonusModelCopyWith<$Res> {
  _$InvitationBonusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBonusCoins = freezed,
    Object? totalBonusPoints = freezed,
    Object? recordList = freezed,
  }) {
    return _then(_value.copyWith(
      totalBonusCoins: freezed == totalBonusCoins
          ? _value.totalBonusCoins
          : totalBonusCoins // ignore: cast_nullable_to_non_nullable
              as double?,
      totalBonusPoints: freezed == totalBonusPoints
          ? _value.totalBonusPoints
          : totalBonusPoints // ignore: cast_nullable_to_non_nullable
              as double?,
      recordList: freezed == recordList
          ? _value.recordList
          : recordList // ignore: cast_nullable_to_non_nullable
              as List<RecordListModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvitationBonusModelImplCopyWith<$Res>
    implements $InvitationBonusModelCopyWith<$Res> {
  factory _$$InvitationBonusModelImplCopyWith(_$InvitationBonusModelImpl value,
          $Res Function(_$InvitationBonusModelImpl) then) =
      __$$InvitationBonusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? totalBonusCoins,
      double? totalBonusPoints,
      List<RecordListModel>? recordList});
}

/// @nodoc
class __$$InvitationBonusModelImplCopyWithImpl<$Res>
    extends _$InvitationBonusModelCopyWithImpl<$Res, _$InvitationBonusModelImpl>
    implements _$$InvitationBonusModelImplCopyWith<$Res> {
  __$$InvitationBonusModelImplCopyWithImpl(_$InvitationBonusModelImpl _value,
      $Res Function(_$InvitationBonusModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBonusCoins = freezed,
    Object? totalBonusPoints = freezed,
    Object? recordList = freezed,
  }) {
    return _then(_$InvitationBonusModelImpl(
      totalBonusCoins: freezed == totalBonusCoins
          ? _value.totalBonusCoins
          : totalBonusCoins // ignore: cast_nullable_to_non_nullable
              as double?,
      totalBonusPoints: freezed == totalBonusPoints
          ? _value.totalBonusPoints
          : totalBonusPoints // ignore: cast_nullable_to_non_nullable
              as double?,
      recordList: freezed == recordList
          ? _value._recordList
          : recordList // ignore: cast_nullable_to_non_nullable
              as List<RecordListModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvitationBonusModelImpl implements _InvitationBonusModel {
  const _$InvitationBonusModelImpl(
      {this.totalBonusCoins,
      this.totalBonusPoints,
      final List<RecordListModel>? recordList})
      : _recordList = recordList;

  factory _$InvitationBonusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvitationBonusModelImplFromJson(json);

  @override
  final double? totalBonusCoins;
  @override
  final double? totalBonusPoints;
  final List<RecordListModel>? _recordList;
  @override
  List<RecordListModel>? get recordList {
    final value = _recordList;
    if (value == null) return null;
    if (_recordList is EqualUnmodifiableListView) return _recordList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'InvitationBonusModel(totalBonusCoins: $totalBonusCoins, totalBonusPoints: $totalBonusPoints, recordList: $recordList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvitationBonusModelImpl &&
            (identical(other.totalBonusCoins, totalBonusCoins) ||
                other.totalBonusCoins == totalBonusCoins) &&
            (identical(other.totalBonusPoints, totalBonusPoints) ||
                other.totalBonusPoints == totalBonusPoints) &&
            const DeepCollectionEquality()
                .equals(other._recordList, _recordList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalBonusCoins,
      totalBonusPoints, const DeepCollectionEquality().hash(_recordList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvitationBonusModelImplCopyWith<_$InvitationBonusModelImpl>
      get copyWith =>
          __$$InvitationBonusModelImplCopyWithImpl<_$InvitationBonusModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvitationBonusModelImplToJson(
      this,
    );
  }
}

abstract class _InvitationBonusModel implements InvitationBonusModel {
  const factory _InvitationBonusModel(
      {final double? totalBonusCoins,
      final double? totalBonusPoints,
      final List<RecordListModel>? recordList}) = _$InvitationBonusModelImpl;

  factory _InvitationBonusModel.fromJson(Map<String, dynamic> json) =
      _$InvitationBonusModelImpl.fromJson;

  @override
  double? get totalBonusCoins;
  @override
  double? get totalBonusPoints;
  @override
  List<RecordListModel>? get recordList;
  @override
  @JsonKey(ignore: true)
  _$$InvitationBonusModelImplCopyWith<_$InvitationBonusModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RecordListModel _$RecordListModelFromJson(Map<String, dynamic> json) {
  return _RecordListModel.fromJson(json);
}

/// @nodoc
mixin _$RecordListModel {
  String? get id => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError; // 邀请注册用户id
  String? get token => throw _privateConstructorUsedError; // 币种
  int? get bonusAmount => throw _privateConstructorUsedError; //数量
  String? get statisticsTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecordListModelCopyWith<RecordListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordListModelCopyWith<$Res> {
  factory $RecordListModelCopyWith(
          RecordListModel value, $Res Function(RecordListModel) then) =
      _$RecordListModelCopyWithImpl<$Res, RecordListModel>;
  @useResult
  $Res call(
      {String? id,
      String? userId,
      String? token,
      int? bonusAmount,
      String? statisticsTime});
}

/// @nodoc
class _$RecordListModelCopyWithImpl<$Res, $Val extends RecordListModel>
    implements $RecordListModelCopyWith<$Res> {
  _$RecordListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? token = freezed,
    Object? bonusAmount = freezed,
    Object? statisticsTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      bonusAmount: freezed == bonusAmount
          ? _value.bonusAmount
          : bonusAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      statisticsTime: freezed == statisticsTime
          ? _value.statisticsTime
          : statisticsTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecordListModelImplCopyWith<$Res>
    implements $RecordListModelCopyWith<$Res> {
  factory _$$RecordListModelImplCopyWith(_$RecordListModelImpl value,
          $Res Function(_$RecordListModelImpl) then) =
      __$$RecordListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? userId,
      String? token,
      int? bonusAmount,
      String? statisticsTime});
}

/// @nodoc
class __$$RecordListModelImplCopyWithImpl<$Res>
    extends _$RecordListModelCopyWithImpl<$Res, _$RecordListModelImpl>
    implements _$$RecordListModelImplCopyWith<$Res> {
  __$$RecordListModelImplCopyWithImpl(
      _$RecordListModelImpl _value, $Res Function(_$RecordListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? token = freezed,
    Object? bonusAmount = freezed,
    Object? statisticsTime = freezed,
  }) {
    return _then(_$RecordListModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      bonusAmount: freezed == bonusAmount
          ? _value.bonusAmount
          : bonusAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      statisticsTime: freezed == statisticsTime
          ? _value.statisticsTime
          : statisticsTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecordListModelImpl implements _RecordListModel {
  const _$RecordListModelImpl(
      {this.id,
      this.userId,
      this.token,
      this.bonusAmount,
      this.statisticsTime});

  factory _$RecordListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecordListModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? userId;
// 邀请注册用户id
  @override
  final String? token;
// 币种
  @override
  final int? bonusAmount;
//数量
  @override
  final String? statisticsTime;

  @override
  String toString() {
    return 'RecordListModel(id: $id, userId: $userId, token: $token, bonusAmount: $bonusAmount, statisticsTime: $statisticsTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordListModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.bonusAmount, bonusAmount) ||
                other.bonusAmount == bonusAmount) &&
            (identical(other.statisticsTime, statisticsTime) ||
                other.statisticsTime == statisticsTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, token, bonusAmount, statisticsTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordListModelImplCopyWith<_$RecordListModelImpl> get copyWith =>
      __$$RecordListModelImplCopyWithImpl<_$RecordListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecordListModelImplToJson(
      this,
    );
  }
}

abstract class _RecordListModel implements RecordListModel {
  const factory _RecordListModel(
      {final String? id,
      final String? userId,
      final String? token,
      final int? bonusAmount,
      final String? statisticsTime}) = _$RecordListModelImpl;

  factory _RecordListModel.fromJson(Map<String, dynamic> json) =
      _$RecordListModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get userId;
  @override // 邀请注册用户id
  String? get token;
  @override // 币种
  int? get bonusAmount;
  @override //数量
  String? get statisticsTime;
  @override
  @JsonKey(ignore: true)
  _$$RecordListModelImplCopyWith<_$RecordListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
