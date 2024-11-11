// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RateModel _$RateModelFromJson(Map<String, dynamic> json) {
  return _RateModel.fromJson(json);
}

/// @nodoc
mixin _$RateModel {
  String? get token => throw _privateConstructorUsedError;
  RateMoneyModel? get rates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RateModelCopyWith<RateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateModelCopyWith<$Res> {
  factory $RateModelCopyWith(RateModel value, $Res Function(RateModel) then) =
      _$RateModelCopyWithImpl<$Res, RateModel>;
  @useResult
  $Res call({String? token, RateMoneyModel? rates});

  $RateMoneyModelCopyWith<$Res>? get rates;
}

/// @nodoc
class _$RateModelCopyWithImpl<$Res, $Val extends RateModel>
    implements $RateModelCopyWith<$Res> {
  _$RateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? rates = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      rates: freezed == rates
          ? _value.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as RateMoneyModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RateMoneyModelCopyWith<$Res>? get rates {
    if (_value.rates == null) {
      return null;
    }

    return $RateMoneyModelCopyWith<$Res>(_value.rates!, (value) {
      return _then(_value.copyWith(rates: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RateModelImplCopyWith<$Res>
    implements $RateModelCopyWith<$Res> {
  factory _$$RateModelImplCopyWith(
          _$RateModelImpl value, $Res Function(_$RateModelImpl) then) =
      __$$RateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? token, RateMoneyModel? rates});

  @override
  $RateMoneyModelCopyWith<$Res>? get rates;
}

/// @nodoc
class __$$RateModelImplCopyWithImpl<$Res>
    extends _$RateModelCopyWithImpl<$Res, _$RateModelImpl>
    implements _$$RateModelImplCopyWith<$Res> {
  __$$RateModelImplCopyWithImpl(
      _$RateModelImpl _value, $Res Function(_$RateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? rates = freezed,
  }) {
    return _then(_$RateModelImpl(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      rates: freezed == rates
          ? _value.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as RateMoneyModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RateModelImpl extends _RateModel with DiagnosticableTreeMixin {
  const _$RateModelImpl({this.token, this.rates}) : super._();

  factory _$RateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RateModelImplFromJson(json);

  @override
  final String? token;
  @override
  final RateMoneyModel? rates;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RateModel(token: $token, rates: $rates)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RateModel'))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('rates', rates));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RateModelImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.rates, rates) || other.rates == rates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, rates);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RateModelImplCopyWith<_$RateModelImpl> get copyWith =>
      __$$RateModelImplCopyWithImpl<_$RateModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RateModelImplToJson(
      this,
    );
  }
}

abstract class _RateModel extends RateModel {
  const factory _RateModel({final String? token, final RateMoneyModel? rates}) =
      _$RateModelImpl;
  const _RateModel._() : super._();

  factory _RateModel.fromJson(Map<String, dynamic> json) =
      _$RateModelImpl.fromJson;

  @override
  String? get token;
  @override
  RateMoneyModel? get rates;
  @override
  @JsonKey(ignore: true)
  _$$RateModelImplCopyWith<_$RateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RateMoneyModel _$RateMoneyModelFromJson(Map<String, dynamic> json) {
  return _RateMoneyModel.fromJson(json);
}

/// @nodoc
mixin _$RateMoneyModel {
  String? get BTC => throw _privateConstructorUsedError;
  String? get USD => throw _privateConstructorUsedError;
  String? get USDT => throw _privateConstructorUsedError;
  String? get CNY => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RateMoneyModelCopyWith<RateMoneyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateMoneyModelCopyWith<$Res> {
  factory $RateMoneyModelCopyWith(
          RateMoneyModel value, $Res Function(RateMoneyModel) then) =
      _$RateMoneyModelCopyWithImpl<$Res, RateMoneyModel>;
  @useResult
  $Res call({String? BTC, String? USD, String? USDT, String? CNY});
}

/// @nodoc
class _$RateMoneyModelCopyWithImpl<$Res, $Val extends RateMoneyModel>
    implements $RateMoneyModelCopyWith<$Res> {
  _$RateMoneyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? BTC = freezed,
    Object? USD = freezed,
    Object? USDT = freezed,
    Object? CNY = freezed,
  }) {
    return _then(_value.copyWith(
      BTC: freezed == BTC
          ? _value.BTC
          : BTC // ignore: cast_nullable_to_non_nullable
              as String?,
      USD: freezed == USD
          ? _value.USD
          : USD // ignore: cast_nullable_to_non_nullable
              as String?,
      USDT: freezed == USDT
          ? _value.USDT
          : USDT // ignore: cast_nullable_to_non_nullable
              as String?,
      CNY: freezed == CNY
          ? _value.CNY
          : CNY // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RateMoneyModelImplCopyWith<$Res>
    implements $RateMoneyModelCopyWith<$Res> {
  factory _$$RateMoneyModelImplCopyWith(_$RateMoneyModelImpl value,
          $Res Function(_$RateMoneyModelImpl) then) =
      __$$RateMoneyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? BTC, String? USD, String? USDT, String? CNY});
}

/// @nodoc
class __$$RateMoneyModelImplCopyWithImpl<$Res>
    extends _$RateMoneyModelCopyWithImpl<$Res, _$RateMoneyModelImpl>
    implements _$$RateMoneyModelImplCopyWith<$Res> {
  __$$RateMoneyModelImplCopyWithImpl(
      _$RateMoneyModelImpl _value, $Res Function(_$RateMoneyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? BTC = freezed,
    Object? USD = freezed,
    Object? USDT = freezed,
    Object? CNY = freezed,
  }) {
    return _then(_$RateMoneyModelImpl(
      BTC: freezed == BTC
          ? _value.BTC
          : BTC // ignore: cast_nullable_to_non_nullable
              as String?,
      USD: freezed == USD
          ? _value.USD
          : USD // ignore: cast_nullable_to_non_nullable
              as String?,
      USDT: freezed == USDT
          ? _value.USDT
          : USDT // ignore: cast_nullable_to_non_nullable
              as String?,
      CNY: freezed == CNY
          ? _value.CNY
          : CNY // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RateMoneyModelImpl
    with DiagnosticableTreeMixin
    implements _RateMoneyModel {
  const _$RateMoneyModelImpl({this.BTC, this.USD, this.USDT, this.CNY});

  factory _$RateMoneyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RateMoneyModelImplFromJson(json);

  @override
  final String? BTC;
  @override
  final String? USD;
  @override
  final String? USDT;
  @override
  final String? CNY;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RateMoneyModel(BTC: $BTC, USD: $USD, USDT: $USDT, CNY: $CNY)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RateMoneyModel'))
      ..add(DiagnosticsProperty('BTC', BTC))
      ..add(DiagnosticsProperty('USD', USD))
      ..add(DiagnosticsProperty('USDT', USDT))
      ..add(DiagnosticsProperty('CNY', CNY));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RateMoneyModelImpl &&
            (identical(other.BTC, BTC) || other.BTC == BTC) &&
            (identical(other.USD, USD) || other.USD == USD) &&
            (identical(other.USDT, USDT) || other.USDT == USDT) &&
            (identical(other.CNY, CNY) || other.CNY == CNY));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, BTC, USD, USDT, CNY);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RateMoneyModelImplCopyWith<_$RateMoneyModelImpl> get copyWith =>
      __$$RateMoneyModelImplCopyWithImpl<_$RateMoneyModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RateMoneyModelImplToJson(
      this,
    );
  }
}

abstract class _RateMoneyModel implements RateMoneyModel {
  const factory _RateMoneyModel(
      {final String? BTC,
      final String? USD,
      final String? USDT,
      final String? CNY}) = _$RateMoneyModelImpl;

  factory _RateMoneyModel.fromJson(Map<String, dynamic> json) =
      _$RateMoneyModelImpl.fromJson;

  @override
  String? get BTC;
  @override
  String? get USD;
  @override
  String? get USDT;
  @override
  String? get CNY;
  @override
  @JsonKey(ignore: true)
  _$$RateMoneyModelImplCopyWith<_$RateMoneyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
