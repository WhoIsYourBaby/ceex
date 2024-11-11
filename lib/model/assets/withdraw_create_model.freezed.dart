// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'withdraw_create_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WithdrawCreateModel _$WithdrawCreateModelFromJson(Map<String, dynamic> json) {
  return _WithdrawCreateModel.fromJson(json);
}

/// @nodoc
mixin _$WithdrawCreateModel {
  String? get requestId => throw _privateConstructorUsedError;
  bool? get addressIsUserId => throw _privateConstructorUsedError;
  String? get codeOrderId => throw _privateConstructorUsedError;
  String? get timeLeft => throw _privateConstructorUsedError;
  bool? get needCheckIdCardNo => throw _privateConstructorUsedError;
  bool? get allowWithdraw => throw _privateConstructorUsedError;
  String? get refuseReason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WithdrawCreateModelCopyWith<WithdrawCreateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WithdrawCreateModelCopyWith<$Res> {
  factory $WithdrawCreateModelCopyWith(
          WithdrawCreateModel value, $Res Function(WithdrawCreateModel) then) =
      _$WithdrawCreateModelCopyWithImpl<$Res, WithdrawCreateModel>;
  @useResult
  $Res call(
      {String? requestId,
      bool? addressIsUserId,
      String? codeOrderId,
      String? timeLeft,
      bool? needCheckIdCardNo,
      bool? allowWithdraw,
      String? refuseReason});
}

/// @nodoc
class _$WithdrawCreateModelCopyWithImpl<$Res, $Val extends WithdrawCreateModel>
    implements $WithdrawCreateModelCopyWith<$Res> {
  _$WithdrawCreateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? addressIsUserId = freezed,
    Object? codeOrderId = freezed,
    Object? timeLeft = freezed,
    Object? needCheckIdCardNo = freezed,
    Object? allowWithdraw = freezed,
    Object? refuseReason = freezed,
  }) {
    return _then(_value.copyWith(
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      addressIsUserId: freezed == addressIsUserId
          ? _value.addressIsUserId
          : addressIsUserId // ignore: cast_nullable_to_non_nullable
              as bool?,
      codeOrderId: freezed == codeOrderId
          ? _value.codeOrderId
          : codeOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      timeLeft: freezed == timeLeft
          ? _value.timeLeft
          : timeLeft // ignore: cast_nullable_to_non_nullable
              as String?,
      needCheckIdCardNo: freezed == needCheckIdCardNo
          ? _value.needCheckIdCardNo
          : needCheckIdCardNo // ignore: cast_nullable_to_non_nullable
              as bool?,
      allowWithdraw: freezed == allowWithdraw
          ? _value.allowWithdraw
          : allowWithdraw // ignore: cast_nullable_to_non_nullable
              as bool?,
      refuseReason: freezed == refuseReason
          ? _value.refuseReason
          : refuseReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WithdrawCreateModelImplCopyWith<$Res>
    implements $WithdrawCreateModelCopyWith<$Res> {
  factory _$$WithdrawCreateModelImplCopyWith(_$WithdrawCreateModelImpl value,
          $Res Function(_$WithdrawCreateModelImpl) then) =
      __$$WithdrawCreateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? requestId,
      bool? addressIsUserId,
      String? codeOrderId,
      String? timeLeft,
      bool? needCheckIdCardNo,
      bool? allowWithdraw,
      String? refuseReason});
}

/// @nodoc
class __$$WithdrawCreateModelImplCopyWithImpl<$Res>
    extends _$WithdrawCreateModelCopyWithImpl<$Res, _$WithdrawCreateModelImpl>
    implements _$$WithdrawCreateModelImplCopyWith<$Res> {
  __$$WithdrawCreateModelImplCopyWithImpl(_$WithdrawCreateModelImpl _value,
      $Res Function(_$WithdrawCreateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? addressIsUserId = freezed,
    Object? codeOrderId = freezed,
    Object? timeLeft = freezed,
    Object? needCheckIdCardNo = freezed,
    Object? allowWithdraw = freezed,
    Object? refuseReason = freezed,
  }) {
    return _then(_$WithdrawCreateModelImpl(
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      addressIsUserId: freezed == addressIsUserId
          ? _value.addressIsUserId
          : addressIsUserId // ignore: cast_nullable_to_non_nullable
              as bool?,
      codeOrderId: freezed == codeOrderId
          ? _value.codeOrderId
          : codeOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      timeLeft: freezed == timeLeft
          ? _value.timeLeft
          : timeLeft // ignore: cast_nullable_to_non_nullable
              as String?,
      needCheckIdCardNo: freezed == needCheckIdCardNo
          ? _value.needCheckIdCardNo
          : needCheckIdCardNo // ignore: cast_nullable_to_non_nullable
              as bool?,
      allowWithdraw: freezed == allowWithdraw
          ? _value.allowWithdraw
          : allowWithdraw // ignore: cast_nullable_to_non_nullable
              as bool?,
      refuseReason: freezed == refuseReason
          ? _value.refuseReason
          : refuseReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WithdrawCreateModelImpl
    with DiagnosticableTreeMixin
    implements _WithdrawCreateModel {
  const _$WithdrawCreateModelImpl(
      {this.requestId,
      this.addressIsUserId,
      this.codeOrderId,
      this.timeLeft,
      this.needCheckIdCardNo,
      this.allowWithdraw,
      this.refuseReason});

  factory _$WithdrawCreateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WithdrawCreateModelImplFromJson(json);

  @override
  final String? requestId;
  @override
  final bool? addressIsUserId;
  @override
  final String? codeOrderId;
  @override
  final String? timeLeft;
  @override
  final bool? needCheckIdCardNo;
  @override
  final bool? allowWithdraw;
  @override
  final String? refuseReason;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WithdrawCreateModel(requestId: $requestId, addressIsUserId: $addressIsUserId, codeOrderId: $codeOrderId, timeLeft: $timeLeft, needCheckIdCardNo: $needCheckIdCardNo, allowWithdraw: $allowWithdraw, refuseReason: $refuseReason)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WithdrawCreateModel'))
      ..add(DiagnosticsProperty('requestId', requestId))
      ..add(DiagnosticsProperty('addressIsUserId', addressIsUserId))
      ..add(DiagnosticsProperty('codeOrderId', codeOrderId))
      ..add(DiagnosticsProperty('timeLeft', timeLeft))
      ..add(DiagnosticsProperty('needCheckIdCardNo', needCheckIdCardNo))
      ..add(DiagnosticsProperty('allowWithdraw', allowWithdraw))
      ..add(DiagnosticsProperty('refuseReason', refuseReason));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WithdrawCreateModelImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.addressIsUserId, addressIsUserId) ||
                other.addressIsUserId == addressIsUserId) &&
            (identical(other.codeOrderId, codeOrderId) ||
                other.codeOrderId == codeOrderId) &&
            (identical(other.timeLeft, timeLeft) ||
                other.timeLeft == timeLeft) &&
            (identical(other.needCheckIdCardNo, needCheckIdCardNo) ||
                other.needCheckIdCardNo == needCheckIdCardNo) &&
            (identical(other.allowWithdraw, allowWithdraw) ||
                other.allowWithdraw == allowWithdraw) &&
            (identical(other.refuseReason, refuseReason) ||
                other.refuseReason == refuseReason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, requestId, addressIsUserId,
      codeOrderId, timeLeft, needCheckIdCardNo, allowWithdraw, refuseReason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WithdrawCreateModelImplCopyWith<_$WithdrawCreateModelImpl> get copyWith =>
      __$$WithdrawCreateModelImplCopyWithImpl<_$WithdrawCreateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WithdrawCreateModelImplToJson(
      this,
    );
  }
}

abstract class _WithdrawCreateModel implements WithdrawCreateModel {
  const factory _WithdrawCreateModel(
      {final String? requestId,
      final bool? addressIsUserId,
      final String? codeOrderId,
      final String? timeLeft,
      final bool? needCheckIdCardNo,
      final bool? allowWithdraw,
      final String? refuseReason}) = _$WithdrawCreateModelImpl;

  factory _WithdrawCreateModel.fromJson(Map<String, dynamic> json) =
      _$WithdrawCreateModelImpl.fromJson;

  @override
  String? get requestId;
  @override
  bool? get addressIsUserId;
  @override
  String? get codeOrderId;
  @override
  String? get timeLeft;
  @override
  bool? get needCheckIdCardNo;
  @override
  bool? get allowWithdraw;
  @override
  String? get refuseReason;
  @override
  @JsonKey(ignore: true)
  _$$WithdrawCreateModelImplCopyWith<_$WithdrawCreateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
