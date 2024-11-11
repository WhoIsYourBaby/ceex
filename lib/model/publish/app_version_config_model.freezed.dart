// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_version_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppVersionCongfigModel _$AppVersionCongfigModelFromJson(
    Map<String, dynamic> json) {
  return _AppVersionCongfigModel.fromJson(json);
}

/// @nodoc
mixin _$AppVersionCongfigModel {
  bool? get needUpdate => throw _privateConstructorUsedError;
  bool? get needForceUpdate => throw _privateConstructorUsedError;
  String? get downloadUrl => throw _privateConstructorUsedError;
  String? get newVersion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppVersionCongfigModelCopyWith<AppVersionCongfigModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppVersionCongfigModelCopyWith<$Res> {
  factory $AppVersionCongfigModelCopyWith(AppVersionCongfigModel value,
          $Res Function(AppVersionCongfigModel) then) =
      _$AppVersionCongfigModelCopyWithImpl<$Res, AppVersionCongfigModel>;
  @useResult
  $Res call(
      {bool? needUpdate,
      bool? needForceUpdate,
      String? downloadUrl,
      String? newVersion});
}

/// @nodoc
class _$AppVersionCongfigModelCopyWithImpl<$Res,
        $Val extends AppVersionCongfigModel>
    implements $AppVersionCongfigModelCopyWith<$Res> {
  _$AppVersionCongfigModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? needUpdate = freezed,
    Object? needForceUpdate = freezed,
    Object? downloadUrl = freezed,
    Object? newVersion = freezed,
  }) {
    return _then(_value.copyWith(
      needUpdate: freezed == needUpdate
          ? _value.needUpdate
          : needUpdate // ignore: cast_nullable_to_non_nullable
              as bool?,
      needForceUpdate: freezed == needForceUpdate
          ? _value.needForceUpdate
          : needForceUpdate // ignore: cast_nullable_to_non_nullable
              as bool?,
      downloadUrl: freezed == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      newVersion: freezed == newVersion
          ? _value.newVersion
          : newVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppVersionCongfigModelImplCopyWith<$Res>
    implements $AppVersionCongfigModelCopyWith<$Res> {
  factory _$$AppVersionCongfigModelImplCopyWith(
          _$AppVersionCongfigModelImpl value,
          $Res Function(_$AppVersionCongfigModelImpl) then) =
      __$$AppVersionCongfigModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? needUpdate,
      bool? needForceUpdate,
      String? downloadUrl,
      String? newVersion});
}

/// @nodoc
class __$$AppVersionCongfigModelImplCopyWithImpl<$Res>
    extends _$AppVersionCongfigModelCopyWithImpl<$Res,
        _$AppVersionCongfigModelImpl>
    implements _$$AppVersionCongfigModelImplCopyWith<$Res> {
  __$$AppVersionCongfigModelImplCopyWithImpl(
      _$AppVersionCongfigModelImpl _value,
      $Res Function(_$AppVersionCongfigModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? needUpdate = freezed,
    Object? needForceUpdate = freezed,
    Object? downloadUrl = freezed,
    Object? newVersion = freezed,
  }) {
    return _then(_$AppVersionCongfigModelImpl(
      needUpdate: freezed == needUpdate
          ? _value.needUpdate
          : needUpdate // ignore: cast_nullable_to_non_nullable
              as bool?,
      needForceUpdate: freezed == needForceUpdate
          ? _value.needForceUpdate
          : needForceUpdate // ignore: cast_nullable_to_non_nullable
              as bool?,
      downloadUrl: freezed == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      newVersion: freezed == newVersion
          ? _value.newVersion
          : newVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppVersionCongfigModelImpl implements _AppVersionCongfigModel {
  const _$AppVersionCongfigModelImpl(
      {this.needUpdate,
      this.needForceUpdate,
      this.downloadUrl,
      this.newVersion});

  factory _$AppVersionCongfigModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppVersionCongfigModelImplFromJson(json);

  @override
  final bool? needUpdate;
  @override
  final bool? needForceUpdate;
  @override
  final String? downloadUrl;
  @override
  final String? newVersion;

  @override
  String toString() {
    return 'AppVersionCongfigModel(needUpdate: $needUpdate, needForceUpdate: $needForceUpdate, downloadUrl: $downloadUrl, newVersion: $newVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppVersionCongfigModelImpl &&
            (identical(other.needUpdate, needUpdate) ||
                other.needUpdate == needUpdate) &&
            (identical(other.needForceUpdate, needForceUpdate) ||
                other.needForceUpdate == needForceUpdate) &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl) &&
            (identical(other.newVersion, newVersion) ||
                other.newVersion == newVersion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, needUpdate, needForceUpdate, downloadUrl, newVersion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppVersionCongfigModelImplCopyWith<_$AppVersionCongfigModelImpl>
      get copyWith => __$$AppVersionCongfigModelImplCopyWithImpl<
          _$AppVersionCongfigModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppVersionCongfigModelImplToJson(
      this,
    );
  }
}

abstract class _AppVersionCongfigModel implements AppVersionCongfigModel {
  const factory _AppVersionCongfigModel(
      {final bool? needUpdate,
      final bool? needForceUpdate,
      final String? downloadUrl,
      final String? newVersion}) = _$AppVersionCongfigModelImpl;

  factory _AppVersionCongfigModel.fromJson(Map<String, dynamic> json) =
      _$AppVersionCongfigModelImpl.fromJson;

  @override
  bool? get needUpdate;
  @override
  bool? get needForceUpdate;
  @override
  String? get downloadUrl;
  @override
  String? get newVersion;
  @override
  @JsonKey(ignore: true)
  _$$AppVersionCongfigModelImplCopyWith<_$AppVersionCongfigModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
