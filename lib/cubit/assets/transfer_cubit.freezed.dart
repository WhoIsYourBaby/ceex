// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransferState {
  bool? get showAssets => throw _privateConstructorUsedError; // 是否显示资产
  String? get fromType => throw _privateConstructorUsedError; // 从
  String? get toType => throw _privateConstructorUsedError; // 到
  SubAccountQueryModel? get sourceAssetType =>
      throw _privateConstructorUsedError; //转出账户
  SubAccountQueryModel? get targetAssetType =>
      throw _privateConstructorUsedError; //接收到账账户
  String? get amount => throw _privateConstructorUsedError;
  double? get slideValue => throw _privateConstructorUsedError;
  String? get priceText => throw _privateConstructorUsedError;
  List<SubAccountQueryModel>? get accountList =>
      throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  String? get tokenName => throw _privateConstructorUsedError;
  String? get tokenNameImage => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool? showAssets,
            String? fromType,
            String? toType,
            SubAccountQueryModel? sourceAssetType,
            SubAccountQueryModel? targetAssetType,
            String? amount,
            double? slideValue,
            String? priceText,
            List<SubAccountQueryModel>? accountList,
            bool? success,
            String? tokenName,
            String? tokenNameImage)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool? showAssets,
            String? fromType,
            String? toType,
            SubAccountQueryModel? sourceAssetType,
            SubAccountQueryModel? targetAssetType,
            String? amount,
            double? slideValue,
            String? priceText,
            List<SubAccountQueryModel>? accountList,
            bool? success,
            String? tokenName,
            String? tokenNameImage)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool? showAssets,
            String? fromType,
            String? toType,
            SubAccountQueryModel? sourceAssetType,
            SubAccountQueryModel? targetAssetType,
            String? amount,
            double? slideValue,
            String? priceText,
            List<SubAccountQueryModel>? accountList,
            bool? success,
            String? tokenName,
            String? tokenNameImage)?
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
  $TransferStateCopyWith<TransferState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferStateCopyWith<$Res> {
  factory $TransferStateCopyWith(
          TransferState value, $Res Function(TransferState) then) =
      _$TransferStateCopyWithImpl<$Res, TransferState>;
  @useResult
  $Res call(
      {bool? showAssets,
      String? fromType,
      String? toType,
      SubAccountQueryModel? sourceAssetType,
      SubAccountQueryModel? targetAssetType,
      String? amount,
      double? slideValue,
      String? priceText,
      List<SubAccountQueryModel>? accountList,
      bool? success,
      String? tokenName,
      String? tokenNameImage});

  $SubAccountQueryModelCopyWith<$Res>? get sourceAssetType;
  $SubAccountQueryModelCopyWith<$Res>? get targetAssetType;
}

