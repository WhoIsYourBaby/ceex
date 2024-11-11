// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlaceOrderModel _$PlaceOrderModelFromJson(Map<String, dynamic> json) {
  return _PlaceOrderModel.fromJson(json);
}

/// @nodoc
mixin _$PlaceOrderModel {
  String? get time => throw _privateConstructorUsedError;
  String? get orderId => throw _privateConstructorUsedError;
  String? get accountId => throw _privateConstructorUsedError;
  String? get clientOrderId => throw _privateConstructorUsedError;
  String? get symbolId => throw _privateConstructorUsedError;
  String? get origQty => throw _privateConstructorUsedError; // 下单数量
  String? get executedQty => throw _privateConstructorUsedError;
  String? get executedAmount => throw _privateConstructorUsedError;
  String? get avgPrice => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get side => throw _privateConstructorUsedError;
  List<FeesModel>? get fees => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get exchangeId => throw _privateConstructorUsedError;
  String? get updateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceOrderModelCopyWith<PlaceOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceOrderModelCopyWith<$Res> {
  factory $PlaceOrderModelCopyWith(
          PlaceOrderModel value, $Res Function(PlaceOrderModel) then) =
      _$PlaceOrderModelCopyWithImpl<$Res, PlaceOrderModel>;
  @useResult
  $Res call(
      {String? time,
      String? orderId,
      String? accountId,
      String? clientOrderId,
      String? symbolId,
      String? origQty,
      String? executedQty,
      String? executedAmount,
      String? avgPrice,
      String? type,
      String? side,
      List<FeesModel>? fees,
      String? status,
      String? exchangeId,
      String? updateTime});
}

/// @nodoc
class _$PlaceOrderModelCopyWithImpl<$Res, $Val extends PlaceOrderModel>
    implements $PlaceOrderModelCopyWith<$Res> {
  _$PlaceOrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
    Object? orderId = freezed,
    Object? accountId = freezed,
    Object? clientOrderId = freezed,
    Object? symbolId = freezed,
    Object? origQty = freezed,
    Object? executedQty = freezed,
    Object? executedAmount = freezed,
    Object? avgPrice = freezed,
    Object? type = freezed,
    Object? side = freezed,
    Object? fees = freezed,
    Object? status = freezed,
    Object? exchangeId = freezed,
    Object? updateTime = freezed,
  }) {
    return _then(_value.copyWith(
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String?,
      clientOrderId: freezed == clientOrderId
          ? _value.clientOrderId
          : clientOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      symbolId: freezed == symbolId
          ? _value.symbolId
          : symbolId // ignore: cast_nullable_to_non_nullable
              as String?,
      origQty: freezed == origQty
          ? _value.origQty
          : origQty // ignore: cast_nullable_to_non_nullable
              as String?,
      executedQty: freezed == executedQty
          ? _value.executedQty
          : executedQty // ignore: cast_nullable_to_non_nullable
              as String?,
      executedAmount: freezed == executedAmount
          ? _value.executedAmount
          : executedAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      avgPrice: freezed == avgPrice
          ? _value.avgPrice
          : avgPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      side: freezed == side
          ? _value.side
          : side // ignore: cast_nullable_to_non_nullable
              as String?,
      fees: freezed == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as List<FeesModel>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      exchangeId: freezed == exchangeId
          ? _value.exchangeId
          : exchangeId // ignore: cast_nullable_to_non_nullable
              as String?,
      updateTime: freezed == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceOrderModelImplCopyWith<$Res>
    implements $PlaceOrderModelCopyWith<$Res> {
  factory _$$PlaceOrderModelImplCopyWith(_$PlaceOrderModelImpl value,
          $Res Function(_$PlaceOrderModelImpl) then) =
      __$$PlaceOrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? time,
      String? orderId,
      String? accountId,
      String? clientOrderId,
      String? symbolId,
      String? origQty,
      String? executedQty,
      String? executedAmount,
      String? avgPrice,
      String? type,
      String? side,
      List<FeesModel>? fees,
      String? status,
      String? exchangeId,
      String? updateTime});
}

/// @nodoc
class __$$PlaceOrderModelImplCopyWithImpl<$Res>
    extends _$PlaceOrderModelCopyWithImpl<$Res, _$PlaceOrderModelImpl>
    implements _$$PlaceOrderModelImplCopyWith<$Res> {
  __$$PlaceOrderModelImplCopyWithImpl(
      _$PlaceOrderModelImpl _value, $Res Function(_$PlaceOrderModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
    Object? orderId = freezed,
    Object? accountId = freezed,
    Object? clientOrderId = freezed,
    Object? symbolId = freezed,
    Object? origQty = freezed,
    Object? executedQty = freezed,
    Object? executedAmount = freezed,
    Object? avgPrice = freezed,
    Object? type = freezed,
    Object? side = freezed,
    Object? fees = freezed,
    Object? status = freezed,
    Object? exchangeId = freezed,
    Object? updateTime = freezed,
  }) {
    return _then(_$PlaceOrderModelImpl(
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String?,
      clientOrderId: freezed == clientOrderId
          ? _value.clientOrderId
          : clientOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      symbolId: freezed == symbolId
          ? _value.symbolId
          : symbolId // ignore: cast_nullable_to_non_nullable
              as String?,
      origQty: freezed == origQty
          ? _value.origQty
          : origQty // ignore: cast_nullable_to_non_nullable
              as String?,
      executedQty: freezed == executedQty
          ? _value.executedQty
          : executedQty // ignore: cast_nullable_to_non_nullable
              as String?,
      executedAmount: freezed == executedAmount
          ? _value.executedAmount
          : executedAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      avgPrice: freezed == avgPrice
          ? _value.avgPrice
          : avgPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      side: freezed == side
          ? _value.side
          : side // ignore: cast_nullable_to_non_nullable
              as String?,
      fees: freezed == fees
          ? _value._fees
          : fees // ignore: cast_nullable_to_non_nullable
              as List<FeesModel>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      exchangeId: freezed == exchangeId
          ? _value.exchangeId
          : exchangeId // ignore: cast_nullable_to_non_nullable
              as String?,
      updateTime: freezed == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceOrderModelImpl
    with DiagnosticableTreeMixin
    implements _PlaceOrderModel {
  const _$PlaceOrderModelImpl(
      {this.time,
      this.orderId,
      this.accountId,
      this.clientOrderId,
      this.symbolId,
      this.origQty,
      this.executedQty,
      this.executedAmount,
      this.avgPrice,
      this.type,
      this.side,
      final List<FeesModel>? fees,
      this.status,
      this.exchangeId,
      this.updateTime})
      : _fees = fees;

  factory _$PlaceOrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceOrderModelImplFromJson(json);

  @override
  final String? time;
  @override
  final String? orderId;
  @override
  final String? accountId;
  @override
  final String? clientOrderId;
  @override
  final String? symbolId;
  @override
  final String? origQty;
// 下单数量
  @override
  final String? executedQty;
  @override
  final String? executedAmount;
  @override
  final String? avgPrice;
  @override
  final String? type;
  @override
  final String? side;
  final List<FeesModel>? _fees;
  @override
  List<FeesModel>? get fees {
    final value = _fees;
    if (value == null) return null;
    if (_fees is EqualUnmodifiableListView) return _fees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? status;
  @override
  final String? exchangeId;
  @override
  final String? updateTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlaceOrderModel(time: $time, orderId: $orderId, accountId: $accountId, clientOrderId: $clientOrderId, symbolId: $symbolId, origQty: $origQty, executedQty: $executedQty, executedAmount: $executedAmount, avgPrice: $avgPrice, type: $type, side: $side, fees: $fees, status: $status, exchangeId: $exchangeId, updateTime: $updateTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlaceOrderModel'))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('orderId', orderId))
      ..add(DiagnosticsProperty('accountId', accountId))
      ..add(DiagnosticsProperty('clientOrderId', clientOrderId))
      ..add(DiagnosticsProperty('symbolId', symbolId))
      ..add(DiagnosticsProperty('origQty', origQty))
      ..add(DiagnosticsProperty('executedQty', executedQty))
      ..add(DiagnosticsProperty('executedAmount', executedAmount))
      ..add(DiagnosticsProperty('avgPrice', avgPrice))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('side', side))
      ..add(DiagnosticsProperty('fees', fees))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('exchangeId', exchangeId))
      ..add(DiagnosticsProperty('updateTime', updateTime));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceOrderModelImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.clientOrderId, clientOrderId) ||
                other.clientOrderId == clientOrderId) &&
            (identical(other.symbolId, symbolId) ||
                other.symbolId == symbolId) &&
            (identical(other.origQty, origQty) || other.origQty == origQty) &&
            (identical(other.executedQty, executedQty) ||
                other.executedQty == executedQty) &&
            (identical(other.executedAmount, executedAmount) ||
                other.executedAmount == executedAmount) &&
            (identical(other.avgPrice, avgPrice) ||
                other.avgPrice == avgPrice) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.side, side) || other.side == side) &&
            const DeepCollectionEquality().equals(other._fees, _fees) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.exchangeId, exchangeId) ||
                other.exchangeId == exchangeId) &&
            (identical(other.updateTime, updateTime) ||
                other.updateTime == updateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      time,
      orderId,
      accountId,
      clientOrderId,
      symbolId,
      origQty,
      executedQty,
      executedAmount,
      avgPrice,
      type,
      side,
      const DeepCollectionEquality().hash(_fees),
      status,
      exchangeId,
      updateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceOrderModelImplCopyWith<_$PlaceOrderModelImpl> get copyWith =>
      __$$PlaceOrderModelImplCopyWithImpl<_$PlaceOrderModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceOrderModelImplToJson(
      this,
    );
  }
}

