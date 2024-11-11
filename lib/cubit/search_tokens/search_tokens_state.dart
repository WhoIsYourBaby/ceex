part of 'search_tokens_cubit.dart';

@freezed
class SearchTokensState with _$SearchTokensState {

  const factory SearchTokensState.initial({
    Map<String, List<TokenModel>>? tokensMap,
    List<String>? letterList,
    bool? showSearchResult,
    List<TokenModel>? searchResultList,
    TokenModel? hot1,
    TokenModel? hot2,
    TokenModel? hot3,
    TokenModel? hot4,
    List<TokenModel>? hotList,
    List<TokenModel>? tokenList,
  }) = _Initial;
}
/// 展示可以交易的token
enum ShowCanTranTokensType{
  /// 展示充值结果
  recharge,
  /// 展示提现结果
  withdraw,
}
