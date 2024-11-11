// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthenticationState {
  String? get name => throw _privateConstructorUsedError; // 姓名，姓
  String? get number => throw _privateConstructorUsedError;
  String? get fontImagePath => throw _privateConstructorUsedError;
  String? get fontImageUrl => throw _privateConstructorUsedError;
  String? get rearImagePath => throw _privateConstructorUsedError;
  String? get rearImageUrl => throw _privateConstructorUsedError;
  bool? get requestSuccess => throw _privateConstructorUsedError; // 是否认证成功
  String? get nationality => throw _privateConstructorUsedError; // 国家
  String? get shortName => throw _privateConstructorUsedError; // 国家代码
  String? get surName => throw _privateConstructorUsedError; // 第二个名字
  int? get documentType => throw _privateConstructorUsedError; // 证件类型
  String? get documentCode => throw _privateConstructorUsedError; // 证件号码
  List<KycAuthenticationInformationModel>? get kycInfoList =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? name,
            String? number,
            String? fontImagePath,
            String? fontImageUrl,
            String? rearImagePath,
            String? rearImageUrl,
            bool? requestSuccess,
            String? nationality,
            String? shortName,
            String? surName,
            int? documentType,
            String? documentCode,
            List<KycAuthenticationInformationModel>? kycInfoList)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? name,
            String? number,
            String? fontImagePath,
            String? fontImageUrl,
            String? rearImagePath,
            String? rearImageUrl,
            bool? requestSuccess,
            String? nationality,
            String? shortName,
            String? surName,
            int? documentType,
            String? documentCode,
            List<KycAuthenticationInformationModel>? kycInfoList)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? name,
            String? number,
            String? fontImagePath,
            String? fontImageUrl,
            String? rearImagePath,
            String? rearImageUrl,
            bool? requestSuccess,
            String? nationality,
            String? shortName,
            String? surName,
            int? documentType,
            String? documentCode,
            List<KycAuthenticationInformationModel>? kycInfoList)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthenticationStateCopyWith<AuthenticationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res, AuthenticationState>;
  @useResult
  $Res call(
      {String? name,
      String? number,
      String? fontImagePath,
      String? fontImageUrl,
      String? rearImagePath,
      String? rearImageUrl,
      bool? requestSuccess,
      String? nationality,
      String? shortName,
      String? surName,
      int? documentType,
      String? documentCode,
      List<KycAuthenticationInformationModel>? kycInfoList});
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res, $Val extends AuthenticationState>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? number = freezed,
    Object? fontImagePath = freezed,
    Object? fontImageUrl = freezed,
    Object? rearImagePath = freezed,
    Object? rearImageUrl = freezed,
    Object? requestSuccess = freezed,
    Object? nationality = freezed,
    Object? shortName = freezed,
    Object? surName = freezed,
    Object? documentType = freezed,
    Object? documentCode = freezed,
    Object? kycInfoList = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      fontImagePath: freezed == fontImagePath
          ? _value.fontImagePath
          : fontImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      fontImageUrl: freezed == fontImageUrl
          ? _value.fontImageUrl
          : fontImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      rearImagePath: freezed == rearImagePath
          ? _value.rearImagePath
          : rearImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      rearImageUrl: freezed == rearImageUrl
          ? _value.rearImageUrl
          : rearImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      requestSuccess: freezed == requestSuccess
          ? _value.requestSuccess
          : requestSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      nationality: freezed == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String?,
      shortName: freezed == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      surName: freezed == surName
          ? _value.surName
          : surName // ignore: cast_nullable_to_non_nullable
              as String?,
      documentType: freezed == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as int?,
      documentCode: freezed == documentCode
          ? _value.documentCode
          : documentCode // ignore: cast_nullable_to_non_nullable
              as String?,
      kycInfoList: freezed == kycInfoList
          ? _value.kycInfoList
          : kycInfoList // ignore: cast_nullable_to_non_nullable
              as List<KycAuthenticationInformationModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? number,
      String? fontImagePath,
      String? fontImageUrl,
      String? rearImagePath,
      String? rearImageUrl,
      bool? requestSuccess,
      String? nationality,
      String? shortName,
      String? surName,
      int? documentType,
      String? documentCode,
      List<KycAuthenticationInformationModel>? kycInfoList});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? number = freezed,
    Object? fontImagePath = freezed,
    Object? fontImageUrl = freezed,
    Object? rearImagePath = freezed,
    Object? rearImageUrl = freezed,
    Object? requestSuccess = freezed,
    Object? nationality = freezed,
    Object? shortName = freezed,
    Object? surName = freezed,
    Object? documentType = freezed,
    Object? documentCode = freezed,
    Object? kycInfoList = freezed,
  }) {
    return _then(_$InitialImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      fontImagePath: freezed == fontImagePath
          ? _value.fontImagePath
          : fontImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      fontImageUrl: freezed == fontImageUrl
          ? _value.fontImageUrl
          : fontImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      rearImagePath: freezed == rearImagePath
          ? _value.rearImagePath
          : rearImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      rearImageUrl: freezed == rearImageUrl
          ? _value.rearImageUrl
          : rearImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      requestSuccess: freezed == requestSuccess
          ? _value.requestSuccess
          : requestSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      nationality: freezed == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String?,
      shortName: freezed == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      surName: freezed == surName
          ? _value.surName
          : surName // ignore: cast_nullable_to_non_nullable
              as String?,
      documentType: freezed == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as int?,
      documentCode: freezed == documentCode
          ? _value.documentCode
          : documentCode // ignore: cast_nullable_to_non_nullable
              as String?,
      kycInfoList: freezed == kycInfoList
          ? _value._kycInfoList
          : kycInfoList // ignore: cast_nullable_to_non_nullable
              as List<KycAuthenticationInformationModel>?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.name,
      this.number,
      this.fontImagePath,
      this.fontImageUrl,
      this.rearImagePath,
      this.rearImageUrl,
      this.requestSuccess,
      this.nationality,
      this.shortName,
      this.surName,
      this.documentType,
      this.documentCode,
      final List<KycAuthenticationInformationModel>? kycInfoList})
      : _kycInfoList = kycInfoList;

  @override
  final String? name;