abstract class _PlaceOrderModel implements PlaceOrderModel {
  const factory _PlaceOrderModel(
      {final String? time,
      final String? orderId,
      final String? accountId,
      final String? clientOrderId,
      final String? symbolId,
      final String? origQty,
      final String? executedQty,
      final String? executedAmount,
      final String? avgPrice,
      final String? type,
      final String? side,
      final List<FeesModel>? fees,
      final String? status,
      final String? exchangeId,
      final String? updateTime}) = _$PlaceOrderModelImpl;

  factory _PlaceOrderModel.fromJson(Map<String, dynamic> json) =
      _$PlaceOrderModelImpl.fromJson;

  @override
  String? get time;
  @override
  String? get orderId;
  @override
  String? get accountId;
  @override
  String? get clientOrderId;
  @override
  String? get symbolId;
  @override
  String? get origQty;
  @override // 下单数量
  String? get executedQty;
  @override
  String? get executedAmount;
  @override
  String? get avgPrice;
  @override
  String? get type;
  @override
  String? get side;
  @override
  List<FeesModel>? get fees;
  @override
  String? get status;
  @override
  String? get exchangeId;
  @override
  String? get updateTime;
  @override
  @JsonKey(ignore: true)
  _$$PlaceOrderModelImplCopyWith<_$PlaceOrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
