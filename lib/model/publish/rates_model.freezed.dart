// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rates_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RatesModel _$RatesModelFromJson(Map<String, dynamic> json) {
  return _RatesModel.fromJson(json);
}

/// @nodoc
mixin _$RatesModel {
  int get code => throw _privateConstructorUsedError;
  List<DataModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RatesModelCopyWith<RatesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatesModelCopyWith<$Res> {
  factory $RatesModelCopyWith(
          RatesModel value, $Res Function(RatesModel) then) =
      _$RatesModelCopyWithImpl<$Res, RatesModel>;
  @useResult
  $Res call({int code, List<DataModel> data});
}

/// @nodoc
class _$RatesModelCopyWithImpl<$Res, $Val extends RatesModel>
    implements $RatesModelCopyWith<$Res> {
  _$RatesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RatesModelImplCopyWith<$Res>
    implements $RatesModelCopyWith<$Res> {
  factory _$$RatesModelImplCopyWith(
          _$RatesModelImpl value, $Res Function(_$RatesModelImpl) then) =
      __$$RatesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int code, List<DataModel> data});
}

/// @nodoc
class __$$RatesModelImplCopyWithImpl<$Res>
    extends _$RatesModelCopyWithImpl<$Res, _$RatesModelImpl>
    implements _$$RatesModelImplCopyWith<$Res> {
  __$$RatesModelImplCopyWithImpl(
      _$RatesModelImpl _value, $Res Function(_$RatesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? data = null,
  }) {
    return _then(_$RatesModelImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RatesModelImpl implements _RatesModel {
  const _$RatesModelImpl(
      {required this.code, required final List<DataModel> data})
      : _data = data;

  factory _$RatesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatesModelImplFromJson(json);

  @override
  final int code;
  final List<DataModel> _data;
  @override
  List<DataModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'RatesModel(code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatesModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RatesModelImplCopyWith<_$RatesModelImpl> get copyWith =>
      __$$RatesModelImplCopyWithImpl<_$RatesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RatesModelImplToJson(
      this,
    );
  }
}

abstract class _RatesModel implements RatesModel {
  const factory _RatesModel(
      {required final int code,
      required final List<DataModel> data}) = _$RatesModelImpl;

  factory _RatesModel.fromJson(Map<String, dynamic> json) =
      _$RatesModelImpl.fromJson;

  @override
  int get code;
  @override
  List<DataModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$RatesModelImplCopyWith<_$RatesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataModel _$DataModelFromJson(Map<String, dynamic> json) {
  return _DataModel.fromJson(json);
}

/// @nodoc
mixin _$DataModel {
  String get token => throw _privateConstructorUsedError;
  RatesDataModel get rates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataModelCopyWith<DataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataModelCopyWith<$Res> {
  factory $DataModelCopyWith(DataModel value, $Res Function(DataModel) then) =
      _$DataModelCopyWithImpl<$Res, DataModel>;
  @useResult
  $Res call({String token, RatesDataModel rates});

  $RatesDataModelCopyWith<$Res> get rates;
}

/// @nodoc
class _$DataModelCopyWithImpl<$Res, $Val extends DataModel>
    implements $DataModelCopyWith<$Res> {
  _$DataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? rates = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      rates: null == rates
          ? _value.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as RatesDataModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RatesDataModelCopyWith<$Res> get rates {
    return $RatesDataModelCopyWith<$Res>(_value.rates, (value) {
      return _then(_value.copyWith(rates: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataModelImplCopyWith<$Res>
    implements $DataModelCopyWith<$Res> {
  factory _$$DataModelImplCopyWith(
          _$DataModelImpl value, $Res Function(_$DataModelImpl) then) =
      __$$DataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, RatesDataModel rates});

  @override
  $RatesDataModelCopyWith<$Res> get rates;
}

/// @nodoc
class __$$DataModelImplCopyWithImpl<$Res>
    extends _$DataModelCopyWithImpl<$Res, _$DataModelImpl>
    implements _$$DataModelImplCopyWith<$Res> {
  __$$DataModelImplCopyWithImpl(
      _$DataModelImpl _value, $Res Function(_$DataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? rates = null,
  }) {
    return _then(_$DataModelImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      rates: null == rates
          ? _value.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as RatesDataModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataModelImpl implements _DataModel {
  const _$DataModelImpl({required this.token, required this.rates});

  factory _$DataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataModelImplFromJson(json);

  @override
  final String token;
  @override
  final RatesDataModel rates;

  @override
  String toString() {
    return 'DataModel(token: $token, rates: $rates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataModelImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.rates, rates) || other.rates == rates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, rates);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataModelImplCopyWith<_$DataModelImpl> get copyWith =>
      __$$DataModelImplCopyWithImpl<_$DataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataModelImplToJson(
      this,
    );
  }
}

abstract class _DataModel implements DataModel {
  const factory _DataModel(
      {required final String token,
      required final RatesDataModel rates}) = _$DataModelImpl;

  factory _DataModel.fromJson(Map<String, dynamic> json) =
      _$DataModelImpl.fromJson;

  @override
  String get token;
  @override
  RatesDataModel get rates;
  @override
  @JsonKey(ignore: true)
  _$$DataModelImplCopyWith<_$DataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RatesDataModel _$RatesDataModelFromJson(Map<String, dynamic> json) {
  return _RatesDataModel.fromJson(json);
}

/// @nodoc
mixin _$RatesDataModel {
  String get CNY => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RatesDataModelCopyWith<RatesDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatesDataModelCopyWith<$Res> {
  factory $RatesDataModelCopyWith(
          RatesDataModel value, $Res Function(RatesDataModel) then) =
      _$RatesDataModelCopyWithImpl<$Res, RatesDataModel>;
  @useResult
  $Res call({String CNY});
}

/// @nodoc
class _$RatesDataModelCopyWithImpl<$Res, $Val extends RatesDataModel>
    implements $RatesDataModelCopyWith<$Res> {
  _$RatesDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? CNY = null,
  }) {
    return _then(_value.copyWith(
      CNY: null == CNY
          ? _value.CNY
          : CNY // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RatesDataModelImplCopyWith<$Res>
    implements $RatesDataModelCopyWith<$Res> {
  factory _$$RatesDataModelImplCopyWith(_$RatesDataModelImpl value,
          $Res Function(_$RatesDataModelImpl) then) =
      __$$RatesDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String CNY});
}

/// @nodoc
class __$$RatesDataModelImplCopyWithImpl<$Res>
    extends _$RatesDataModelCopyWithImpl<$Res, _$RatesDataModelImpl>
    implements _$$RatesDataModelImplCopyWith<$Res> {
  __$$RatesDataModelImplCopyWithImpl(
      _$RatesDataModelImpl _value, $Res Function(_$RatesDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? CNY = null,
  }) {
    return _then(_$RatesDataModelImpl(
      CNY: null == CNY
          ? _value.CNY
          : CNY // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RatesDataModelImpl implements _RatesDataModel {
  const _$RatesDataModelImpl({required this.CNY});

  factory _$RatesDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatesDataModelImplFromJson(json);

  @override
  final String CNY;

  @override
  String toString() {
    return 'RatesDataModel(CNY: $CNY)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatesDataModelImpl &&
            (identical(other.CNY, CNY) || other.CNY == CNY));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, CNY);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RatesDataModelImplCopyWith<_$RatesDataModelImpl> get copyWith =>
      __$$RatesDataModelImplCopyWithImpl<_$RatesDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RatesDataModelImplToJson(
      this,
    );
  }
}

abstract class _RatesDataModel implements RatesDataModel {
  const factory _RatesDataModel({required final String CNY}) =
      _$RatesDataModelImpl;

  factory _RatesDataModel.fromJson(Map<String, dynamic> json) =
      _$RatesDataModelImpl.fromJson;

  @override
  String get CNY;
  @override
  @JsonKey(ignore: true)
  _$$RatesDataModelImplCopyWith<_$RatesDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