// 姓名，姓
  @override
  final String? number;
  @override
  final String? fontImagePath;
  @override
  final String? fontImageUrl;
  @override
  final String? rearImagePath;
  @override
  final String? rearImageUrl;
  @override
  final bool? requestSuccess;
// 是否认证成功
  @override
  final String? nationality;
// 国家
  @override
  final String? shortName;
// 国家代码
  @override
  final String? surName;
// 第二个名字
  @override
  final int? documentType;
// 证件类型
  @override
  final String? documentCode;
// 证件号码
  final List<KycAuthenticationInformationModel>? _kycInfoList;
// 证件号码
  @override
  List<KycAuthenticationInformationModel>? get kycInfoList {
    final value = _kycInfoList;
    if (value == null) return null;
    if (_kycInfoList is EqualUnmodifiableListView) return _kycInfoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AuthenticationState.initial(name: $name, number: $number, fontImagePath: $fontImagePath, fontImageUrl: $fontImageUrl, rearImagePath: $rearImagePath, rearImageUrl: $rearImageUrl, requestSuccess: $requestSuccess, nationality: $nationality, shortName: $shortName, surName: $surName, documentType: $documentType, documentCode: $documentCode, kycInfoList: $kycInfoList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.fontImagePath, fontImagePath) ||
                other.fontImagePath == fontImagePath) &&
            (identical(other.fontImageUrl, fontImageUrl) ||
                other.fontImageUrl == fontImageUrl) &&
            (identical(other.rearImagePath, rearImagePath) ||
                other.rearImagePath == rearImagePath) &&
            (identical(other.rearImageUrl, rearImageUrl) ||
                other.rearImageUrl == rearImageUrl) &&
            (identical(other.requestSuccess, requestSuccess) ||
                other.requestSuccess == requestSuccess) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.surName, surName) || other.surName == surName) &&
            (identical(other.documentType, documentType) ||
                other.documentType == documentType) &&
            (identical(other.documentCode, documentCode) ||
                other.documentCode == documentCode) &&
            const DeepCollectionEquality()
                .equals(other._kycInfoList, _kycInfoList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      number,
      fontImagePath,
      fontImageUrl,
      rearImagePath,
      rearImageUrl,
      requestSuccess,
      nationality,
      shortName,
      surName,
      documentType,
      documentCode,
      const DeepCollectionEquality().hash(_kycInfoList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? name,
            String? number,
            String? fontImagePath,
            String? fontImageUrl,
            String? rearImagePath,
            String? rearImageUrl,
            bool? requestSuccess,
            String? nationality,
            String? shortName,
            String? surName,
            int? documentType,
            String? documentCode,
            List<KycAuthenticationInformationModel>? kycInfoList)
        initial,
  }) {
    return initial(
        name,
        number,
        fontImagePath,
        fontImageUrl,
        rearImagePath,
        rearImageUrl,
        requestSuccess,
        nationality,
        shortName,
        surName,
        documentType,
        documentCode,
        kycInfoList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? name,
            String? number,
            String? fontImagePath,
            String? fontImageUrl,
            String? rearImagePath,
            String? rearImageUrl,
            bool? requestSuccess,
            String? nationality,
            String? shortName,
            String? surName,
            int? documentType,
            String? documentCode,
            List<KycAuthenticationInformationModel>? kycInfoList)?
        initial,
  }) {
    return initial?.call(
        name,
        number,
        fontImagePath,
        fontImageUrl,
        rearImagePath,
        rearImageUrl,
        requestSuccess,
        nationality,
        shortName,
        surName,
        documentType,
        documentCode,
        kycInfoList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? name,
            String? number,
            String? fontImagePath,
            String? fontImageUrl,
            String? rearImagePath,
            String? rearImageUrl,
            bool? requestSuccess,
            String? nationality,
            String? shortName,
            String? surName,
            int? documentType,
            String? documentCode,
            List<KycAuthenticationInformationModel>? kycInfoList)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          name,
          number,
          fontImagePath,
          fontImageUrl,
          rearImagePath,
          rearImageUrl,
          requestSuccess,
          nationality,
          shortName,
          surName,
          documentType,
          documentCode,
          kycInfoList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthenticationState {
  const factory _Initial(
          {final String? name,
          final String? number,
          final String? fontImagePath,
          final String? fontImageUrl,
          final String? rearImagePath,
          final String? rearImageUrl,
          final bool? requestSuccess,
          final String? nationality,
          final String? shortName,
          final String? surName,
          final int? documentType,
          final String? documentCode,
          final List<KycAuthenticationInformationModel>? kycInfoList}) =
      _$InitialImpl;

  @override
  String? get name;
  @override // 姓名，姓
  String? get number;
  @override
  String? get fontImagePath;
  @override
  String? get fontImageUrl;
  @override
  String? get rearImagePath;
  @override
  String? get rearImageUrl;
  @override
  bool? get requestSuccess;
  @override // 是否认证成功
  String? get nationality;
  @override // 国家
  String? get shortName;
  @override // 国家代码
  String? get surName;
  @override // 第二个名字
  int? get documentType;
  @override // 证件类型
  String? get documentCode;
  @override // 证件号码
  List<KycAuthenticationInformationModel>? get kycInfoList;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
