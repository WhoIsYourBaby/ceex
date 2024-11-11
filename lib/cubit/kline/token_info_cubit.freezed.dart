// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_info_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TokenInfoState {
  TokenInfoModel? get tokenInfoModel => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TokenInfoModel? tokenInfoModel) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TokenInfoModel? tokenInfoModel)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TokenInfoModel? tokenInfoModel)? initial,
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
  $TokenInfoStateCopyWith<TokenInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenInfoStateCopyWith<$Res> {
  factory $TokenInfoStateCopyWith(
          TokenInfoState value, $Res Function(TokenInfoState) then) =
      _$TokenInfoStateCopyWithImpl<$Res, TokenInfoState>;
  @useResult
  $Res call({TokenInfoModel? tokenInfoModel});

  $TokenInfoModelCopyWith<$Res>? get tokenInfoModel;
}

/// @nodoc
class _$TokenInfoStateCopyWithImpl<$Res, $Val extends TokenInfoState>
    implements $TokenInfoStateCopyWith<$Res> {
  _$TokenInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokenInfoModel = freezed,
  }) {
    return _then(_value.copyWith(
      tokenInfoModel: freezed == tokenInfoModel
          ? _value.tokenInfoModel
          : tokenInfoModel // ignore: cast_nullable_to_non_nullable
              as TokenInfoModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TokenInfoModelCopyWith<$Res>? get tokenInfoModel {
    if (_value.tokenInfoModel == null) {
      return null;
    }

    return $TokenInfoModelCopyWith<$Res>(_value.tokenInfoModel!, (value) {
      return _then(_value.copyWith(tokenInfoModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $TokenInfoStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TokenInfoModel? tokenInfoModel});

  @override
  $TokenInfoModelCopyWith<$Res>? get tokenInfoModel;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$TokenInfoStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokenInfoModel = freezed,
  }) {
    return _then(_$InitialImpl(
      tokenInfoModel: freezed == tokenInfoModel
          ? _value.tokenInfoModel
          : tokenInfoModel // ignore: cast_nullable_to_non_nullable
              as TokenInfoModel?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({this.tokenInfoModel});

  @override
  final TokenInfoModel? tokenInfoModel;

  @override
  String toString() {
    return 'TokenInfoState.initial(tokenInfoModel: $tokenInfoModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.tokenInfoModel, tokenInfoModel) ||
                other.tokenInfoModel == tokenInfoModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tokenInfoModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TokenInfoModel? tokenInfoModel) initial,
  }) {
    return initial(tokenInfoModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TokenInfoModel? tokenInfoModel)? initial,
  }) {
    return initial?.call(tokenInfoModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TokenInfoModel? tokenInfoModel)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(tokenInfoModel);
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

abstract class _Initial implements TokenInfoState {
  const factory _Initial({final TokenInfoModel? tokenInfoModel}) =
      _$InitialImpl;

  @override
  TokenInfoModel? get tokenInfoModel;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
