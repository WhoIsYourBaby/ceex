import "package:freezed_annotation/freezed_annotation.dart";
import "package:flutter/foundation.dart";
import 'symbol_model.dart';

part "custom_quote_token.freezed.dart";
part "custom_quote_token.g.dart";

/// 通告
@freezed
class CustomQuoteTokenModel with _$CustomQuoteTokenModel {
  const factory CustomQuoteTokenModel({
    String? orgId,
    String? tokenId,
    String? tokenName,
    int? customOrder,
    int? status,
    List<SymbolModel>? quoteTokenSymbols,
  }) = _CustomQuoteTokenModel;

  factory CustomQuoteTokenModel.fromJson(Map<String, Object?> json) =>
      _$CustomQuoteTokenModelFromJson(json);
}
