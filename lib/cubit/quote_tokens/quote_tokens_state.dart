part of 'quote_tokens_cubit.dart';

@freezed
class QuoteTokensState with _$QuoteTokensState {

  const factory QuoteTokensState.initial({
    List<QuoteTokensModel>? list,
    List<ChainTypesModel>? quoteTypeList,
    // QuoteType? quoteType,

  }) = _Initial;
}

enum QuoteType{
  token,
  net
}
