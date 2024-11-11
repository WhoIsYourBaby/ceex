import 'package:bloc/bloc.dart';
import 'package:ceex_flutter/model/model.dart';
import 'package:ceex_flutter/model/quote/rate_model.dart';
import 'package:ceex_flutter/repository/repository.dart';
import 'package:ceex_flutter/utils/dio_errors.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:oktoast/oktoast.dart';

part 'home_assets_state.dart';
part 'home_assets_cubit.freezed.dart';

class HomeAssetsCubit extends Cubit<HomeAssetsState> {
  final _userRepo = GetIt.I.get<UserRepository>();
  final _quoteRepo = GetIt.I.get<QuoteRepository>();
  HomeAssetsCubit() : super(HomeAssetsState.initial());

  requestAssets() async {
    final accountId =
        UserInfoManager.shared.userBaseInfoModel?.defaultAccountId;
    if (accountId == null) {
      return;
    }
    showLoading();
    final infoFuture = _userRepo.assetsInfo("USDT");
    final rateFuture = _quoteRepo.rates("BTC,CNY,USD,USDT", "USDT");
    final futureAll = Future.wait([infoFuture, rateFuture]);
    futureAll.then((respList) {
      final respInfo = respList[0];
      final respRate = respList[1];
      final resp = respRate.data as ApiResponse<List<RateModel>?>;
      final rateList = (resp.data ?? []);
      throwIf(rateList.isEmpty, NetError("汇率查询失败"));
      emit(
        state.copyWith(
          assetsInfo: respInfo.data as AssetsInfoModel,
          rate: rateList[0],
        ),
      );
      dismissAllToast();
    }).onError((error, stackTrace) {
      // showMsg(error.toString());
    });
  }
}
