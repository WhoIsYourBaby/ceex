import 'dart:async';
import 'dart:collection';

import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/model/appconfig/symbol_model.dart';
import 'package:ceex_flutter/model/assets/account_assets_model.dart';
import 'package:ceex_flutter/model/assets/assets_balance_flow_model.dart';
import 'package:ceex_flutter/model/assets/sub_account_query_model.dart';
import 'package:ceex_flutter/model/user/level_money_model.dart';
import 'package:ceex_flutter/model/user/user_account_money_change_model.dart';
import 'package:ceex_flutter/model/user/user_account_money_model.dart';
import 'package:ceex_flutter/repository/assets_repository.dart';
import 'package:ceex_flutter/repository/repository.dart';
import 'package:ceex_flutter/utils/number_utils.dart';
import 'package:ceex_flutter/utils/piechat/e_chart_bean.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tuple/tuple.dart';

part 'assets_state.dart';
part 'assets_cubit.freezed.dart';

class AssetsCubit extends Cubit<AssetsState> {
  AssetsCubit()
      : super(
          const AssetsState.initial(
            showAssets: false,
            totalType: TotalType.usdtValue,
            btcValue: "0.00",
            usdtValue: "0.00",
            showZero: true,
          ),
        );

  // 获取汇率
  void getRates() {
    final repo = GetIt.I.get<PublishRepository>();
    final formData = FormData.fromMap({
      "tokens": "BTC,USDT",
      "legalCoins": "CNY",
    });
    final resp = repo.quoteV1Rates(formData);
    resp.then((value) {
      double res = double.parse(value.data.data[1].rates.CNY);
      emit(state.copyWith(rates: res));
    });
  }

  initEChartList(AppTheme appTheme) {
    List<EChartPieBean> list = [
      EChartPieBean(
          title: "钱包", number: 0, color: appTheme.colorSet.colorPrimary),
      EChartPieBean(
          title: "合约", number: 0, color: appTheme.colorSet.colorAuxiliary1),
      EChartPieBean(
          title: "杠杆", number: 0, color: appTheme.colorSet.colorPrimary1),
      EChartPieBean(
          title: "财富", number: 0, color: appTheme.colorSet.colorPrimary3),
    ];
    getSubAccount(list);
  }

  // 获取资产数据
  getSubAccount(List<EChartPieBean> list) {
    // 获取钱包数据
    showLoading();
    final repo = GetIt.I.get<AssetsRepository>();
    final resp = repo.subAccountQuery();
    resp.then((value) async {
      getMoney(value.data, list);
      // getValue(value.data);
    });
  }

  getMoney(List<SubAccountQueryModel> value, List<EChartPieBean> list) async {
    List<Future<AccountAssetsModel>> futures = [];
    for (var i = 0; i < value.length; i++) {
      WalletType walletType;
      if (value[i].accountType == 1) {
        if (value[i].accountIndex == 0) {
          //钱包主账户
          walletType = WalletType.wallet;
        } else {
          walletType = WalletType.wallet;
        }
      } else if (value[i].accountType == 2) {
        // 财富主账户
        if (value[i].accountIndex == 0) {
          walletType = WalletType.contract;
        } else {
          walletType = WalletType.contract;
        }
      } else if (value[i].accountType == 3) {
        // 合约主账户
        if (value[i].accountIndex == 0) {
          walletType = WalletType.financing;
        } else {
          walletType = WalletType.financing;
        }
      } else if (value[i].accountType == 27) {
        // 杠杆主账户
        if (value[i].accountIndex == 0) {
          walletType = WalletType.lever;
        } else {
          walletType = WalletType.lever;
        }
      } else {
        walletType = WalletType.other;
      }
      futures.add(getTransferAvailable(
          accountIndex: value[i].accountIndex,
          accountType: value[i].accountType,
          walletType: walletType));
    }
    List<AccountAssetsModel> results = await Future.wait(futures);
    await putValue(results, list).then((value) {
      if (value.item2 > 0) {
        emit(state.copyWith(eChartList: value.item1));
      }
    });
    dismissAllToast();
  }