/// @nodoc
class _$TransferStateCopyWithImpl<$Res, $Val extends TransferState>
    implements $TransferStateCopyWith<$Res> {
  _$TransferStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showAssets = freezed,
    Object? fromType = freezed,
    Object? toType = freezed,
    Object? sourceAssetType = freezed,
    Object? targetAssetType = freezed,
    Object? amount = freezed,
    Object? slideValue = freezed,
    Object? priceText = freezed,
    Object? accountList = freezed,
    Object? success = freezed,
    Object? tokenName = freezed,
    Object? tokenNameImage = freezed,
  }) {
    return _then(_value.copyWith(
      showAssets: freezed == showAssets
          ? _value.showAssets
          : showAssets // ignore: cast_nullable_to_non_nullable
              as bool?,
      fromType: freezed == fromType
          ? _value.fromType
          : fromType // ignore: cast_nullable_to_non_nullable
              as String?,
      toType: freezed == toType
          ? _value.toType
          : toType // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceAssetType: freezed == sourceAssetType
          ? _value.sourceAssetType
          : sourceAssetType // ignore: cast_nullable_to_non_nullable
              as SubAccountQueryModel?,
      targetAssetType: freezed == targetAssetType
          ? _value.targetAssetType
          : targetAssetType // ignore: cast_nullable_to_non_nullable
              as SubAccountQueryModel?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      slideValue: freezed == slideValue
          ? _value.slideValue
          : slideValue // ignore: cast_nullable_to_non_nullable
              as double?,
      priceText: freezed == priceText
          ? _value.priceText
          : priceText // ignore: cast_nullable_to_non_nullable
              as String?,
      accountList: freezed == accountList
          ? _value.accountList
          : accountList // ignore: cast_nullable_to_non_nullable
              as List<SubAccountQueryModel>?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      tokenName: freezed == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenNameImage: freezed == tokenNameImage
          ? _value.tokenNameImage
          : tokenNameImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SubAccountQueryModelCopyWith<$Res>? get sourceAssetType {
    if (_value.sourceAssetType == null) {
      return null;
    }

    return $SubAccountQueryModelCopyWith<$Res>(_value.sourceAssetType!,
        (value) {
      return _then(_value.copyWith(sourceAssetType: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SubAccountQueryModelCopyWith<$Res>? get targetAssetType {
    if (_value.targetAssetType == null) {
      return null;
    }

    return $SubAccountQueryModelCopyWith<$Res>(_value.targetAssetType!,
        (value) {
      return _then(_value.copyWith(targetAssetType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $TransferStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? showAssets,
      String? fromType,
      String? toType,
      SubAccountQueryModel? sourceAssetType,
      SubAccountQueryModel? targetAssetType,
      String? amount,
      double? slideValue,
      String? priceText,
      List<SubAccountQueryModel>? accountList,
      bool? success,
      String? tokenName,
      String? tokenNameImage});

  @override
  $SubAccountQueryModelCopyWith<$Res>? get sourceAssetType;
  @override
  $SubAccountQueryModelCopyWith<$Res>? get targetAssetType;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$TransferStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showAssets = freezed,
    Object? fromType = freezed,
    Object? toType = freezed,
    Object? sourceAssetType = freezed,
    Object? targetAssetType = freezed,
    Object? amount = freezed,
    Object? slideValue = freezed,
    Object? priceText = freezed,
    Object? accountList = freezed,
    Object? success = freezed,
    Object? tokenName = freezed,
    Object? tokenNameImage = freezed,
  }) {
    return _then(_$InitialImpl(
      showAssets: freezed == showAssets
          ? _value.showAssets
          : showAssets // ignore: cast_nullable_to_non_nullable
              as bool?,
      fromType: freezed == fromType
          ? _value.fromType
          : fromType // ignore: cast_nullable_to_non_nullable
              as String?,
      toType: freezed == toType
          ? _value.toType
          : toType // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceAssetType: freezed == sourceAssetType
          ? _value.sourceAssetType
          : sourceAssetType // ignore: cast_nullable_to_non_nullable
              as SubAccountQueryModel?,
      targetAssetType: freezed == targetAssetType
          ? _value.targetAssetType
          : targetAssetType // ignore: cast_nullable_to_non_nullable
              as SubAccountQueryModel?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      slideValue: freezed == slideValue
          ? _value.slideValue
          : slideValue // ignore: cast_nullable_to_non_nullable
              as double?,
      priceText: freezed == priceText
          ? _value.priceText
          : priceText // ignore: cast_nullable_to_non_nullable
              as String?,
      accountList: freezed == accountList
          ? _value._accountList
          : accountList // ignore: cast_nullable_to_non_nullable
              as List<SubAccountQueryModel>?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      tokenName: freezed == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenNameImage: freezed == tokenNameImage
          ? _value.tokenNameImage
          : tokenNameImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.showAssets,
      this.fromType,
      this.toType,
      this.sourceAssetType,
      this.targetAssetType,
      this.amount,
      this.slideValue,
      this.priceText,
      final List<SubAccountQueryModel>? accountList,
      this.success,
      this.tokenName,
      this.tokenNameImage})
      : _accountList = accountList;

  @override
  final bool? showAssets;
// 是否显示资产
  @override
  final String? fromType;
// 从
  @override
  final String? toType;
// 到
  @override
  final SubAccountQueryModel? sourceAssetType;
//转出账户
  @override
  final SubAccountQueryModel? targetAssetType;
//接收到账账户
  @override
  final String? amount;
  @override
  final double? slideValue;
  @override
  final String? priceText;
  final List<SubAccountQueryModel>? _accountList;
  @override
  List<SubAccountQueryModel>? get accountList {
    final value = _accountList;
    if (value == null) return null;
    if (_accountList is EqualUnmodifiableListView) return _accountList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? success;
  @override
  final String? tokenName;
  @override
  final String? tokenNameImage;

  @override
  String toString() {
    return 'TransferState.initial(showAssets: $showAssets, fromType: $fromType, toType: $toType, sourceAssetType: $sourceAssetType, targetAssetType: $targetAssetType, amount: $amount, slideValue: $slideValue, priceText: $priceText, accountList: $accountList, success: $success, tokenName: $tokenName, tokenNameImage: $tokenNameImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.showAssets, showAssets) ||
                other.showAssets == showAssets) &&
            (identical(other.fromType, fromType) ||
                other.fromType == fromType) &&
            (identical(other.toType, toType) || other.toType == toType) &&
            (identical(other.sourceAssetType, sourceAssetType) ||
                other.sourceAssetType == sourceAssetType) &&
            (identical(other.targetAssetType, targetAssetType) ||
                other.targetAssetType == targetAssetType) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.slideValue, slideValue) ||
                other.slideValue == slideValue) &&
            (identical(other.priceText, priceText) ||
                other.priceText == priceText) &&
            const DeepCollectionEquality()
                .equals(other._accountList, _accountList) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.tokenName, tokenName) ||
                other.tokenName == tokenName) &&
            (identical(other.tokenNameImage, tokenNameImage) ||
                other.tokenNameImage == tokenNameImage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      showAssets,
      fromType,
      toType,
      sourceAssetType,
      targetAssetType,
      amount,
      slideValue,
      priceText,
      const DeepCollectionEquality().hash(_accountList),
      success,
      tokenName,
      tokenNameImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool? showAssets,
            String? fromType,
            String? toType,
            SubAccountQueryModel? sourceAssetType,
            SubAccountQueryModel? targetAssetType,
            String? amount,
            double? slideValue,
            String? priceText,
            List<SubAccountQueryModel>? accountList,
            bool? success,
            String? tokenName,
            String? tokenNameImage)
        initial,
  }) {
    return initial(
        showAssets,
        fromType,
        toType,
        sourceAssetType,
        targetAssetType,
        amount,
        slideValue,
        priceText,
        accountList,
        success,
        tokenName,
        tokenNameImage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool? showAssets,
            String? fromType,
            String? toType,
            SubAccountQueryModel? sourceAssetType,
            SubAccountQueryModel? targetAssetType,
            String? amount,
            double? slideValue,
            String? priceText,
            List<SubAccountQueryModel>? accountList,
            bool? success,
            String? tokenName,
            String? tokenNameImage)?
        initial,
  }) {
    return initial?.call(
        showAssets,
        fromType,
        toType,
        sourceAssetType,
        targetAssetType,
        amount,
        slideValue,
        priceText,
        accountList,
        success,
        tokenName,
        tokenNameImage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool? showAssets,
            String? fromType,
            String? toType,
            SubAccountQueryModel? sourceAssetType,
            SubAccountQueryModel? targetAssetType,
            String? amount,
            double? slideValue,
            String? priceText,
            List<SubAccountQueryModel>? accountList,
            bool? success,
            String? tokenName,
            String? tokenNameImage)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          showAssets,
          fromType,
          toType,
          sourceAssetType,
          targetAssetType,
          amount,
          slideValue,
          priceText,
          accountList,
          success,
          tokenName,
          tokenNameImage);
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

abstract class _Initial implements TransferState {
  const factory _Initial(
      {final bool? showAssets,
      final String? fromType,
      final String? toType,
      final SubAccountQueryModel? sourceAssetType,
      final SubAccountQueryModel? targetAssetType,
      final String? amount,
      final double? slideValue,
      final String? priceText,
      final List<SubAccountQueryModel>? accountList,
      final bool? success,
      final String? tokenName,
      final String? tokenNameImage}) = _$InitialImpl;

  @override
  bool? get showAssets;
  @override // 是否显示资产
  String? get fromType;
  @override // 从
  String? get toType;
  @override // 到
  SubAccountQueryModel? get sourceAssetType;
  @override //转出账户
  SubAccountQueryModel? get targetAssetType;
  @override //接收到账账户
  String? get amount;
  @override
  double? get slideValue;
  @override
  String? get priceText;
  @override
  List<SubAccountQueryModel>? get accountList;
  @override
  bool? get success;
  @override
  String? get tokenName;
  @override
  String? get tokenNameImage;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
