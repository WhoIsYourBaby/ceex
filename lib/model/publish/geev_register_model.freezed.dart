// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geev_register_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GeevRegisterModel _$GeevRegisterModelFromJson(Map<String, dynamic> json) {
  return _GeevRegisterModel.fromJson(json);
}

/// @nodoc
mixin _$GeevRegisterModel {
  int? get success => throw _privateConstructorUsedError;
  bool? get new_captcha => throw _privateConstructorUsedError;
  String? get challenge => throw _privateConstructorUsedError;
  String? get gt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeevRegisterModelCopyWith<GeevRegisterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeevRegisterModelCopyWith<$Res> {
  factory $GeevRegisterModelCopyWith(
          GeevRegisterModel value, $Res Function(GeevRegisterModel) then) =
      _$GeevRegisterModelCopyWithImpl<$Res, GeevRegisterModel>;
  @useResult
  $Res call({int? success, bool? new_captcha, String? challenge, String? gt});
}

/// @nodoc
class _$GeevRegisterModelCopyWithImpl<$Res, $Val extends GeevRegisterModel>
    implements $GeevRegisterModelCopyWith<$Res> {
  _$GeevRegisterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? new_captcha = freezed,
    Object? challenge = freezed,
    Object? gt = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as int?,
      new_captcha: freezed == new_captcha
          ? _value.new_captcha
          : new_captcha // ignore: cast_nullable_to_non_nullable
              as bool?,
      challenge: freezed == challenge
          ? _value.challenge
          : challenge // ignore: cast_nullable_to_non_nullable
              as String?,
      gt: freezed == gt
          ? _value.gt
          : gt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeevRegisterModelImplCopyWith<$Res>
    implements $GeevRegisterModelCopyWith<$Res> {
  factory _$$GeevRegisterModelImplCopyWith(_$GeevRegisterModelImpl value,
          $Res Function(_$GeevRegisterModelImpl) then) =
      __$$GeevRegisterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? success, bool? new_captcha, String? challenge, String? gt});
}

/// @nodoc
class __$$GeevRegisterModelImplCopyWithImpl<$Res>
    extends _$GeevRegisterModelCopyWithImpl<$Res, _$GeevRegisterModelImpl>
    implements _$$GeevRegisterModelImplCopyWith<$Res> {
  __$$GeevRegisterModelImplCopyWithImpl(_$GeevRegisterModelImpl _value,
      $Res Function(_$GeevRegisterModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? new_captcha = freezed,
    Object? challenge = freezed,
    Object? gt = freezed,
  }) {
    return _then(_$GeevRegisterModelImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as int?,
      new_captcha: freezed == new_captcha
          ? _value.new_captcha
          : new_captcha // ignore: cast_nullable_to_non_nullable
              as bool?,
      challenge: freezed == challenge
          ? _value.challenge
          : challenge // ignore: cast_nullable_to_non_nullable
              as String?,
      gt: freezed == gt
          ? _value.gt
          : gt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeevRegisterModelImpl implements _GeevRegisterModel {
  const _$GeevRegisterModelImpl(
      {this.success, this.new_captcha, this.challenge, this.gt});

  factory _$GeevRegisterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeevRegisterModelImplFromJson(json);

  @override
  final int? success;
  @override
  final bool? new_captcha;
  @override
  final String? challenge;
  @override
  final String? gt;

  @override
  String toString() {
    return 'GeevRegisterModel(success: $success, new_captcha: $new_captcha, challenge: $challenge, gt: $gt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeevRegisterModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.new_captcha, new_captcha) ||
                other.new_captcha == new_captcha) &&
            (identical(other.challenge, challenge) ||
                other.challenge == challenge) &&
            (identical(other.gt, gt) || other.gt == gt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, new_captcha, challenge, gt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeevRegisterModelImplCopyWith<_$GeevRegisterModelImpl> get copyWith =>
      __$$GeevRegisterModelImplCopyWithImpl<_$GeevRegisterModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeevRegisterModelImplToJson(
      this,
    );
  }
}

abstract class _GeevRegisterModel implements GeevRegisterModel {
  const factory _GeevRegisterModel(
      {final int? success,
      final bool? new_captcha,
      final String? challenge,
      final String? gt}) = _$GeevRegisterModelImpl;

  factory _GeevRegisterModel.fromJson(Map<String, dynamic> json) =
      _$GeevRegisterModelImpl.fromJson;

  @override
  int? get success;
  @override
  bool? get new_captcha;
  @override
  String? get challenge;
  @override
  String? get gt;
  @override
  @JsonKey(ignore: true)
  _$$GeevRegisterModelImplCopyWith<_$GeevRegisterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
