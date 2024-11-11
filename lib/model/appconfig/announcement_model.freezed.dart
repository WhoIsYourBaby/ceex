// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnnouncementModel _$AnnouncementModelFromJson(Map<String, dynamic> json) {
  return _AnnouncementModel.fromJson(json);
}

/// @nodoc
mixin _$AnnouncementModel {
  String? get title => throw _privateConstructorUsedError;
  String? get detail => throw _privateConstructorUsedError;
  bool? get isDirect => throw _privateConstructorUsedError;
  String? get directUrl => throw _privateConstructorUsedError;
  String? get publishTime => throw _privateConstructorUsedError;
  int? get sort => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnnouncementModelCopyWith<AnnouncementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementModelCopyWith<$Res> {
  factory $AnnouncementModelCopyWith(
          AnnouncementModel value, $Res Function(AnnouncementModel) then) =
      _$AnnouncementModelCopyWithImpl<$Res, AnnouncementModel>;
  @useResult
  $Res call(
      {String? title,
      String? detail,
      bool? isDirect,
      String? directUrl,
      String? publishTime,
      int? sort});
}

/// @nodoc
class _$AnnouncementModelCopyWithImpl<$Res, $Val extends AnnouncementModel>
    implements $AnnouncementModelCopyWith<$Res> {
  _$AnnouncementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? detail = freezed,
    Object? isDirect = freezed,
    Object? directUrl = freezed,
    Object? publishTime = freezed,
    Object? sort = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
      isDirect: freezed == isDirect
          ? _value.isDirect
          : isDirect // ignore: cast_nullable_to_non_nullable
              as bool?,
      directUrl: freezed == directUrl
          ? _value.directUrl
          : directUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      publishTime: freezed == publishTime
          ? _value.publishTime
          : publishTime // ignore: cast_nullable_to_non_nullable
              as String?,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnnouncementModelImplCopyWith<$Res>
    implements $AnnouncementModelCopyWith<$Res> {
  factory _$$AnnouncementModelImplCopyWith(_$AnnouncementModelImpl value,
          $Res Function(_$AnnouncementModelImpl) then) =
      __$$AnnouncementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? detail,
      bool? isDirect,
      String? directUrl,
      String? publishTime,
      int? sort});
}

/// @nodoc
class __$$AnnouncementModelImplCopyWithImpl<$Res>
    extends _$AnnouncementModelCopyWithImpl<$Res, _$AnnouncementModelImpl>
    implements _$$AnnouncementModelImplCopyWith<$Res> {
  __$$AnnouncementModelImplCopyWithImpl(_$AnnouncementModelImpl _value,
      $Res Function(_$AnnouncementModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? detail = freezed,
    Object? isDirect = freezed,
    Object? directUrl = freezed,
    Object? publishTime = freezed,
    Object? sort = freezed,
  }) {
    return _then(_$AnnouncementModelImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
      isDirect: freezed == isDirect
          ? _value.isDirect
          : isDirect // ignore: cast_nullable_to_non_nullable
              as bool?,
      directUrl: freezed == directUrl
          ? _value.directUrl
          : directUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      publishTime: freezed == publishTime
          ? _value.publishTime
          : publishTime // ignore: cast_nullable_to_non_nullable
              as String?,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnnouncementModelImpl
    with DiagnosticableTreeMixin
    implements _AnnouncementModel {
  const _$AnnouncementModelImpl(
      {this.title,
      this.detail,
      this.isDirect,
      this.directUrl,
      this.publishTime,
      this.sort});

  factory _$AnnouncementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnnouncementModelImplFromJson(json);

  @override
  final String? title;
  @override
  final String? detail;
  @override
  final bool? isDirect;
  @override
  final String? directUrl;
  @override
  final String? publishTime;
  @override
  final int? sort;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AnnouncementModel(title: $title, detail: $detail, isDirect: $isDirect, directUrl: $directUrl, publishTime: $publishTime, sort: $sort)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AnnouncementModel'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('detail', detail))
      ..add(DiagnosticsProperty('isDirect', isDirect))
      ..add(DiagnosticsProperty('directUrl', directUrl))
      ..add(DiagnosticsProperty('publishTime', publishTime))
      ..add(DiagnosticsProperty('sort', sort));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnnouncementModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.isDirect, isDirect) ||
                other.isDirect == isDirect) &&
            (identical(other.directUrl, directUrl) ||
                other.directUrl == directUrl) &&
            (identical(other.publishTime, publishTime) ||
                other.publishTime == publishTime) &&
            (identical(other.sort, sort) || other.sort == sort));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, detail, isDirect, directUrl, publishTime, sort);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnnouncementModelImplCopyWith<_$AnnouncementModelImpl> get copyWith =>
      __$$AnnouncementModelImplCopyWithImpl<_$AnnouncementModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnnouncementModelImplToJson(
      this,
    );
  }
}

abstract class _AnnouncementModel implements AnnouncementModel {
  const factory _AnnouncementModel(
      {final String? title,
      final String? detail,
      final bool? isDirect,
      final String? directUrl,
      final String? publishTime,
      final int? sort}) = _$AnnouncementModelImpl;

  factory _AnnouncementModel.fromJson(Map<String, dynamic> json) =
      _$AnnouncementModelImpl.fromJson;

  @override
  String? get title;
  @override
  String? get detail;
  @override
  bool? get isDirect;
  @override
  String? get directUrl;
  @override
  String? get publishTime;
  @override
  int? get sort;
  @override
  @JsonKey(ignore: true)
  _$$AnnouncementModelImplCopyWith<_$AnnouncementModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