  Future<Tuple2<List<EChartPieBean>, double>> putValue(
      List<AccountAssetsModel> money, List<EChartPieBean> list) async {
    double price = 0;
    await Future.forEach(money, (AccountAssetsModel sub) async {
      price += double.parse(sub.usdtValue ?? "0");
      if (sub.walletType == WalletType.wallet) {
        list[0].number = double.parse(NumberUtils.addString(
            list[0].number.toString(), sub.usdtValue ?? "0"));
        emit(state.copyWith(walletMoney: list[0].number.toString()));
        // num totalValue = 0;
        // list.forEach((element) {
        //   totalValue += element.number;
        // });
        // emit(state.copyWith(
        //     walletMoney: list[0].number.toString(),
        //     usdtValue: totalValue.toString()));
      } else if (sub.walletType == WalletType.contract) {
        // 财富主账户
        list[3].number = double.parse(NumberUtils.addString(
            list[3].number.toString(), sub.usdtValue ?? "0"));
        emit(state.copyWith(contractMoney: list[3].number.toString()));
      } else if (sub.walletType == WalletType.financing) {
        // 合约主账户
        list[1].number = double.parse(NumberUtils.addString(
            list[1].number.toString(), sub.usdtValue ?? "0"));
        emit(state.copyWith(financingtMoney: list[1].number.toString()));
      } else if (sub.walletType == WalletType.lever) {
        // 杠杆主账户
        list[2].number = double.parse(NumberUtils.addString(
            list[2].number.toString(), sub.usdtValue ?? "0"));
        emit(state.copyWith(leverMoney: list[2].number.toString()));
      }
    });
    return Tuple2(list, price);
  }

  // 获取资产值
  Future<AccountAssetsModel> getTransferAvailable({
    required accountType,
    required accountIndex,
    required WalletType walletType,
  }) async {
    final repo = GetIt.I.get<AssetsRepository>();
    final formData = FormData.fromMap({
      "token_id": "USDT",
      "account_type": accountType,
      "account_index": accountIndex,
    });
    // final resp = await repo.transferAvailable(formData);
    final resp = await repo.accountGet(formData);
    // final TransferAvailableModel transferAvailableModel =
    //     resp.data.copyWith(walletType: walletType);
    final AccountAssetsModel transferAvailableModel =
        resp.data.copyWith(walletType: walletType);
    return transferAvailableModel;
  }

  getAssets() {
    final repo = GetIt.I.get<AssetsRepository>();
    final infoFuture = repo.assetsInfo("USDT");
    infoFuture.then((value) {
      emit(state.copyWith(usdtValue: value.data.totalAsset));
    });
  }

  // getAssets() {
  //   final repo = GetIt.I.get<AssetsRepository>();
  //   final infoFuture = repo.accountGet();
  //   infoFuture.then((value) {
  //     print("=========");
  //     print(value.data);
  //     print("=========");
  //     // emit(state.copyWith(usdtValue: value.data.totalAsset));
  //   });
  // }

  void changeAssetstype() {
    // if (state.totalType == TotalType.btcValue) {
    emit(state.copyWith(totalType: TotalType.usdtValue));
    // } else {
    // emit(state.copyWith(totalType: TotalType.btcValue));
    // }
  }

  // 改变是否展示资产状态
  void changeShowAssets() {
    emit(state.copyWith(showAssets: !state.showAssets!));
  }

  void showZeroassets() {
    emit(state.copyWith(showZero: !state.showZero!));
  }

