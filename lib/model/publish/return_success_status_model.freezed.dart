// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_success_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReturnSuccessStatusModel _$ReturnSuccessStatusModelFromJson(
    Map<String, dynamic> json) {
  return _RatesModel.fromJson(json);
}

/// @nodoc
mixin _$ReturnSuccessStatusModel {
  bool get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnSuccessStatusModelCopyWith<ReturnSuccessStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnSuccessStatusModelCopyWith<$Res> {
  factory $ReturnSuccessStatusModelCopyWith(ReturnSuccessStatusModel value,
          $Res Function(ReturnSuccessStatusModel) then) =
      _$ReturnSuccessStatusModelCopyWithImpl<$Res, ReturnSuccessStatusModel>;
  @useResult
  $Res call({bool success});
}

/// @nodoc
class _$ReturnSuccessStatusModelCopyWithImpl<$Res,
        $Val extends ReturnSuccessStatusModel>
    implements $ReturnSuccessStatusModelCopyWith<$Res> {
  _$ReturnSuccessStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RatesModelImplCopyWith<$Res>
    implements $ReturnSuccessStatusModelCopyWith<$Res> {
  factory _$$RatesModelImplCopyWith(
          _$RatesModelImpl value, $Res Function(_$RatesModelImpl) then) =
      __$$RatesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success});
}

/// @nodoc
class __$$RatesModelImplCopyWithImpl<$Res>
    extends _$ReturnSuccessStatusModelCopyWithImpl<$Res, _$RatesModelImpl>
    implements _$$RatesModelImplCopyWith<$Res> {
  __$$RatesModelImplCopyWithImpl(
      _$RatesModelImpl _value, $Res Function(_$RatesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
  }) {
    return _then(_$RatesModelImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RatesModelImpl implements _RatesModel {
  const _$RatesModelImpl({required this.success});

  factory _$RatesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatesModelImplFromJson(json);

  @override
  final bool success;

  @override
  String toString() {
    return 'ReturnSuccessStatusModel(success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatesModelImpl &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success);

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

abstract class _RatesModel implements ReturnSuccessStatusModel {
  const factory _RatesModel({required final bool success}) = _$RatesModelImpl;

  factory _RatesModel.fromJson(Map<String, dynamic> json) =
      _$RatesModelImpl.fromJson;

  @override
  bool get success;
  @override
  @JsonKey(ignore: true)
  _$$RatesModelImplCopyWith<_$RatesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
