// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddAddressModel _$AddAddressModelFromJson(Map<String, dynamic> json) {
  return _AddAddressModel.fromJson(json);
}

/// @nodoc
mixin _$AddAddressModel {
  String? get id => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  String? get tokenId => throw _privateConstructorUsedError;
  String? get chainType => throw _privateConstructorUsedError;
  String? get tokenName => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get addressExt => throw _privateConstructorUsedError;
  String? get remark => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddAddressModelCopyWith<AddAddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddAddressModelCopyWith<$Res> {
  factory $AddAddressModelCopyWith(
          AddAddressModel value, $Res Function(AddAddressModel) then) =
      _$AddAddressModelCopyWithImpl<$Res, AddAddressModel>;
  @useResult
  $Res call(
      {String? id,
      String? token,
      String? tokenId,
      String? chainType,
      String? tokenName,
      String? address,
      String? addressExt,
      String? remark});
}

/// @nodoc
class _$AddAddressModelCopyWithImpl<$Res, $Val extends AddAddressModel>
    implements $AddAddressModelCopyWith<$Res> {
  _$AddAddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? token = freezed,
    Object? tokenId = freezed,
    Object? chainType = freezed,
    Object? tokenName = freezed,
    Object? address = freezed,
    Object? addressExt = freezed,
    Object? remark = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenId: freezed == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String?,
      chainType: freezed == chainType
          ? _value.chainType
          : chainType // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenName: freezed == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      addressExt: freezed == addressExt
          ? _value.addressExt
          : addressExt // ignore: cast_nullable_to_non_nullable
              as String?,
      remark: freezed == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddAddressModelImplCopyWith<$Res>
    implements $AddAddressModelCopyWith<$Res> {
  factory _$$AddAddressModelImplCopyWith(_$AddAddressModelImpl value,
          $Res Function(_$AddAddressModelImpl) then) =
      __$$AddAddressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? token,
      String? tokenId,
      String? chainType,
      String? tokenName,
      String? address,
      String? addressExt,
      String? remark});
}

/// @nodoc
class __$$AddAddressModelImplCopyWithImpl<$Res>
    extends _$AddAddressModelCopyWithImpl<$Res, _$AddAddressModelImpl>
    implements _$$AddAddressModelImplCopyWith<$Res> {
  __$$AddAddressModelImplCopyWithImpl(
      _$AddAddressModelImpl _value, $Res Function(_$AddAddressModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? token = freezed,
    Object? tokenId = freezed,
    Object? chainType = freezed,
    Object? tokenName = freezed,
    Object? address = freezed,
    Object? addressExt = freezed,
    Object? remark = freezed,
  }) {
    return _then(_$AddAddressModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenId: freezed == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String?,
      chainType: freezed == chainType
          ? _value.chainType
          : chainType // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenName: freezed == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      addressExt: freezed == addressExt
          ? _value.addressExt
          : addressExt // ignore: cast_nullable_to_non_nullable
              as String?,
      remark: freezed == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddAddressModelImpl
    with DiagnosticableTreeMixin
    implements _AddAddressModel {
  const _$AddAddressModelImpl(
      {this.id,
      this.token,
      this.tokenId,
      this.chainType,
      this.tokenName,
      this.address,
      this.addressExt,
      this.remark});

  factory _$AddAddressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddAddressModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? token;
  @override
  final String? tokenId;
  @override
  final String? chainType;
  @override
  final String? tokenName;
  @override
  final String? address;
  @override
  final String? addressExt;
  @override
  final String? remark;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddAddressModel(id: $id, token: $token, tokenId: $tokenId, chainType: $chainType, tokenName: $tokenName, address: $address, addressExt: $addressExt, remark: $remark)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddAddressModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('tokenId', tokenId))
      ..add(DiagnosticsProperty('chainType', chainType))
      ..add(DiagnosticsProperty('tokenName', tokenName))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('addressExt', addressExt))
      ..add(DiagnosticsProperty('remark', remark));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAddressModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId) &&
            (identical(other.chainType, chainType) ||
                other.chainType == chainType) &&
            (identical(other.tokenName, tokenName) ||
                other.tokenName == tokenName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.addressExt, addressExt) ||
                other.addressExt == addressExt) &&
            (identical(other.remark, remark) || other.remark == remark));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, token, tokenId, chainType,
      tokenName, address, addressExt, remark);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddAddressModelImplCopyWith<_$AddAddressModelImpl> get copyWith =>
      __$$AddAddressModelImplCopyWithImpl<_$AddAddressModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddAddressModelImplToJson(
      this,
    );
  }
}

abstract class _AddAddressModel implements AddAddressModel {
  const factory _AddAddressModel(
      {final String? id,
      final String? token,
      final String? tokenId,
      final String? chainType,
      final String? tokenName,
      final String? address,
      final String? addressExt,
      final String? remark}) = _$AddAddressModelImpl;

  factory _AddAddressModel.fromJson(Map<String, dynamic> json) =
      _$AddAddressModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get token;
  @override
  String? get tokenId;
  @override
  String? get chainType;
  @override
  String? get tokenName;
  @override
  String? get address;
  @override
  String? get addressExt;
  @override
  String? get remark;
  @override
  @JsonKey(ignore: true)
  _$$AddAddressModelImplCopyWith<_$AddAddressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
