// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifyModel _$VerifyModelFromJson(Map<String, dynamic> json) {
  return _VerifyModel.fromJson(json);
}

/// @nodoc
mixin _$VerifyModel {
  String? get orderId => throw _privateConstructorUsedError;
  String? get index => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyModelCopyWith<VerifyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyModelCopyWith<$Res> {
  factory $VerifyModelCopyWith(
          VerifyModel value, $Res Function(VerifyModel) then) =
      _$VerifyModelCopyWithImpl<$Res, VerifyModel>;
  @useResult
  $Res call({String? orderId, String? index});
}

/// @nodoc
class _$VerifyModelCopyWithImpl<$Res, $Val extends VerifyModel>
    implements $VerifyModelCopyWith<$Res> {
  _$VerifyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? index = freezed,
  }) {
    return _then(_value.copyWith(
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyModelImplCopyWith<$Res>
    implements $VerifyModelCopyWith<$Res> {
  factory _$$VerifyModelImplCopyWith(
          _$VerifyModelImpl value, $Res Function(_$VerifyModelImpl) then) =
      __$$VerifyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? orderId, String? index});
}

/// @nodoc
class __$$VerifyModelImplCopyWithImpl<$Res>
    extends _$VerifyModelCopyWithImpl<$Res, _$VerifyModelImpl>
    implements _$$VerifyModelImplCopyWith<$Res> {
  __$$VerifyModelImplCopyWithImpl(
      _$VerifyModelImpl _value, $Res Function(_$VerifyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? index = freezed,
  }) {
    return _then(_$VerifyModelImpl(
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyModelImpl implements _VerifyModel {
  const _$VerifyModelImpl({this.orderId, this.index});

  factory _$VerifyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyModelImplFromJson(json);

  @override
  final String? orderId;
  @override
  final String? index;

  @override
  String toString() {
    return 'VerifyModel(orderId: $orderId, index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyModelImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.index, index) || other.index == index));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyModelImplCopyWith<_$VerifyModelImpl> get copyWith =>
      __$$VerifyModelImplCopyWithImpl<_$VerifyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyModelImplToJson(
      this,
    );
  }
}

abstract class _VerifyModel implements VerifyModel {
  const factory _VerifyModel({final String? orderId, final String? index}) =
      _$VerifyModelImpl;

  factory _VerifyModel.fromJson(Map<String, dynamic> json) =
      _$VerifyModelImpl.fromJson;

  @override
  String? get orderId;
  @override
  String? get index;
  @override
  @JsonKey(ignore: true)
  _$$VerifyModelImplCopyWith<_$VerifyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
