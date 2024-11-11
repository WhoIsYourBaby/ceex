// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_account_query_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubAccountQueryModel _$SubAccountQueryModelFromJson(Map<String, dynamic> json) {
  return _SubAccountQueryModel.fromJson(json);
}

/// @nodoc
mixin _$SubAccountQueryModel {
  String? get accountId => throw _privateConstructorUsedError;
  String? get accountName => throw _privateConstructorUsedError;
  int? get accountType => throw _privateConstructorUsedError;
  int? get accountIndex => throw _privateConstructorUsedError;
  bool? get canChoose => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubAccountQueryModelCopyWith<SubAccountQueryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubAccountQueryModelCopyWith<$Res> {
  factory $SubAccountQueryModelCopyWith(SubAccountQueryModel value,
          $Res Function(SubAccountQueryModel) then) =
      _$SubAccountQueryModelCopyWithImpl<$Res, SubAccountQueryModel>;
  @useResult
  $Res call(
      {String? accountId,
      String? accountName,
      int? accountType,
      int? accountIndex,
      bool? canChoose});
}

/// @nodoc
class _$SubAccountQueryModelCopyWithImpl<$Res,
        $Val extends SubAccountQueryModel>
    implements $SubAccountQueryModelCopyWith<$Res> {
  _$SubAccountQueryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = freezed,
    Object? accountName = freezed,
    Object? accountType = freezed,
    Object? accountIndex = freezed,
    Object? canChoose = freezed,
  }) {
    return _then(_value.copyWith(
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String?,
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as int?,
      accountIndex: freezed == accountIndex
          ? _value.accountIndex
          : accountIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      canChoose: freezed == canChoose
          ? _value.canChoose
          : canChoose // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubAccountQueryModelImplCopyWith<$Res>
    implements $SubAccountQueryModelCopyWith<$Res> {
  factory _$$SubAccountQueryModelImplCopyWith(_$SubAccountQueryModelImpl value,
          $Res Function(_$SubAccountQueryModelImpl) then) =
      __$$SubAccountQueryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? accountId,
      String? accountName,
      int? accountType,
      int? accountIndex,
      bool? canChoose});
}

/// @nodoc
class __$$SubAccountQueryModelImplCopyWithImpl<$Res>
    extends _$SubAccountQueryModelCopyWithImpl<$Res, _$SubAccountQueryModelImpl>
    implements _$$SubAccountQueryModelImplCopyWith<$Res> {
  __$$SubAccountQueryModelImplCopyWithImpl(_$SubAccountQueryModelImpl _value,
      $Res Function(_$SubAccountQueryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = freezed,
    Object? accountName = freezed,
    Object? accountType = freezed,
    Object? accountIndex = freezed,
    Object? canChoose = freezed,
  }) {
    return _then(_$SubAccountQueryModelImpl(
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String?,
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as int?,
      accountIndex: freezed == accountIndex
          ? _value.accountIndex
          : accountIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      canChoose: freezed == canChoose
          ? _value.canChoose
          : canChoose // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubAccountQueryModelImpl
    with DiagnosticableTreeMixin
    implements _SubAccountQueryModel {
  const _$SubAccountQueryModelImpl(
      {this.accountId,
      this.accountName,
      this.accountType,
      this.accountIndex,
      this.canChoose});

  factory _$SubAccountQueryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubAccountQueryModelImplFromJson(json);

  @override
  final String? accountId;
  @override
  final String? accountName;
  @override
  final int? accountType;
  @override
  final int? accountIndex;
  @override
  final bool? canChoose;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SubAccountQueryModel(accountId: $accountId, accountName: $accountName, accountType: $accountType, accountIndex: $accountIndex, canChoose: $canChoose)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SubAccountQueryModel'))
      ..add(DiagnosticsProperty('accountId', accountId))
      ..add(DiagnosticsProperty('accountName', accountName))
      ..add(DiagnosticsProperty('accountType', accountType))
      ..add(DiagnosticsProperty('accountIndex', accountIndex))
      ..add(DiagnosticsProperty('canChoose', canChoose));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubAccountQueryModelImpl &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.accountIndex, accountIndex) ||
                other.accountIndex == accountIndex) &&
            (identical(other.canChoose, canChoose) ||
                other.canChoose == canChoose));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accountId, accountName,
      accountType, accountIndex, canChoose);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubAccountQueryModelImplCopyWith<_$SubAccountQueryModelImpl>
      get copyWith =>
          __$$SubAccountQueryModelImplCopyWithImpl<_$SubAccountQueryModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubAccountQueryModelImplToJson(
      this,
    );
  }
}

abstract class _SubAccountQueryModel implements SubAccountQueryModel {
  const factory _SubAccountQueryModel(
      {final String? accountId,
      final String? accountName,
      final int? accountType,
      final int? accountIndex,
      final bool? canChoose}) = _$SubAccountQueryModelImpl;

  factory _SubAccountQueryModel.fromJson(Map<String, dynamic> json) =
      _$SubAccountQueryModelImpl.fromJson;

  @override
  String? get accountId;
  @override
  String? get accountName;
  @override
  int? get accountType;
  @override
  int? get accountIndex;
  @override
  bool? get canChoose;
  @override
  @JsonKey(ignore: true)
  _$$SubAccountQueryModelImplCopyWith<_$SubAccountQueryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
