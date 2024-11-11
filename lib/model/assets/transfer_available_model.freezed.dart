// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_available_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransferAvailableModel _$TransferAvailableModelFromJson(
    Map<String, dynamic> json) {
  return _TransferAvailableModel.fromJson(json);
}

/// @nodoc
mixin _$TransferAvailableModel {
  String? get amount => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  WalletType? get walletType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransferAvailableModelCopyWith<TransferAvailableModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferAvailableModelCopyWith<$Res> {
  factory $TransferAvailableModelCopyWith(TransferAvailableModel value,
          $Res Function(TransferAvailableModel) then) =
      _$TransferAvailableModelCopyWithImpl<$Res, TransferAvailableModel>;
  @useResult
  $Res call({String? amount, bool? success, WalletType? walletType});
}

/// @nodoc
class _$TransferAvailableModelCopyWithImpl<$Res,
        $Val extends TransferAvailableModel>
    implements $TransferAvailableModelCopyWith<$Res> {
  _$TransferAvailableModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? success = freezed,
    Object? walletType = freezed,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      walletType: freezed == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as WalletType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransferAvailableModelImplCopyWith<$Res>
    implements $TransferAvailableModelCopyWith<$Res> {
  factory _$$TransferAvailableModelImplCopyWith(
          _$TransferAvailableModelImpl value,
          $Res Function(_$TransferAvailableModelImpl) then) =
      __$$TransferAvailableModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? amount, bool? success, WalletType? walletType});
}

/// @nodoc
class __$$TransferAvailableModelImplCopyWithImpl<$Res>
    extends _$TransferAvailableModelCopyWithImpl<$Res,
        _$TransferAvailableModelImpl>
    implements _$$TransferAvailableModelImplCopyWith<$Res> {
  __$$TransferAvailableModelImplCopyWithImpl(
      _$TransferAvailableModelImpl _value,
      $Res Function(_$TransferAvailableModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? success = freezed,
    Object? walletType = freezed,
  }) {
    return _then(_$TransferAvailableModelImpl(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      walletType: freezed == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as WalletType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransferAvailableModelImpl implements _TransferAvailableModel {
  const _$TransferAvailableModelImpl(
      {this.amount, this.success, this.walletType});

  factory _$TransferAvailableModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransferAvailableModelImplFromJson(json);

  @override
  final String? amount;
  @override
  final bool? success;
  @override
  final WalletType? walletType;

  @override
  String toString() {
    return 'TransferAvailableModel(amount: $amount, success: $success, walletType: $walletType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferAvailableModelImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.walletType, walletType) ||
                other.walletType == walletType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, success, walletType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferAvailableModelImplCopyWith<_$TransferAvailableModelImpl>
      get copyWith => __$$TransferAvailableModelImplCopyWithImpl<
          _$TransferAvailableModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransferAvailableModelImplToJson(
      this,
    );
  }
}

abstract class _TransferAvailableModel implements TransferAvailableModel {
  const factory _TransferAvailableModel(
      {final String? amount,
      final bool? success,
      final WalletType? walletType}) = _$TransferAvailableModelImpl;

  factory _TransferAvailableModel.fromJson(Map<String, dynamic> json) =
      _$TransferAvailableModelImpl.fromJson;

  @override
  String? get amount;
  @override
  bool? get success;
  @override
  WalletType? get walletType;
  @override
  @JsonKey(ignore: true)
  _$$TransferAvailableModelImplCopyWith<_$TransferAvailableModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
