import 'dart:async';
import 'dart:convert';

import 'package:ceex_flutter/repository/user_repository.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:oktoast/oktoast.dart';

part 'replace_email_state.dart';
part 'replace_email_cubit.freezed.dart';

class ReplaceEmailCubit extends Cubit<ReplaceEmailState> {
  ReplaceEmailCubit()
      : super(const ReplaceEmailState.initial(
            isVerSent: false,
            countdown: 60,
            hasFocus: false,
            showPassword: false,
            areaCode: "86",
            changePassword: false,
            bindPhoneSuccess: false));
  Timer? _countDownTimer;
  late Completer<void> _countDownCompleter;

  // 更新区号
  void upDataAreaCode(String code) {
    emit(state.copyWith(areaCode: code));
  }

  /// 发送验证码
  void sendVerfy({required String account, required String captchaResponse}) {
    requestVerCode();
  }

  // 发送新邮箱验证码
  void sendNewEmailVer({required String account}) {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "type": "25",
      "email": account,
    });
    final resp = repo.sendCommonEmailVerfyCode(formData);
    resp.then((value) {
      dismissAllToast();
      emit(state.copyWith(orderId: value.data.orderId));
      requestVerCode(); // 开始倒计时
    });
  }

  // 发送绑定手机号验证码
  void sendBindPhoneVer({
    required String mobile,
  }) {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "type": "5",
      "mobile": mobile,
      "national_code": state.areaCode,
    });
    final resp = repo.sendCommonSmsVerfyCode(formData);
    resp.then((value) {
      dismissAllToast();
      emit(state.copyWith(orderId: value.data.orderId));
      requestVerCode(); // 开始倒计时
    });
  }

  // 发送绑定邮箱号验证码
  void sendBindEmailVer({
    required String email,
  }) {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "type": "6",
      "email": email,
    });
    final resp = repo.sendCommonEmailVerfyCode(formData);
    resp.then((value) {
      dismissAllToast();
      emit(state.copyWith(orderId: value.data.orderId));
      requestVerCode(); // 开始倒计时
    });
  }

  // 发送修改资金密码邮箱验证码
  void sendMoneyPasswordVer() {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "type": "15",
    });
    final resp = repo.userSendEmail(formData);
    resp.then((value) {
      dismissAllToast();
      emit(state.copyWith(orderId: value.data.orderId));
      requestVerCode(); // 开始倒计时
    });
  }

  // 发送新手机验证码
  void sendNewSMSVer({required String account}) {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "type": "26",
      "national_code": state.areaCode,
      "mobile": account,
    });
    final resp = repo.sendCommonSmsVerfyCode(formData);
    resp.then((value) {
      dismissAllToast();
      emit(state.copyWith(orderId: value.data.orderId));
      requestVerCode(); // 开始倒计时
    });
  }

  // 发送绑定GA手机验证码
  void sendBindGaVer() {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "type": "7",
    });
    final resp = repo.userSendSms(formData);
    resp.then((value) {
      dismissAllToast();
      emit(state.copyWith(orderId: value.data.orderId));
      requestVerCode(); // 开始倒计时
    });
  }

  // 发送绑定GA邮箱验证码
  void sendBindGaEmailVer() {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "type": "7",
    });
    final resp = repo.userSendEmail(formData);
    resp.then((value) {
      dismissAllToast();
      emit(state.copyWith(orderId: value.data.orderId));
      requestVerCode(); // 开始倒计时
    });
  }

  // 发送换绑GA手机验证码
  void sendAlertPhoneGaVer() {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "type": "27",
    });
    final resp = repo.userSendSms(formData);
    resp.then((value) {
      dismissAllToast();
      emit(state.copyWith(orderId: value.data.orderId));
      requestVerCode(); // 开始倒计时
    });
  }

  // 发送换绑GA邮箱验证码
  void sendAlertEmailGaVer() {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "type": "27",
    });
    final resp = repo.userSendEmail(formData);
    resp.then((value) {
      dismissAllToast();
      emit(state.copyWith(orderId: value.data.orderId));
      requestVerCode(); // 开始倒计时
    });
  }

  // 修改密码
  void updatePwd({
    required String oldPassword,
    required String password1,
    required String password2,
  }) {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "old_password": encode(oldPassword),
      "password1": encode(password1),
      "password2": encode(password2),
    });
    final resp = repo.updatePwd(formData);
    resp.then((value) async {
      dismissAllToast();
      if (value.data.success) {
        showToast("更改成功，请重新登录");
        emit(state.copyWith(changePassword: true));
      }
    });
  }

  // 修改资金密码
  void tradePwdSet({
    required String tradePwd,
    required String verCode,
  }) {
    bool bindTradePwd =
        UserInfoManager.shared.userBaseInfoModel?.bindTradePwd ?? false;
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "type": bindTradePwd ? 1 : 2,
      "trade_pwd": encode(tradePwd),
      "trade_pwd2": encode(tradePwd),
      "order_id": state.orderId,
      "verify_code": verCode,
    });
    final resp = repo.tradePwdSet(formData);
    resp.then((value) {
      dismissAllToast();
    });
  }

  // 绑定GA
  void bindGa({
    required String gaCode,
    required String accountVer,
  }) {
    if (state.orderId == null || state.orderId == "") {
      showMsg("请先获取验证码");
      return;
    }
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "ga_code": gaCode, // GA验证码
      "order_id": state.orderId, // 请求验证码返回的orderId
      "verify_code": accountVer, // 二次验证码
    });
    final resp = repo.bindGa(formData);
    resp.then((value) {
      emit(state.copyWith(bindPhoneSuccess: true));
      dismissAllToast();
    });
  }

  // 换绑GA
  void alertGa({
    required String oldGaCode,
    required String newGaCode,
    required String accountVer,
  }) {
    if (state.orderId == null || state.orderId == "") {
      showMsg("请先获取验证码");
      return;
    }
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "original_ga_code": oldGaCode, // 原GA验证码
      "alter_ga_code": newGaCode, // 新GA验证码
      "order_id": state.orderId, // 请求验证码返回的orderId
      "verify_code": accountVer, // 二次验证码
    });
    final resp = repo.alterGa(formData);
    resp.then((value) {
      emit(state.copyWith(bindPhoneSuccess: true));
      dismissAllToast();
    });
  }

  // 是否显示密码
  void showPassword(bool showPassword) {
    emit(state.copyWith(showPassword: showPassword));
  }

    // 是否显示密码
  void showPassword1(bool showPassword) {
    emit(state.copyWith(showPassword1: showPassword));
  }

    // 是否显示密码
  void showPassword2(bool showPassword) {
    emit(state.copyWith(showPassword2: showPassword));
  }

    // 是否显示密码
  void showPassword3(bool showPassword) {
    emit(state.copyWith(showPassword3: showPassword));
  }

  // 倒计时
  void requestVerCode() async {
    emit(state.copyWith(isVerSent: true, countdown: state.countdown));
    _countDownCompleter = Completer<void>();
    int countDownNum = state.countdown ?? 60;
    _countDownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isClosed) {
        // 检查是否已关闭
        _countDownTimer?.cancel();
        _countDownCompleter.complete();
        return;
      }
      if (!_countDownCompleter.isCompleted && countDownNum > 0) {
        countDownNum--;
        emit(state.copyWith(isVerSent: true, countdown: countDownNum));
      } else {
        _countDownTimer?.cancel();
        _countDownCompleter.complete();
        emit(state.copyWith(isVerSent: false, countdown: 60));
      }
    });
  }

  // md5加密
  String encode(String str) {
    try {
      var md5Str = md5.convert(utf8.encode(str));
      return md5Str.bytes
          .map((byte) => byte.toRadixString(16).padLeft(2, '0'))
          .join('');
    } catch (e) {
      return "";
    }
  }
}
