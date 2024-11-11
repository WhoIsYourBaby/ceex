// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'up_load_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpLoadImageModel _$UpLoadImageModelFromJson(Map<String, dynamic> json) {
  return _UpLoadImageModel.fromJson(json);
}

/// @nodoc
mixin _$UpLoadImageModel {
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpLoadImageModelCopyWith<UpLoadImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpLoadImageModelCopyWith<$Res> {
  factory $UpLoadImageModelCopyWith(
          UpLoadImageModel value, $Res Function(UpLoadImageModel) then) =
      _$UpLoadImageModelCopyWithImpl<$Res, UpLoadImageModel>;
  @useResult
  $Res call({String? url});
}

/// @nodoc
class _$UpLoadImageModelCopyWithImpl<$Res, $Val extends UpLoadImageModel>
    implements $UpLoadImageModelCopyWith<$Res> {
  _$UpLoadImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpLoadImageModelImplCopyWith<$Res>
    implements $UpLoadImageModelCopyWith<$Res> {
  factory _$$UpLoadImageModelImplCopyWith(_$UpLoadImageModelImpl value,
          $Res Function(_$UpLoadImageModelImpl) then) =
      __$$UpLoadImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? url});
}

/// @nodoc
class __$$UpLoadImageModelImplCopyWithImpl<$Res>
    extends _$UpLoadImageModelCopyWithImpl<$Res, _$UpLoadImageModelImpl>
    implements _$$UpLoadImageModelImplCopyWith<$Res> {
  __$$UpLoadImageModelImplCopyWithImpl(_$UpLoadImageModelImpl _value,
      $Res Function(_$UpLoadImageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_$UpLoadImageModelImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpLoadImageModelImpl implements _UpLoadImageModel {
  const _$UpLoadImageModelImpl({this.url});

  factory _$UpLoadImageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpLoadImageModelImplFromJson(json);

  @override
  final String? url;

  @override
  String toString() {
    return 'UpLoadImageModel(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpLoadImageModelImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpLoadImageModelImplCopyWith<_$UpLoadImageModelImpl> get copyWith =>
      __$$UpLoadImageModelImplCopyWithImpl<_$UpLoadImageModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpLoadImageModelImplToJson(
      this,
    );
  }
}

abstract class _UpLoadImageModel implements UpLoadImageModel {
  const factory _UpLoadImageModel({final String? url}) = _$UpLoadImageModelImpl;

  factory _UpLoadImageModel.fromJson(Map<String, dynamic> json) =
      _$UpLoadImageModelImpl.fromJson;

  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$UpLoadImageModelImplCopyWith<_$UpLoadImageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
