import 'dart:async';

import 'package:ceex_flutter/model/user/user_base_info_model.dart';
import 'package:ceex_flutter/repository/user_repository.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';
import 'package:oktoast/oktoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'safe_center_view_state.dart';
part 'safe_center_view_cubit.freezed.dart';

class SafeCenterViewCubit extends Cubit<SafeCenterViewState> {
  SafeCenterViewCubit()
      : super(SafeCenterViewState.initial(
            userBaseInfoModel: UserInfoManager.shared.userBaseInfoModel!,
            bindPassword:
                UserInfoManager.shared.userBaseInfoModel?.bindPassword ?? false,
            bindGA: UserInfoManager.shared.userBaseInfoModel?.bindGA ?? false,
            bindTradePwd:
                UserInfoManager.shared.userBaseInfoModel?.bindTradePwd ?? false,
            email: UserInfoManager.shared.userBaseInfoModel?.email ?? "",
            phone: UserInfoManager.shared.userBaseInfoModel?.mobile ?? ""));
  final String spFingerString = "sp_finger_key";
  checkSafeLevel() {
    int count = 0;
    getFingerBindStatus().then((value) {
      if ((state.email ?? "").isNotEmpty) count++;
      if ((state.phone ?? "").isNotEmpty) count++;
      if (state.bindGA ?? false) count++;
      if (state.bindFinger ?? false) count++;
      if (count < 2) {
        emit(state.copyWith(safeLavel: SafeLavel.low));
      } else if (count == 2) {
        emit(state.copyWith(safeLavel: SafeLavel.middle));
      } else {
        emit(state.copyWith(safeLavel: SafeLavel.height));
      }
    });
  }

  getUserInfo() {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final resp = repo.getBaseInfo();
    resp.then((value) {
      UserInfoManager.shared.saveUserBaseInfo(value.data);
      dismissAllToast();
    });
  }

  Future<void> getFingerBindStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isBind = prefs.getBool(spFingerString) ?? false;
    if (isBind) {
      emit(state.copyWith(bindFinger: true));
    } else {
      emit(state.copyWith(bindFinger: false));
    }
    // 创建一个 Completer 来通知异步操作完成
    Completer<void> completer = Completer<void>();
    completer.complete();
    return completer.future;
  }

  bindFinger() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final LocalAuthentication auth = LocalAuthentication();
    bool can = await auth.canCheckBiometrics;
    bool authenticated = false;
    if (!can) {
      showMsg("设备不支持或未开启权限");
      return;
    }
    authenticated = await auth.authenticate(
        localizedReason: '扫描指纹进行身份验证',
        options: const AuthenticationOptions(useErrorDialogs: false));
    if (authenticated) {
      showMsg("绑定成功");
      emit(state.copyWith(bindFinger: true));
      prefs.setBool(spFingerString, true);
    } else {
      showMsg("绑定失败");
      emit(state.copyWith(bindFinger: false));
      prefs.setBool(spFingerString, false);
    }
  }

  cancleBindFinger() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final LocalAuthentication auth = LocalAuthentication();
    bool can = await auth.canCheckBiometrics;
    bool authenticated = false;
    if (!can) {
      showMsg("设备不支持或未开启权限");
      return;
    }
    authenticated = await auth.authenticate(
        localizedReason: '扫描指纹进行身份验证',
        options: const AuthenticationOptions(useErrorDialogs: false));
    if (authenticated) {
      showMsg("解绑成功");
      emit(state.copyWith(bindFinger: false));
      prefs.setBool(spFingerString, false);
    } else {
      showMsg("解绑失败");
    }
  }
}
