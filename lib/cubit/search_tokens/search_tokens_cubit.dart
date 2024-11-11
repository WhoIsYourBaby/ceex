import 'package:ceex_flutter/model/appconfig/symbol_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_tokens_state.dart';
part 'search_tokens_cubit.freezed.dart';

class SearchTokensCubit extends Cubit<SearchTokensState> {
  List<TokenModel>? tokenModelList;
  List<String> hot = [
    'BTC',
    'ETH',
    'USDT',
    'XRP',
  ];

  SearchTokensCubit()
      : super(const SearchTokensState.initial(
            showSearchResult: false, searchResultList: []));

  // 获取列表数据
  void getList(List<TokenModel> data) {
    tokenModelList = data;
    List<TokenModel> listTokenModel = [];
    Map<String, List<TokenModel>> tokensMap = {};
    // 遍历数据，进行分类聚合
    for (TokenModel token in data) {
      // 先不使用循环 循环会加大不必要的性能消耗
      switch (token.tokenName) {
        case "BTC":
          emit(state.copyWith(hot1: token));
          listTokenModel.add(token);
          break;
        case "ETH":
          emit(state.copyWith(hot2: token));
          listTokenModel.add(token);
          break;
        case "USDT":
          emit(state.copyWith(hot3: token));
          listTokenModel.add(token);
          break;
        case "XRP":
          emit(state.copyWith(hot4: token));
          listTokenModel.add(token);
          break;
        default:
      }
      String firstChar =
          token.tokenName!.substring(0, 1).toUpperCase(); // 提取首字母并转为大写
      if (firstChar.contains(RegExp(r'[A-Z]'))) {
        if (!tokensMap.containsKey(firstChar)) {
          tokensMap[firstChar] = [];
        }
        tokensMap[firstChar]!.add(token);
      } else {
        if (!tokensMap.containsKey("#")) {
          tokensMap["#"] = [];
        }
        tokensMap["#"]!.add(token);
      }
    }
    emit(state.copyWith(tokensMap: tokensMap));
    emit(state.copyWith(hotList: listTokenModel));
    getLetterList(tokensMap);
  }

// 获取字母索引列表
  getLetterList(Map<String, List<TokenModel>> tokensMap) {
    emit(state.copyWith(letterList: tokensMap.keys.toList()));
  }

  // 根据搜索框内容更新数据列表
  upDateSearchView(String keywords, {bool needClose = false}) {
    if (keywords.isEmpty || needClose) {
      emit(state.copyWith(showSearchResult: false));
    } else {
      final searchResults = (tokenModelList ?? [])
          .where(
            (element) =>
                element.tokenName
                    ?.toLowerCase()
                    .contains(keywords.toLowerCase()) ??
                false,
          )
          .toList();
      emit(state.copyWith(
          showSearchResult: true, searchResultList: searchResults));
    }
  }

  // 获取可交易列表数据
  void getCantranTokenList(
      List<TokenModel> data, ShowCanTranTokensType showCanTranTokensType) {
    late List<TokenModel> listTokenModel;
    if (showCanTranTokensType == ShowCanTranTokensType.recharge) {
      // 充值
       listTokenModel = data
        .where((token) =>
            token.allowDeposit ??
            false) // 过滤出 allowDeposit 为 true 的 TokenModel
        .toList();
    }
    if (showCanTranTokensType == ShowCanTranTokensType.withdraw) {
      // 提现
       listTokenModel = data
        .where((token) =>
            token.allowWithdraw ??
            false) // 过滤出 allowWithdraw 为 true 的 TokenModel
        .toList();
    }
    tokenModelList = listTokenModel;
    emit(state.copyWith(tokenList: listTokenModel));
  }
}
