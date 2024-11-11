// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_quote_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomQuoteTokenModel _$CustomQuoteTokenModelFromJson(
    Map<String, dynamic> json) {
  return _CustomQuoteTokenModel.fromJson(json);
}

/// @nodoc
mixin _$CustomQuoteTokenModel {
  String? get orgId => throw _privateConstructorUsedError;
  String? get tokenId => throw _privateConstructorUsedError;
  String? get tokenName => throw _privateConstructorUsedError;
  int? get customOrder => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  List<SymbolModel>? get quoteTokenSymbols =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomQuoteTokenModelCopyWith<CustomQuoteTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomQuoteTokenModelCopyWith<$Res> {
  factory $CustomQuoteTokenModelCopyWith(CustomQuoteTokenModel value,
          $Res Function(CustomQuoteTokenModel) then) =
      _$CustomQuoteTokenModelCopyWithImpl<$Res, CustomQuoteTokenModel>;
  @useResult
  $Res call(
      {String? orgId,
      String? tokenId,
      String? tokenName,
      int? customOrder,
      int? status,
      List<SymbolModel>? quoteTokenSymbols});
}

/// @nodoc
class _$CustomQuoteTokenModelCopyWithImpl<$Res,
        $Val extends CustomQuoteTokenModel>
    implements $CustomQuoteTokenModelCopyWith<$Res> {
  _$CustomQuoteTokenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orgId = freezed,
    Object? tokenId = freezed,
    Object? tokenName = freezed,
    Object? customOrder = freezed,
    Object? status = freezed,
    Object? quoteTokenSymbols = freezed,
  }) {
    return _then(_value.copyWith(
      orgId: freezed == orgId
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenId: freezed == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenName: freezed == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String?,
      customOrder: freezed == customOrder
          ? _value.customOrder
          : customOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      quoteTokenSymbols: freezed == quoteTokenSymbols
          ? _value.quoteTokenSymbols
          : quoteTokenSymbols // ignore: cast_nullable_to_non_nullable
              as List<SymbolModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomQuoteTokenModelImplCopyWith<$Res>
    implements $CustomQuoteTokenModelCopyWith<$Res> {
  factory _$$CustomQuoteTokenModelImplCopyWith(
          _$CustomQuoteTokenModelImpl value,
          $Res Function(_$CustomQuoteTokenModelImpl) then) =
      __$$CustomQuoteTokenModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? orgId,
      String? tokenId,
      String? tokenName,
      int? customOrder,
      int? status,
      List<SymbolModel>? quoteTokenSymbols});
}

/// @nodoc
class __$$CustomQuoteTokenModelImplCopyWithImpl<$Res>
    extends _$CustomQuoteTokenModelCopyWithImpl<$Res,
        _$CustomQuoteTokenModelImpl>
    implements _$$CustomQuoteTokenModelImplCopyWith<$Res> {
  __$$CustomQuoteTokenModelImplCopyWithImpl(_$CustomQuoteTokenModelImpl _value,
      $Res Function(_$CustomQuoteTokenModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orgId = freezed,
    Object? tokenId = freezed,
    Object? tokenName = freezed,
    Object? customOrder = freezed,
    Object? status = freezed,
    Object? quoteTokenSymbols = freezed,
  }) {
    return _then(_$CustomQuoteTokenModelImpl(
      orgId: freezed == orgId
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenId: freezed == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenName: freezed == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String?,
      customOrder: freezed == customOrder
          ? _value.customOrder
          : customOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      quoteTokenSymbols: freezed == quoteTokenSymbols
          ? _value._quoteTokenSymbols
          : quoteTokenSymbols // ignore: cast_nullable_to_non_nullable
              as List<SymbolModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomQuoteTokenModelImpl
    with DiagnosticableTreeMixin
    implements _CustomQuoteTokenModel {
  const _$CustomQuoteTokenModelImpl(
      {this.orgId,
      this.tokenId,
      this.tokenName,
      this.customOrder,
      this.status,
      final List<SymbolModel>? quoteTokenSymbols})
      : _quoteTokenSymbols = quoteTokenSymbols;

  factory _$CustomQuoteTokenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomQuoteTokenModelImplFromJson(json);

  @override
  final String? orgId;
  @override
  final String? tokenId;
  @override
  final String? tokenName;
  @override
  final int? customOrder;
  @override
  final int? status;
  final List<SymbolModel>? _quoteTokenSymbols;
  @override
  List<SymbolModel>? get quoteTokenSymbols {
    final value = _quoteTokenSymbols;
    if (value == null) return null;
    if (_quoteTokenSymbols is EqualUnmodifiableListView)
      return _quoteTokenSymbols;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CustomQuoteTokenModel(orgId: $orgId, tokenId: $tokenId, tokenName: $tokenName, customOrder: $customOrder, status: $status, quoteTokenSymbols: $quoteTokenSymbols)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CustomQuoteTokenModel'))
      ..add(DiagnosticsProperty('orgId', orgId))
      ..add(DiagnosticsProperty('tokenId', tokenId))
      ..add(DiagnosticsProperty('tokenName', tokenName))
      ..add(DiagnosticsProperty('customOrder', customOrder))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('quoteTokenSymbols', quoteTokenSymbols));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomQuoteTokenModelImpl &&
            (identical(other.orgId, orgId) || other.orgId == orgId) &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId) &&
            (identical(other.tokenName, tokenName) ||
                other.tokenName == tokenName) &&
            (identical(other.customOrder, customOrder) ||
                other.customOrder == customOrder) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._quoteTokenSymbols, _quoteTokenSymbols));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orgId,
      tokenId,
      tokenName,
      customOrder,
      status,
      const DeepCollectionEquality().hash(_quoteTokenSymbols));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomQuoteTokenModelImplCopyWith<_$CustomQuoteTokenModelImpl>
      get copyWith => __$$CustomQuoteTokenModelImplCopyWithImpl<
          _$CustomQuoteTokenModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomQuoteTokenModelImplToJson(
      this,
    );
  }
}

abstract class _CustomQuoteTokenModel implements CustomQuoteTokenModel {
  const factory _CustomQuoteTokenModel(
          {final String? orgId,
          final String? tokenId,
          final String? tokenName,
          final int? customOrder,
          final int? status,
          final List<SymbolModel>? quoteTokenSymbols}) =
      _$CustomQuoteTokenModelImpl;

  factory _CustomQuoteTokenModel.fromJson(Map<String, dynamic> json) =
      _$CustomQuoteTokenModelImpl.fromJson;

  @override
  String? get orgId;
  @override
  String? get tokenId;
  @override
  String? get tokenName;
  @override
  int? get customOrder;
  @override
  int? get status;
  @override
  List<SymbolModel>? get quoteTokenSymbols;
  @override
  @JsonKey(ignore: true)
  _$$CustomQuoteTokenModelImplCopyWith<_$CustomQuoteTokenModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
