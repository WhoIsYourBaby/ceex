// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderState {
  List<OrderModel>? get nowOrderList =>
      throw _privateConstructorUsedError; // 当前订单
  List<OrderModel>? get historyOrderList =>
      throw _privateConstructorUsedError; // 历史订单
  List<OrderModel>? get historyTransaction =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<OrderModel>? nowOrderList,
            List<OrderModel>? historyOrderList,
            List<OrderModel>? historyTransaction)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<OrderModel>? nowOrderList,
            List<OrderModel>? historyOrderList,
            List<OrderModel>? historyTransaction)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<OrderModel>? nowOrderList,
            List<OrderModel>? historyOrderList,
            List<OrderModel>? historyTransaction)?
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
  $OrderStateCopyWith<OrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStateCopyWith<$Res> {
  factory $OrderStateCopyWith(
          OrderState value, $Res Function(OrderState) then) =
      _$OrderStateCopyWithImpl<$Res, OrderState>;
  @useResult
  $Res call(
      {List<OrderModel>? nowOrderList,
      List<OrderModel>? historyOrderList,
      List<OrderModel>? historyTransaction});
}

/// @nodoc
class _$OrderStateCopyWithImpl<$Res, $Val extends OrderState>
    implements $OrderStateCopyWith<$Res> {
  _$OrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nowOrderList = freezed,
    Object? historyOrderList = freezed,
    Object? historyTransaction = freezed,
  }) {
    return _then(_value.copyWith(
      nowOrderList: freezed == nowOrderList
          ? _value.nowOrderList
          : nowOrderList // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>?,
      historyOrderList: freezed == historyOrderList
          ? _value.historyOrderList
          : historyOrderList // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>?,
      historyTransaction: freezed == historyTransaction
          ? _value.historyTransaction
          : historyTransaction // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $OrderStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<OrderModel>? nowOrderList,
      List<OrderModel>? historyOrderList,
      List<OrderModel>? historyTransaction});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nowOrderList = freezed,
    Object? historyOrderList = freezed,
    Object? historyTransaction = freezed,
  }) {
    return _then(_$InitialImpl(
      nowOrderList: freezed == nowOrderList
          ? _value._nowOrderList
          : nowOrderList // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>?,
      historyOrderList: freezed == historyOrderList
          ? _value._historyOrderList
          : historyOrderList // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>?,
      historyTransaction: freezed == historyTransaction
          ? _value._historyTransaction
          : historyTransaction // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {final List<OrderModel>? nowOrderList,
      final List<OrderModel>? historyOrderList,
      final List<OrderModel>? historyTransaction})
      : _nowOrderList = nowOrderList,
        _historyOrderList = historyOrderList,
        _historyTransaction = historyTransaction;

  final List<OrderModel>? _nowOrderList;
  @override
  List<OrderModel>? get nowOrderList {
    final value = _nowOrderList;
    if (value == null) return null;
    if (_nowOrderList is EqualUnmodifiableListView) return _nowOrderList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// 当前订单
  final List<OrderModel>? _historyOrderList;
// 当前订单
  @override
  List<OrderModel>? get historyOrderList {
    final value = _historyOrderList;
    if (value == null) return null;
    if (_historyOrderList is EqualUnmodifiableListView)
      return _historyOrderList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// 历史订单
  final List<OrderModel>? _historyTransaction;
// 历史订单
  @override
  List<OrderModel>? get historyTransaction {
    final value = _historyTransaction;
    if (value == null) return null;
    if (_historyTransaction is EqualUnmodifiableListView)
      return _historyTransaction;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OrderState.initial(nowOrderList: $nowOrderList, historyOrderList: $historyOrderList, historyTransaction: $historyTransaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._nowOrderList, _nowOrderList) &&
            const DeepCollectionEquality()
                .equals(other._historyOrderList, _historyOrderList) &&
            const DeepCollectionEquality()
                .equals(other._historyTransaction, _historyTransaction));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_nowOrderList),
      const DeepCollectionEquality().hash(_historyOrderList),
      const DeepCollectionEquality().hash(_historyTransaction));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<OrderModel>? nowOrderList,
            List<OrderModel>? historyOrderList,
            List<OrderModel>? historyTransaction)
        initial,
  }) {
    return initial(nowOrderList, historyOrderList, historyTransaction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<OrderModel>? nowOrderList,
            List<OrderModel>? historyOrderList,
            List<OrderModel>? historyTransaction)?
        initial,
  }) {
    return initial?.call(nowOrderList, historyOrderList, historyTransaction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<OrderModel>? nowOrderList,
            List<OrderModel>? historyOrderList,
            List<OrderModel>? historyTransaction)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(nowOrderList, historyOrderList, historyTransaction);
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

abstract class _Initial implements OrderState {
  const factory _Initial(
      {final List<OrderModel>? nowOrderList,
      final List<OrderModel>? historyOrderList,
      final List<OrderModel>? historyTransaction}) = _$InitialImpl;

  @override
  List<OrderModel>? get nowOrderList;
  @override // 当前订单
  List<OrderModel>? get historyOrderList;
  @override // 历史订单
  List<OrderModel>? get historyTransaction;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
