// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_market_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeMarketState {
  HomeTabType get type => throw _privateConstructorUsedError;
  List<KlineModel>? get marketList => throw _privateConstructorUsedError;
  List<FavoriteModel>? get favoriteList => throw _privateConstructorUsedError;
  List<KlineModel>? get favoriteMarketList =>
      throw _privateConstructorUsedError; // 收藏
  List<SymbolMarketCellModel>? get favList =>
      throw _privateConstructorUsedError; // 热门
  List<SymbolMarketCellModel>? get hotList =>
      throw _privateConstructorUsedError; // 涨幅
  List<SymbolMarketCellModel>? get topList =>
      throw _privateConstructorUsedError; // 新币
  List<SymbolMarketCellModel>? get newList =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            HomeTabType type,
            List<KlineModel>? marketList,
            List<FavoriteModel>? favoriteList,
            List<KlineModel>? favoriteMarketList,
            List<SymbolMarketCellModel>? favList,
            List<SymbolMarketCellModel>? hotList,
            List<SymbolMarketCellModel>? topList,
            List<SymbolMarketCellModel>? newList)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            HomeTabType type,
            List<KlineModel>? marketList,
            List<FavoriteModel>? favoriteList,
            List<KlineModel>? favoriteMarketList,
            List<SymbolMarketCellModel>? favList,
            List<SymbolMarketCellModel>? hotList,
            List<SymbolMarketCellModel>? topList,
            List<SymbolMarketCellModel>? newList)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            HomeTabType type,
            List<KlineModel>? marketList,
            List<FavoriteModel>? favoriteList,
            List<KlineModel>? favoriteMarketList,
            List<SymbolMarketCellModel>? favList,
            List<SymbolMarketCellModel>? hotList,
            List<SymbolMarketCellModel>? topList,
            List<SymbolMarketCellModel>? newList)?
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
  $HomeMarketStateCopyWith<HomeMarketState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeMarketStateCopyWith<$Res> {
  factory $HomeMarketStateCopyWith(
          HomeMarketState value, $Res Function(HomeMarketState) then) =
      _$HomeMarketStateCopyWithImpl<$Res, HomeMarketState>;
  @useResult
  $Res call(
      {HomeTabType type,
      List<KlineModel>? marketList,
      List<FavoriteModel>? favoriteList,
      List<KlineModel>? favoriteMarketList,
      List<SymbolMarketCellModel>? favList,
      List<SymbolMarketCellModel>? hotList,
      List<SymbolMarketCellModel>? topList,
      List<SymbolMarketCellModel>? newList});
}

