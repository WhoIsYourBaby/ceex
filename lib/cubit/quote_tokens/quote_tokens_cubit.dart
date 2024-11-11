import 'package:ceex_flutter/model/appconfig/symbol_model.dart';
import 'package:ceex_flutter/model/quote_tokens/quote_tokens_model.dart';
import 'package:ceex_flutter/repository/publish_repository.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:oktoast/oktoast.dart';

part 'quote_tokens_state.dart';
part 'quote_tokens_cubit.freezed.dart';

class QuoteTokensCubit extends Cubit<QuoteTokensState> {
  QuoteTokensCubit() : super(QuoteTokensState.initial());

  // 获取列表数据
  void getList() {
    showLoading();
    final repo = GetIt.I.get<PublishRepository>();
    final resp = repo.basicTokens();
    resp.then((value) async {
      dismissAllToast();
      emit(state.copyWith(list: value.data));
    });
  }

// 获取网络地址
  geNetList({
    required String tokenType,
    required List<TokenModel> chainList,
  }) {
    for (var element in chainList) {
      if (element.tokenId == tokenType) {
        emit(state.copyWith(quoteTypeList: element.chainTypes!));
        return;
      }
    }
  }
}
