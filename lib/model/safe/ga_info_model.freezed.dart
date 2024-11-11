// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ga_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GAInfoModel _$GAInfoModelFromJson(Map<String, dynamic> json) {
  return _GAInfoModel.fromJson(json);
}

/// @nodoc
mixin _$GAInfoModel {
  String? get secretKey => throw _privateConstructorUsedError;
  String? get authUrl => throw _privateConstructorUsedError;
  String? get qrcode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GAInfoModelCopyWith<GAInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GAInfoModelCopyWith<$Res> {
  factory $GAInfoModelCopyWith(
          GAInfoModel value, $Res Function(GAInfoModel) then) =
      _$GAInfoModelCopyWithImpl<$Res, GAInfoModel>;
  @useResult
  $Res call({String? secretKey, String? authUrl, String? qrcode});
}

/// @nodoc
class _$GAInfoModelCopyWithImpl<$Res, $Val extends GAInfoModel>
    implements $GAInfoModelCopyWith<$Res> {
  _$GAInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? secretKey = freezed,
    Object? authUrl = freezed,
    Object? qrcode = freezed,
  }) {
    return _then(_value.copyWith(
      secretKey: freezed == secretKey
          ? _value.secretKey
          : secretKey // ignore: cast_nullable_to_non_nullable
              as String?,
      authUrl: freezed == authUrl
          ? _value.authUrl
          : authUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      qrcode: freezed == qrcode
          ? _value.qrcode
          : qrcode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GAInfoModelImplCopyWith<$Res>
    implements $GAInfoModelCopyWith<$Res> {
  factory _$$GAInfoModelImplCopyWith(
          _$GAInfoModelImpl value, $Res Function(_$GAInfoModelImpl) then) =
      __$$GAInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? secretKey, String? authUrl, String? qrcode});
}

/// @nodoc
class __$$GAInfoModelImplCopyWithImpl<$Res>
    extends _$GAInfoModelCopyWithImpl<$Res, _$GAInfoModelImpl>
    implements _$$GAInfoModelImplCopyWith<$Res> {
  __$$GAInfoModelImplCopyWithImpl(
      _$GAInfoModelImpl _value, $Res Function(_$GAInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? secretKey = freezed,
    Object? authUrl = freezed,
    Object? qrcode = freezed,
  }) {
    return _then(_$GAInfoModelImpl(
      secretKey: freezed == secretKey
          ? _value.secretKey
          : secretKey // ignore: cast_nullable_to_non_nullable
              as String?,
      authUrl: freezed == authUrl
          ? _value.authUrl
          : authUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      qrcode: freezed == qrcode
          ? _value.qrcode
          : qrcode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GAInfoModelImpl implements _GAInfoModel {
  const _$GAInfoModelImpl({this.secretKey, this.authUrl, this.qrcode});

  factory _$GAInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GAInfoModelImplFromJson(json);

  @override
  final String? secretKey;
  @override
  final String? authUrl;
  @override
  final String? qrcode;

  @override
  String toString() {
    return 'GAInfoModel(secretKey: $secretKey, authUrl: $authUrl, qrcode: $qrcode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GAInfoModelImpl &&
            (identical(other.secretKey, secretKey) ||
                other.secretKey == secretKey) &&
            (identical(other.authUrl, authUrl) || other.authUrl == authUrl) &&
            (identical(other.qrcode, qrcode) || other.qrcode == qrcode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, secretKey, authUrl, qrcode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GAInfoModelImplCopyWith<_$GAInfoModelImpl> get copyWith =>
      __$$GAInfoModelImplCopyWithImpl<_$GAInfoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GAInfoModelImplToJson(
      this,
    );
  }
}

abstract class _GAInfoModel implements GAInfoModel {
  const factory _GAInfoModel(
      {final String? secretKey,
      final String? authUrl,
      final String? qrcode}) = _$GAInfoModelImpl;

  factory _GAInfoModel.fromJson(Map<String, dynamic> json) =
      _$GAInfoModelImpl.fromJson;

  @override
  String? get secretKey;
  @override
  String? get authUrl;
  @override
  String? get qrcode;
  @override
  @JsonKey(ignore: true)
  _$$GAInfoModelImplCopyWith<_$GAInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