/// @nodoc
class _$HomeMarketStateCopyWithImpl<$Res, $Val extends HomeMarketState>
    implements $HomeMarketStateCopyWith<$Res> {
  _$HomeMarketStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? marketList = freezed,
    Object? favoriteList = freezed,
    Object? favoriteMarketList = freezed,
    Object? favList = freezed,
    Object? hotList = freezed,
    Object? topList = freezed,
    Object? newList = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HomeTabType,
      marketList: freezed == marketList
          ? _value.marketList
          : marketList // ignore: cast_nullable_to_non_nullable
              as List<KlineModel>?,
      favoriteList: freezed == favoriteList
          ? _value.favoriteList
          : favoriteList // ignore: cast_nullable_to_non_nullable
              as List<FavoriteModel>?,
      favoriteMarketList: freezed == favoriteMarketList
          ? _value.favoriteMarketList
          : favoriteMarketList // ignore: cast_nullable_to_non_nullable
              as List<KlineModel>?,
      favList: freezed == favList
          ? _value.favList
          : favList // ignore: cast_nullable_to_non_nullable
              as List<SymbolMarketCellModel>?,
      hotList: freezed == hotList
          ? _value.hotList
          : hotList // ignore: cast_nullable_to_non_nullable
              as List<SymbolMarketCellModel>?,
      topList: freezed == topList
          ? _value.topList
          : topList // ignore: cast_nullable_to_non_nullable
              as List<SymbolMarketCellModel>?,
      newList: freezed == newList
          ? _value.newList
          : newList // ignore: cast_nullable_to_non_nullable
              as List<SymbolMarketCellModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $HomeMarketStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HomeTabType type,
      List<KlineModel>? marketList,
      List<FavoriteModel>? favoriteList,
      List<KlineModel>? favoriteMarketList,
      List<SymbolMarketCellModel>? favList,
      List<SymbolMarketCellModel>? hotList,
      List<SymbolMarketCellModel>? topList,
      List<SymbolMarketCellModel>? newList});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HomeMarketStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? marketList = freezed,
    Object? favoriteList = freezed,
    Object? favoriteMarketList = freezed,
    Object? favList = freezed,
    Object? hotList = freezed,
    Object? topList = freezed,
    Object? newList = freezed,
  }) {
    return _then(_$InitialImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HomeTabType,
      marketList: freezed == marketList
          ? _value._marketList
          : marketList // ignore: cast_nullable_to_non_nullable
              as List<KlineModel>?,
      favoriteList: freezed == favoriteList
          ? _value._favoriteList
          : favoriteList // ignore: cast_nullable_to_non_nullable
              as List<FavoriteModel>?,
      favoriteMarketList: freezed == favoriteMarketList
          ? _value._favoriteMarketList
          : favoriteMarketList // ignore: cast_nullable_to_non_nullable
              as List<KlineModel>?,
      favList: freezed == favList
          ? _value._favList
          : favList // ignore: cast_nullable_to_non_nullable
              as List<SymbolMarketCellModel>?,
      hotList: freezed == hotList
          ? _value._hotList
          : hotList // ignore: cast_nullable_to_non_nullable
              as List<SymbolMarketCellModel>?,
      topList: freezed == topList
          ? _value._topList
          : topList // ignore: cast_nullable_to_non_nullable
              as List<SymbolMarketCellModel>?,
      newList: freezed == newList
          ? _value._newList
          : newList // ignore: cast_nullable_to_non_nullable
              as List<SymbolMarketCellModel>?,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl(
      {required this.type,
      final List<KlineModel>? marketList,
      final List<FavoriteModel>? favoriteList,
      final List<KlineModel>? favoriteMarketList,
      final List<SymbolMarketCellModel>? favList,
      final List<SymbolMarketCellModel>? hotList,
      final List<SymbolMarketCellModel>? topList,
      final List<SymbolMarketCellModel>? newList})
      : _marketList = marketList,
        _favoriteList = favoriteList,
        _favoriteMarketList = favoriteMarketList,
        _favList = favList,
        _hotList = hotList,
        _topList = topList,
        _newList = newList,
        super._();

  @override
  final HomeTabType type;
  final List<KlineModel>? _marketList;
  @override
  List<KlineModel>? get marketList {
    final value = _marketList;
    if (value == null) return null;
    if (_marketList is EqualUnmodifiableListView) return _marketList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<FavoriteModel>? _favoriteList;
  @override
  List<FavoriteModel>? get favoriteList {
    final value = _favoriteList;
    if (value == null) return null;
    if (_favoriteList is EqualUnmodifiableListView) return _favoriteList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<KlineModel>? _favoriteMarketList;
  @override
  List<KlineModel>? get favoriteMarketList {
    final value = _favoriteMarketList;
    if (value == null) return null;
    if (_favoriteMarketList is EqualUnmodifiableListView)
      return _favoriteMarketList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// 收藏
  final List<SymbolMarketCellModel>? _favList;
// 收藏
  @override
  List<SymbolMarketCellModel>? get favList {
    final value = _favList;
    if (value == null) return null;
    if (_favList is EqualUnmodifiableListView) return _favList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// 热门
  final List<SymbolMarketCellModel>? _hotList;
// 热门
  @override
  List<SymbolMarketCellModel>? get hotList {
    final value = _hotList;
    if (value == null) return null;
    if (_hotList is EqualUnmodifiableListView) return _hotList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// 涨幅
  final List<SymbolMarketCellModel>? _topList;
// 涨幅
  @override
  List<SymbolMarketCellModel>? get topList {
    final value = _topList;
    if (value == null) return null;
    if (_topList is EqualUnmodifiableListView) return _topList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// 新币
  final List<SymbolMarketCellModel>? _newList;
// 新币
  @override
  List<SymbolMarketCellModel>? get newList {
    final value = _newList;
    if (value == null) return null;
    if (_newList is EqualUnmodifiableListView) return _newList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HomeMarketState.initial(type: $type, marketList: $marketList, favoriteList: $favoriteList, favoriteMarketList: $favoriteMarketList, favList: $favList, hotList: $hotList, topList: $topList, newList: $newList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._marketList, _marketList) &&
            const DeepCollectionEquality()
                .equals(other._favoriteList, _favoriteList) &&
            const DeepCollectionEquality()
                .equals(other._favoriteMarketList, _favoriteMarketList) &&
            const DeepCollectionEquality().equals(other._favList, _favList) &&
            const DeepCollectionEquality().equals(other._hotList, _hotList) &&
            const DeepCollectionEquality().equals(other._topList, _topList) &&
            const DeepCollectionEquality().equals(other._newList, _newList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      const DeepCollectionEquality().hash(_marketList),
      const DeepCollectionEquality().hash(_favoriteList),
      const DeepCollectionEquality().hash(_favoriteMarketList),
      const DeepCollectionEquality().hash(_favList),
      const DeepCollectionEquality().hash(_hotList),
      const DeepCollectionEquality().hash(_topList),
      const DeepCollectionEquality().hash(_newList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            HomeTabType type,
            List<KlineModel>? marketList,
            List<FavoriteModel>? favoriteList,
            List<KlineModel>? favoriteMarketList,
            List<SymbolMarketCellModel>? favList,
            List<SymbolMarketCellModel>? hotList,
            List<SymbolMarketCellModel>? topList,
            List<SymbolMarketCellModel>? newList)
        initial,
  }) {
    return initial(type, marketList, favoriteList, favoriteMarketList, favList,
        hotList, topList, newList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            HomeTabType type,
            List<KlineModel>? marketList,
            List<FavoriteModel>? favoriteList,
            List<KlineModel>? favoriteMarketList,
            List<SymbolMarketCellModel>? favList,
            List<SymbolMarketCellModel>? hotList,
            List<SymbolMarketCellModel>? topList,
            List<SymbolMarketCellModel>? newList)?
        initial,
  }) {
    return initial?.call(type, marketList, favoriteList, favoriteMarketList,
        favList, hotList, topList, newList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            HomeTabType type,
            List<KlineModel>? marketList,
            List<FavoriteModel>? favoriteList,
            List<KlineModel>? favoriteMarketList,
            List<SymbolMarketCellModel>? favList,
            List<SymbolMarketCellModel>? hotList,
            List<SymbolMarketCellModel>? topList,
            List<SymbolMarketCellModel>? newList)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(type, marketList, favoriteList, favoriteMarketList,
          favList, hotList, topList, newList);
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

abstract class _Initial extends HomeMarketState {
  const factory _Initial(
      {required final HomeTabType type,
      final List<KlineModel>? marketList,
      final List<FavoriteModel>? favoriteList,
      final List<KlineModel>? favoriteMarketList,
      final List<SymbolMarketCellModel>? favList,
      final List<SymbolMarketCellModel>? hotList,
      final List<SymbolMarketCellModel>? topList,
      final List<SymbolMarketCellModel>? newList}) = _$InitialImpl;
  const _Initial._() : super._();

  @override
  HomeTabType get type;
  @override
  List<KlineModel>? get marketList;
  @override
  List<FavoriteModel>? get favoriteList;
  @override
  List<KlineModel>? get favoriteMarketList;
  @override // 收藏
  List<SymbolMarketCellModel>? get favList;
  @override // 热门
  List<SymbolMarketCellModel>? get hotList;
  @override // 涨幅
  List<SymbolMarketCellModel>? get topList;
  @override // 新币
  List<SymbolMarketCellModel>? get newList;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
