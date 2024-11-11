import 'package:ceex_flutter/l10n/gen/app_localizations.dart';
import 'package:ceex_flutter/model/assets/sub_account_query_model.dart';
import 'package:ceex_flutter/repository/assets_repository.dart';
import 'package:ceex_flutter/utils/number_utils.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:oktoast/oktoast.dart';

part 'transfer_state.dart';
part 'transfer_cubit.freezed.dart';

// 划转
class TransferCubit extends Cubit<TransferState> {
  TransferCubit() : super(TransferState.initial(tokenName: "USDT"));

  // 初始化
  void init(BuildContext context) {
    showLoading();
    final repo = GetIt.I.get<AssetsRepository>();
    final resp = repo.subAccountQuery();
    resp.then((value) {
      List<SubAccountQueryModel> list = [];
      for (SubAccountQueryModel s in value.data) {
        if (s.accountType == 1) {
          // 钱包
          if (s.accountIndex == 0) {
            //设置转出账户  默认钱包主账户转出
            SubAccountQueryModel v = s.copyWith(
                accountName: AppLocalizations.of(context)!.wallet,
                canChoose: false);
            emit(state.copyWith(sourceAssetType: v));
          }
        } else if (s.accountType == 2) {
          // 期权
          if (s.accountIndex == 0) {
            // emit(state.copyWith(toType: "期权"));
          }
        } else if (s.accountType == 3) {
          // 合约
          if (s.accountIndex == 0) {
            //设置接收账户 - 默认优先级，优先默认合约主账户，然后默认和转出账号不同
            SubAccountQueryModel v = s.copyWith(
                accountName: AppLocalizations.of(context)!.contract,
                canChoose: true);
            emit(state.copyWith(
              targetAssetType: v,
            ));
          }
        } else if (s.accountType == 27) {
          // 杠杆
          if (s.accountIndex == 0) {
            // emit(state.copyWith(toType: "杠杆"));
          }
        }
        // 设置可选账户列表
        if (!(s.accountType == 1 && s.accountIndex == 0)) {
          if (s.accountIndex == 0 && s.accountType == 3) {
            //设置接收账户 - 默认优先级，优先默认合约主账户，然后默认和转出账号不同
            SubAccountQueryModel v = s.copyWith(
                accountName: AppLocalizations.of(context)!.contract,
                canChoose: true);
            list.add(v);
          } else {
            SubAccountQueryModel v = s.copyWith(canChoose: true);
            list.add(v);
          }
        }
      }
      emit(state.copyWith(
        accountList: list,
      ));
      getTransferAvailable();
    });
  }

  // 更改资产类型
  changeSelectAssetsType() {
    SubAccountQueryModel save = state.sourceAssetType!;
    emit(state.copyWith(sourceAssetType: state.targetAssetType));
    emit(state.copyWith(targetAssetType: save));
    showLoading();
    getTransferAvailable();
  }

  // 设置选中的资产类型
  setSelectAssetType({
    required bool isFromAsset,
    required SubAccountQueryModel s,
  }) {
    if (isFromAsset) {
      emit(state.copyWith(sourceAssetType: s));
    } else {
      emit(state.copyWith(targetAssetType: s));
    }
  }

  setToAsset(SubAccountQueryModel s) {
    // emit(state)
  }

  // 获取用户可划转资产信息
  getTransferAvailable() {
    final repo = GetIt.I.get<AssetsRepository>();
    final formData = FormData.fromMap({
      "token_id": state.tokenName,
      "account_type": state.sourceAssetType!.accountType,
      "account_index": state.sourceAssetType!.accountIndex,
    });
    final resp = repo.transferAvailable(formData);
    resp.then((value) {
      dismissAllToast();
      emit(state.copyWith(amount: value.data.amount));
    });
  }

  // 更新进度条数据
  void upDateSlideValue(String e) {
    emit(state.copyWith(priceText: e));
    double j = NumberUtils.divReverse(e, state.amount!);
    emit(state.copyWith(slideValue: j));
  }

  // 更新输入框价格
  void upDatePriceValue({
    required double slideValue,
  }) {
    emit(state.copyWith(slideValue: slideValue));
    String value = slideValue.toStringAsFixed(2);
    String j = NumberUtils.pricePercent(value, state.amount!).toString();
    emit(state.copyWith(priceText: j));
  }

  // 设置数据为全部
  void setAllValue() {
    emit(state.copyWith(slideValue: 100));
    emit(state.copyWith(priceText: state.amount));
  }

  // 转账
  void transfer() {
    showLoading();
    final repo = GetIt.I.get<AssetsRepository>();
    final formData = FormData.fromMap({
      "token_id": state.tokenName,
      "amount": state.priceText ?? 0,
      "from_account_type": state.sourceAssetType!.accountType,
      "from_account_index": state.sourceAssetType!.accountIndex,
      "to_account_type": state.targetAssetType!.accountType,
      "to_account_index": state.targetAssetType!.accountIndex,
    });
    final resp = repo.subAccountTransfer(formData);
    resp.then((value) {
      dismissAllToast();
      emit(state.copyWith(success: true));
    });
  }

  void changeTokenName(String name,String imageUrl) {
    emit(state.copyWith(tokenName: name,tokenNameImage:imageUrl));
    showLoading();
    getTransferAvailable();
  }
}
