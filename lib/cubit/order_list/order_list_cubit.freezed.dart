// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderListState {
  OrderListViewType get viewType => throw _privateConstructorUsedError;
  List<OrderListModel>? get depositList => throw _privateConstructorUsedError;
  List<OrderListModel>? get withdrawList => throw _privateConstructorUsedError;
  List<AssetsBalanceFlowModel>? get otherList =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            OrderListViewType viewType,
            List<OrderListModel>? depositList,
            List<OrderListModel>? withdrawList,
            List<AssetsBalanceFlowModel>? otherList)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            OrderListViewType viewType,
            List<OrderListModel>? depositList,
            List<OrderListModel>? withdrawList,
            List<AssetsBalanceFlowModel>? otherList)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            OrderListViewType viewType,
            List<OrderListModel>? depositList,
            List<OrderListModel>? withdrawList,
            List<AssetsBalanceFlowModel>? otherList)?
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
  $OrderListStateCopyWith<OrderListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderListStateCopyWith<$Res> {
  factory $OrderListStateCopyWith(
          OrderListState value, $Res Function(OrderListState) then) =
      _$OrderListStateCopyWithImpl<$Res, OrderListState>;
  @useResult
  $Res call(
      {OrderListViewType viewType,
      List<OrderListModel>? depositList,
      List<OrderListModel>? withdrawList,
      List<AssetsBalanceFlowModel>? otherList});
}

/// @nodoc
class _$OrderListStateCopyWithImpl<$Res, $Val extends OrderListState>
    implements $OrderListStateCopyWith<$Res> {
  _$OrderListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewType = null,
    Object? depositList = freezed,
    Object? withdrawList = freezed,
    Object? otherList = freezed,
  }) {
    return _then(_value.copyWith(
      viewType: null == viewType
          ? _value.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as OrderListViewType,
      depositList: freezed == depositList
          ? _value.depositList
          : depositList // ignore: cast_nullable_to_non_nullable
              as List<OrderListModel>?,
      withdrawList: freezed == withdrawList
          ? _value.withdrawList
          : withdrawList // ignore: cast_nullable_to_non_nullable
              as List<OrderListModel>?,
      otherList: freezed == otherList
          ? _value.otherList
          : otherList // ignore: cast_nullable_to_non_nullable
              as List<AssetsBalanceFlowModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $OrderListStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OrderListViewType viewType,
      List<OrderListModel>? depositList,
      List<OrderListModel>? withdrawList,
      List<AssetsBalanceFlowModel>? otherList});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$OrderListStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewType = null,
    Object? depositList = freezed,
    Object? withdrawList = freezed,
    Object? otherList = freezed,
  }) {
    return _then(_$InitialImpl(
      viewType: null == viewType
          ? _value.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as OrderListViewType,
      depositList: freezed == depositList
          ? _value._depositList
          : depositList // ignore: cast_nullable_to_non_nullable
              as List<OrderListModel>?,
      withdrawList: freezed == withdrawList
          ? _value._withdrawList
          : withdrawList // ignore: cast_nullable_to_non_nullable
              as List<OrderListModel>?,
      otherList: freezed == otherList
          ? _value._otherList
          : otherList // ignore: cast_nullable_to_non_nullable
              as List<AssetsBalanceFlowModel>?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.viewType = OrderListViewType.deposit,
      final List<OrderListModel>? depositList,
      final List<OrderListModel>? withdrawList,
      final List<AssetsBalanceFlowModel>? otherList})
      : _depositList = depositList,
        _withdrawList = withdrawList,
        _otherList = otherList;

  @override
  @JsonKey()
  final OrderListViewType viewType;
  final List<OrderListModel>? _depositList;
  @override
  List<OrderListModel>? get depositList {
    final value = _depositList;
    if (value == null) return null;
    if (_depositList is EqualUnmodifiableListView) return _depositList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<OrderListModel>? _withdrawList;
  @override
  List<OrderListModel>? get withdrawList {
    final value = _withdrawList;
    if (value == null) return null;
    if (_withdrawList is EqualUnmodifiableListView) return _withdrawList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AssetsBalanceFlowModel>? _otherList;
  @override
  List<AssetsBalanceFlowModel>? get otherList {
    final value = _otherList;
    if (value == null) return null;
    if (_otherList is EqualUnmodifiableListView) return _otherList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OrderListState.initial(viewType: $viewType, depositList: $depositList, withdrawList: $withdrawList, otherList: $otherList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.viewType, viewType) ||
                other.viewType == viewType) &&
            const DeepCollectionEquality()
                .equals(other._depositList, _depositList) &&
            const DeepCollectionEquality()
                .equals(other._withdrawList, _withdrawList) &&
            const DeepCollectionEquality()
                .equals(other._otherList, _otherList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      viewType,
      const DeepCollectionEquality().hash(_depositList),
      const DeepCollectionEquality().hash(_withdrawList),
      const DeepCollectionEquality().hash(_otherList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            OrderListViewType viewType,
            List<OrderListModel>? depositList,
            List<OrderListModel>? withdrawList,
            List<AssetsBalanceFlowModel>? otherList)
        initial,
  }) {
    return initial(viewType, depositList, withdrawList, otherList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            OrderListViewType viewType,
            List<OrderListModel>? depositList,
            List<OrderListModel>? withdrawList,
            List<AssetsBalanceFlowModel>? otherList)?
        initial,
  }) {
    return initial?.call(viewType, depositList, withdrawList, otherList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            OrderListViewType viewType,
            List<OrderListModel>? depositList,
            List<OrderListModel>? withdrawList,
            List<AssetsBalanceFlowModel>? otherList)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(viewType, depositList, withdrawList, otherList);
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

abstract class _Initial implements OrderListState {
  const factory _Initial(
      {final OrderListViewType viewType,
      final List<OrderListModel>? depositList,
      final List<OrderListModel>? withdrawList,
      final List<AssetsBalanceFlowModel>? otherList}) = _$InitialImpl;

  @override
  OrderListViewType get viewType;
  @override
  List<OrderListModel>? get depositList;
  @override
  List<OrderListModel>? get withdrawList;
  @override
  List<AssetsBalanceFlowModel>? get otherList;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
