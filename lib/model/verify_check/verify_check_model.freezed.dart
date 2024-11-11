// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_check_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifyCheckModel _$VerifyCheckModelFromJson(Map<String, dynamic> json) {
  return _VerifyCheckModel.fromJson(json);
}

/// @nodoc
mixin _$VerifyCheckModel {
  String? get requestId => throw _privateConstructorUsedError;
  bool? get need2FA => throw _privateConstructorUsedError;
  String? get authType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyCheckModelCopyWith<VerifyCheckModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyCheckModelCopyWith<$Res> {
  factory $VerifyCheckModelCopyWith(
          VerifyCheckModel value, $Res Function(VerifyCheckModel) then) =
      _$VerifyCheckModelCopyWithImpl<$Res, VerifyCheckModel>;
  @useResult
  $Res call({String? requestId, bool? need2FA, String? authType});
}

/// @nodoc
class _$VerifyCheckModelCopyWithImpl<$Res, $Val extends VerifyCheckModel>
    implements $VerifyCheckModelCopyWith<$Res> {
  _$VerifyCheckModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? need2FA = freezed,
    Object? authType = freezed,
  }) {
    return _then(_value.copyWith(
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      need2FA: freezed == need2FA
          ? _value.need2FA
          : need2FA // ignore: cast_nullable_to_non_nullable
              as bool?,
      authType: freezed == authType
          ? _value.authType
          : authType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyCheckModelImplCopyWith<$Res>
    implements $VerifyCheckModelCopyWith<$Res> {
  factory _$$VerifyCheckModelImplCopyWith(_$VerifyCheckModelImpl value,
          $Res Function(_$VerifyCheckModelImpl) then) =
      __$$VerifyCheckModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? requestId, bool? need2FA, String? authType});
}

/// @nodoc
class __$$VerifyCheckModelImplCopyWithImpl<$Res>
    extends _$VerifyCheckModelCopyWithImpl<$Res, _$VerifyCheckModelImpl>
    implements _$$VerifyCheckModelImplCopyWith<$Res> {
  __$$VerifyCheckModelImplCopyWithImpl(_$VerifyCheckModelImpl _value,
      $Res Function(_$VerifyCheckModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? need2FA = freezed,
    Object? authType = freezed,
  }) {
    return _then(_$VerifyCheckModelImpl(
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      need2FA: freezed == need2FA
          ? _value.need2FA
          : need2FA // ignore: cast_nullable_to_non_nullable
              as bool?,
      authType: freezed == authType
          ? _value.authType
          : authType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyCheckModelImpl implements _VerifyCheckModel {
  const _$VerifyCheckModelImpl({this.requestId, this.need2FA, this.authType});

  factory _$VerifyCheckModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyCheckModelImplFromJson(json);

  @override
  final String? requestId;
  @override
  final bool? need2FA;
  @override
  final String? authType;

  @override
  String toString() {
    return 'VerifyCheckModel(requestId: $requestId, need2FA: $need2FA, authType: $authType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyCheckModelImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.need2FA, need2FA) || other.need2FA == need2FA) &&
            (identical(other.authType, authType) ||
                other.authType == authType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, requestId, need2FA, authType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyCheckModelImplCopyWith<_$VerifyCheckModelImpl> get copyWith =>
      __$$VerifyCheckModelImplCopyWithImpl<_$VerifyCheckModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyCheckModelImplToJson(
      this,
    );
  }
}

abstract class _VerifyCheckModel implements VerifyCheckModel {
  const factory _VerifyCheckModel(
      {final String? requestId,
      final bool? need2FA,
      final String? authType}) = _$VerifyCheckModelImpl;

  factory _VerifyCheckModel.fromJson(Map<String, dynamic> json) =
      _$VerifyCheckModelImpl.fromJson;

  @override
  String? get requestId;
  @override
  bool? get need2FA;
  @override
  String? get authType;
  @override
  @JsonKey(ignore: true)
  _$$VerifyCheckModelImplCopyWith<_$VerifyCheckModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
