import 'package:ceex_flutter/model/assets/recharge_qr_code_model.dart';
import 'package:ceex_flutter/repository/assets_repository.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:oktoast/oktoast.dart';

part 'recharge_state.dart';
part 'recharge_cubit.freezed.dart';

class RechargeCubit extends Cubit<RechargeState> {
  RechargeCubit() : super(RechargeState.initial());
  // 获取充币地址
  void getDepositAddress({required String tokenId, required String chainType}) {
    showLoading();
    final repo = GetIt.I.get<AssetsRepository>();
    final resp = repo.depositAddress(tokenId, chainType);
    resp.then((value) async {
      dismissAllToast();
      emit(state.copyWith(model: value.data));
    });
  }

  // 更新充币地址
  void upDateAddress({required String tokenId, required String chainType}) {
    showLoading();
    final repo = GetIt.I.get<AssetsRepository>();
    final resp = repo.depositAddress(tokenId, chainType);
    resp.then((value) async {
      dismissAllToast();
      emit(state.copyWith(model: value.data));
    });
  }
}