  // 获取资产列表
  getAssetsList(List<TokenModel> valueList) {
    showLoading();
    LinkedHashMap<String, UserAccountMoneyChangeModel> tokenMap =
        LinkedHashMap();
    for (TokenModel tokenModel in valueList) {
      if (tokenModel.tokenId == "USDT") {
        print(tokenModel);
        // print(tokenModel.baseTokenSymbols![0].quotePrecision);
      }
      UserAccountMoneyChangeModel userAccountMoneyModel;
      if (tokenModel.baseTokenSymbols!.isEmpty) {
        userAccountMoneyModel = UserAccountMoneyChangeModel(
            tokenId: tokenModel.tokenId ?? "",
            tokenName: tokenModel.tokenName ?? "--",
            tokenFullName: tokenModel.tokenFullName ?? "--",
            total: "0.00",
            iconUrl: tokenModel.iconUrl ?? "",
            quotePrecision: "-1");
      } else {
        userAccountMoneyModel = UserAccountMoneyChangeModel(
            tokenId: tokenModel.tokenId ?? "",
            tokenName: tokenModel.tokenName ?? "--",
            tokenFullName: tokenModel.tokenFullName ?? "--",
            total: "0.00",
            iconUrl: tokenModel.iconUrl ?? "",
            quotePrecision:
                tokenModel.baseTokenSymbols![0].quotePrecision ?? "0");
      }

      tokenMap[tokenModel.tokenId ?? ""] = userAccountMoneyModel;
    }
    finalGetAssets(tokenMap);
  }

  // 再获取资产列表
  finalGetAssets(LinkedHashMap<String, UserAccountMoneyChangeModel> tokenMap) {
    final repo = GetIt.I.get<UserRepository>();
    final resp = repo.assetGetChange();
    resp.then((value) {
      List<UserAccountMoneyChangeModel> tokenList = [];
      for (UserAccountMoneyChangeModel userAccountMoneyModel in value.data) {
        String token = userAccountMoneyModel.tokenId!;
        UserAccountMoneyChangeModel item = tokenMap[token]!;
        userAccountMoneyModel.iconUrl = item.iconUrl;
        userAccountMoneyModel.tokenFullName = item.tokenFullName;
        tokenMap[token] = userAccountMoneyModel;
        userAccountMoneyModel.quotePrecision = item.quotePrecision;
      }
      tokenMap.forEach((key, value) {
        tokenList.add(value);
      });
      emit(state.copyWith(zichanList: tokenList));
      dismissAllToast();
    });
  }

  // 获取合约账户信息
  getConnectMoney(List<TokenModel> valueList) {
    showLoading();
    final repo = GetIt.I.get<AssetsRepository>();
    final formData = FormData.fromMap({
      "account_type": 3,
    });
    final resp = repo.accountGet(formData);
    resp.then((value) {
      List<UserAccountMoneyModel> balanceList = [];
      valueList.forEach((token) {
        for (var i = 0; i < value.data.balance!.length; i++) {
          if (token.tokenId == value.data.balance![i].tokenId) {
            balanceList.add(UserAccountMoneyModel(
              tokenId: value.data.balance![i].tokenId ?? "",
              tokenName: value.data.balance![i].tokenName ?? "--",
              tokenFullName: token.tokenFullName ?? "--",
              total: value.data.balance![i].total,
              iconUrl: token.iconUrl ?? "",
            ));
          }
        }
      });
      emit(state.copyWith(connectMoneyList: balanceList));
      dismissAllToast();
    });
  }

  // 获取杠杆账户信息
  getLevelMoney(List<TokenModel> valueList) {
    showLoading();
    final repo = GetIt.I.get<AssetsRepository>();
    final resp = repo.marginAssetsGet();
    resp.then((value) {
      List<LevelMoneyModel> levelModelList = [];
      for (LevelMoneyModel levelModel in value.data) {
        valueList.forEach((element) {
          if (element.tokenId == levelModel.tokenId) {
            LevelMoneyModel updatedModel =
                levelModel.copyWith(iconUrl: element.iconUrl);
            levelModelList.add(updatedModel);
          }
        });
      }
      emit(state.copyWith(leverMoneyList: levelModelList));
      dismissAllToast();
    });
  }
}
