// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_view_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MarketViewState {
  MarketTabType get type => throw _privateConstructorUsedError;
  List<SymbolMarketCellModel>? get coinPairList =>
      throw _privateConstructorUsedError;
  List<SymbolMarketCellModel>? get starList =>
      throw _privateConstructorUsedError;
  Map<String, bool> get selectMap => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            MarketTabType type,
            List<SymbolMarketCellModel>? coinPairList,
            List<SymbolMarketCellModel>? starList,
            Map<String, bool> selectMap)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            MarketTabType type,
            List<SymbolMarketCellModel>? coinPairList,
            List<SymbolMarketCellModel>? starList,
            Map<String, bool> selectMap)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            MarketTabType type,
            List<SymbolMarketCellModel>? coinPairList,
            List<SymbolMarketCellModel>? starList,
            Map<String, bool> selectMap)?
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
  $MarketViewStateCopyWith<MarketViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketViewStateCopyWith<$Res> {
  factory $MarketViewStateCopyWith(
          MarketViewState value, $Res Function(MarketViewState) then) =
      _$MarketViewStateCopyWithImpl<$Res, MarketViewState>;
  @useResult
  $Res call(
      {MarketTabType type,
      List<SymbolMarketCellModel>? coinPairList,
      List<SymbolMarketCellModel>? starList,
      Map<String, bool> selectMap});
}

/// @nodoc
class _$MarketViewStateCopyWithImpl<$Res, $Val extends MarketViewState>
    implements $MarketViewStateCopyWith<$Res> {
  _$MarketViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? coinPairList = freezed,
    Object? starList = freezed,
    Object? selectMap = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MarketTabType,
      coinPairList: freezed == coinPairList
          ? _value.coinPairList
          : coinPairList // ignore: cast_nullable_to_non_nullable
              as List<SymbolMarketCellModel>?,
      starList: freezed == starList
          ? _value.starList
          : starList // ignore: cast_nullable_to_non_nullable
              as List<SymbolMarketCellModel>?,
      selectMap: null == selectMap
          ? _value.selectMap
          : selectMap // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $MarketViewStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MarketTabType type,
      List<SymbolMarketCellModel>? coinPairList,
      List<SymbolMarketCellModel>? starList,
      Map<String, bool> selectMap});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$MarketViewStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? coinPairList = freezed,
    Object? starList = freezed,
    Object? selectMap = null,
  }) {
    return _then(_$InitialImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MarketTabType,
      coinPairList: freezed == coinPairList
          ? _value._coinPairList
          : coinPairList // ignore: cast_nullable_to_non_nullable
              as List<SymbolMarketCellModel>?,
      starList: freezed == starList
          ? _value._starList
          : starList // ignore: cast_nullable_to_non_nullable
              as List<SymbolMarketCellModel>?,
      selectMap: null == selectMap
          ? _value._selectMap
          : selectMap // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl(
      {this.type = MarketTabType.star,
      final List<SymbolMarketCellModel>? coinPairList,
      final List<SymbolMarketCellModel>? starList,
      final Map<String, bool> selectMap = const {}})
      : _coinPairList = coinPairList,
        _starList = starList,
        _selectMap = selectMap,
        super._();

  @override
  @JsonKey()
  final MarketTabType type;
  final List<SymbolMarketCellModel>? _coinPairList;
  @override
  List<SymbolMarketCellModel>? get coinPairList {
    final value = _coinPairList;
    if (value == null) return null;
    if (_coinPairList is EqualUnmodifiableListView) return _coinPairList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SymbolMarketCellModel>? _starList;
  @override
  List<SymbolMarketCellModel>? get starList {
    final value = _starList;
    if (value == null) return null;
    if (_starList is EqualUnmodifiableListView) return _starList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, bool> _selectMap;
  @override
  @JsonKey()
  Map<String, bool> get selectMap {
    if (_selectMap is EqualUnmodifiableMapView) return _selectMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectMap);
  }

  @override
  String toString() {
    return 'MarketViewState.initial(type: $type, coinPairList: $coinPairList, starList: $starList, selectMap: $selectMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._coinPairList, _coinPairList) &&
            const DeepCollectionEquality().equals(other._starList, _starList) &&
            const DeepCollectionEquality()
                .equals(other._selectMap, _selectMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      const DeepCollectionEquality().hash(_coinPairList),
      const DeepCollectionEquality().hash(_starList),
      const DeepCollectionEquality().hash(_selectMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            MarketTabType type,
            List<SymbolMarketCellModel>? coinPairList,
            List<SymbolMarketCellModel>? starList,
            Map<String, bool> selectMap)
        initial,
  }) {
    return initial(type, coinPairList, starList, selectMap);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            MarketTabType type,
            List<SymbolMarketCellModel>? coinPairList,
            List<SymbolMarketCellModel>? starList,
            Map<String, bool> selectMap)?
        initial,
  }) {
    return initial?.call(type, coinPairList, starList, selectMap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            MarketTabType type,
            List<SymbolMarketCellModel>? coinPairList,
            List<SymbolMarketCellModel>? starList,
            Map<String, bool> selectMap)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(type, coinPairList, starList, selectMap);
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

abstract class _Initial extends MarketViewState {
  const factory _Initial(
      {final MarketTabType type,
      final List<SymbolMarketCellModel>? coinPairList,
      final List<SymbolMarketCellModel>? starList,
      final Map<String, bool> selectMap}) = _$InitialImpl;
  const _Initial._() : super._();

  @override
  MarketTabType get type;
  @override
  List<SymbolMarketCellModel>? get coinPairList;
  @override
  List<SymbolMarketCellModel>? get starList;
  @override
  Map<String, bool> get selectMap;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
