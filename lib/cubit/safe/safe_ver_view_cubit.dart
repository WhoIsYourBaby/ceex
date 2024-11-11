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

part 'safe_ver_view_state.dart';
part 'safe_ver_view_cubit.freezed.dart';

class SafeVerViewCubit extends Cubit<SafeVerViewState> {
  SafeVerViewCubit()
      : super(const SafeVerViewState.initial(
            isEmailVerSent: false,
            isPhoneVerSent: false,
            emailCountdown: 60,
            phoneCountdown: 60,
            hasFocus: false,
            showPassword: false,
            areaCode: "86",
            changePassword: false,
            bindPhoneSuccess: false));
  Timer? _countDownTimer;
  late Completer<void> _countDownCompleter;

  // 获取焦点
  void focusChanged(bool hasFocus) {
    emit(state.copyWith(hasFocus: hasFocus));
  }

  // 更新区号
  void upDataAreaCode(String code) {
    emit(state.copyWith(areaCode: code));
  }

  // 发送更换邮箱旧邮箱验证码
  void sendOldEmailVer() {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "type": "25",
    });
    final resp = repo.userSendEmail(formData);
    resp.then((value) {
      dismissAllToast();
      emit(state.copyWith(emailOrderId: value.data.orderId));
      requestVerCode("email"); // 开始倒计时
    });
  }

  // 发送更换邮箱手机验证码
  void sendChangeEmailEMSVer() {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "type": "25",
    });
    final resp = repo.userSendSms(formData);
    resp.then((value) {
      dismissAllToast();
      emit(state.copyWith(phoneOrderId: value.data.orderId));
      requestVerCode("phone"); // 开始倒计时
    });
  }

  // 发送更换手机旧邮箱验证码
  void sendPhoneOldEmailVer() {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "type": "26",
    });
    final resp = repo.userSendEmail(formData);
    resp.then((value) {
      dismissAllToast();
      emit(state.copyWith(emailOrderId: value.data.orderId));
      requestVerCode("email"); // 开始倒计时
    });
  }

  // 发送更换手机旧手机验证码
  void sendPhoneOldSMSVer() {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "type": "26",
    });
    final resp = repo.userSendSms(formData);
    resp.then((value) {
      dismissAllToast();
      emit(state.copyWith(phoneOrderId: value.data.orderId));
      requestVerCode("phone"); // 开始倒计时
    });
  }

  // 发送更换邮箱手机验证码
  void sendPhoneChangeEmailEMSVer() {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "type": "26",
    });
    final resp = repo.userSendSms(formData);
    resp.then((value) {
      dismissAllToast();
      emit(state.copyWith(phoneOrderId: value.data.orderId));
      requestVerCode("phone"); // 开始倒计时
    });
  }

  // 发送绑定手机号验证码
  void sendBindPhoneVer({
    required String mobile,
    required String token,
  }) {
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "type": "5",
      "mobile": mobile,
      "national_code": state.areaCode,
      "captcha_response": token,
    });
    final resp = repo.sendCommonSmsVerfyCode(formData);
    resp.then((value) {
      dismissAllToast();
      emit(state.copyWith(phoneOrderId: value.data.orderId));
      requestVerCode("phone"); // 开始倒计时
    });
  }

  // 发送绑定邮箱手机号验证码
  void sendBindEmailPhoneVer() {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "type": "6",
    });
    final resp = repo.userSendSms(formData);
    resp.then((value) {
      dismissAllToast();
      emit(state.copyWith(phoneOrderId: value.data.orderId));
      requestVerCode("phone"); // 开始倒计时
    });
  }

  // 发送绑定手机号邮箱验证码
  void sendBindPhoneEmailVer() {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "type": "5",
    });
    final resp = repo.userSendEmail(formData);
    resp.then((value) {
      dismissAllToast();
      emit(state.copyWith(emailOrderId: value.data.orderId));
      requestVerCode("email"); // 开始倒计时
    });
  }

  // 发送修改资金密码邮箱验证码
  void sendMoneyPasswordEmailVer() {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "type": "16",
    });
    final resp = repo.userSendEmail(formData);
    resp.then((value) {
      dismissAllToast();
      emit(state.copyWith(emailOrderId: value.data.orderId));
      requestVerCode("email"); // 开始倒计时
    });
  }

  // 发送修改资金密码手机号验证码
  void sendMoneyPasswordSmsVer() {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "type": "16",
    });
    final resp = repo.userSendSms(formData);
    resp.then((value) {
      dismissAllToast();
      emit(state.copyWith(phoneOrderId: value.data.orderId));
      requestVerCode("phone"); // 开始倒计时
    });
  }

  // 切换邮箱-
  void changeEmail({
    required String newEmail,
    required String newEmailVerCode,
    required String newOrderId,
    required bool isUseGA,
  }) {
    final repo = GetIt.I.get<UserRepository>();
    final FormData formData;
    if (state.oldEmailVerCode == null || state.oldEmailVerCode == "") {
      showMsg("请填写邮箱验证码");
      return;
    }
    if (state.emailOrderId == null || state.emailOrderId == "") {
      showMsg("请获取邮箱验证码");
      return;
    }
    if (isUseGA) {
      if (state.googleVerCode == null || state.googleVerCode == "") {
        showMsg("请填写谷歌验证码");
        return;
      }
      formData = FormData.fromMap({
        "original_mobile_order_id": state.emailOrderId, // 邮箱验证码接口返回的orderId
        "original_mobile_verify_code": state.oldEmailVerCode, // 邮箱验证码
        "email": newEmail, // 新邮箱
        "alter_mobile_order_id": newOrderId, // 新邮箱验证码接口返回的orderId
        "alter_mobile_verify_code": newEmailVerCode, //新邮箱验证码
        "ga_verify_code": state.googleVerCode,
      });
    } else {
      //切换账号-->使用phone验证
      if (state.oldPhoneVerCode == null || state.oldPhoneVerCode == "") {
        showMsg("请填写手机验证码");
        return;
      }
      if (state.phoneOrderId == null || state.phoneOrderId == "") {
        showMsg("请获取手机验证码");
        return;
      }
      formData = FormData.fromMap({
        "original_email_order_id": state.emailOrderId, // 邮箱验证码接口返回的orderId
        "original_email_verify_code": state.oldEmailVerCode, // 邮箱验证码
        "mobile_order_id": state.phoneOrderId, // 邮箱验证码
        "mobile_verify_code": state.oldPhoneVerCode, // 邮箱验证码
        "email": newEmail, // 新邮箱
        "alter_email_order_id": newOrderId, //新邮箱验证码接口返回的orderId
        "alter_email_verify_code": newEmailVerCode, //新邮箱验证码
      });
    }
    showLoading();
    final resp = repo.alterEmail(formData);
    resp.then((value) {
      emit(state.copyWith(needBack: true));
      dismissAllToast();
    });
  }

  // 切换手机
  void changePhone({
    required String newMobile,
    required String newMobileVerCode,
    required String newOrderId,
    required String nationalCode,
    required bool isUseGA,
  }) {
    final repo = GetIt.I.get<UserRepository>();
    final FormData formData;
    if (state.oldPhoneVerCode == null || state.oldPhoneVerCode == "") {
      showMsg("请填写手机验证码");
      return;
    }
    if (state.phoneOrderId == null || state.phoneOrderId == "") {
      showMsg("请获取手机验证码");
      return;
    }
    if (isUseGA) {
      if (state.googleVerCode == null || state.googleVerCode == "") {
        showMsg("请填写谷歌验证码");
        return;
      }
      formData = FormData.fromMap({
        "original_mobile_order_id": state.phoneOrderId, // 手机验证码接口返回的orderId
        "original_mobile_verify_code": state.oldPhoneVerCode, // 手机验证码
        "national_code": nationalCode, // 国家代码
        "mobile": newMobile, // 新手机号
        "alter_mobile_order_id": newOrderId, //新手机验证码接口返回的orderId
        "alter_mobile_verify_code": newMobileVerCode, //新手机验证码
        "ga_verify_code": state.googleVerCode,
      });
    } else {
      //切换手机-->使用email验证
      if (state.oldEmailVerCode == null || state.oldEmailVerCode == "") {
        showMsg("请填写邮箱验证码");
        return;
      }
      if (state.emailOrderId == null || state.emailOrderId == "") {
        showMsg("请获取邮箱验证码");
        return;
      }
      formData = FormData.fromMap({
        "original_mobile_order_id": state.phoneOrderId, // 手机验证码接口返回的orderId
        "original_mobile_verify_code": state.oldPhoneVerCode, // 手机验证码
        "email_order_id": state.emailOrderId, // 邮箱验证码接口返回的orderId
        "email_verify_code": state.oldEmailVerCode, // 邮箱验证码
        "national_code": nationalCode, // 国家代码
        "mobile": newMobile, // 新手机号
        "alter_mobile_order_id": newOrderId, //新手机验证码接口返回的orderId
        "alter_mobile_verify_code": newMobileVerCode, //新手机验证码
      });
    }
    showLoading();
    final resp = repo.alterMobile(formData);
    resp.then((value) {
      emit(state.copyWith(needBack: true));
      dismissAllToast();
    });
  }

  // 绑定手机号
  void bindMobile({
    required String mobile,
    required String mobileVer,
    required String newOrderId,
    required String emailVer,
    required String areaCode,
  }) {
    if (state.emailOrderId == null || state.emailOrderId!.isEmpty) {
      showMsg("请先获取邮箱验证码");
      return;
    }
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "national_code": areaCode, // 国家代码
      "mobile": mobile, // 手机号
      "mobile_order_id": newOrderId, // 手机验证码接口返回的orderId
      "mobile_verify_code": mobileVer, // 手机验证码
      "order_id": state.emailOrderId, // 邮箱验证码接口返回的orderId
      "verify_code": emailVer, // 邮箱验证码
    });
    final resp = repo.bindMobile(formData);
    resp.then((value) {
      emit(state.copyWith(needBack: true));
      dismissAllToast();
    });
  }

  // 绑定邮箱
  void bindEmail({
    required String email,
    required String emailVer,
    required String newOrderId,
    required String phoneVer,
  }) {
    if (state.phoneOrderId == null || state.phoneOrderId!.isEmpty) {
      showMsg("请先获取手机验证码");
      return;
    }
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "email": email, // 邮箱
      "email_order_id": newOrderId, // 邮箱验证码接口返回的orderId
      "email_verify_code": emailVer, // 邮箱验证码
      "order_id": state.phoneOrderId, // 手机验证码接口返回的orderId
      "verify_code": phoneVer, // 手机验证码
    });
    final resp = repo.bindEmail(formData);
    resp.then((value) {
      emit(state.copyWith(needBack: true));
      dismissAllToast();
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
    required String orderId,
  }) {
    bool bindTradePwd =
        UserInfoManager.shared.userBaseInfoModel?.bindTradePwd ?? false;
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "type": bindTradePwd ? 2 : 1,
      "trade_pwd": encode(tradePwd),
      "trade_pwd2": encode(tradePwd),
      "order_id": orderId,
      "verify_code": verCode,
    });
    final resp = repo.tradePwdSet(formData);
    resp.then((value) {
      emit(state.copyWith(needBack: true));
      dismissAllToast();
    });
  }

  // 赋值更换邮箱时安全验证邮箱输入的验证码
  void upDataEmailVerCode(String code) {
    emit(state.copyWith(oldEmailVerCode: code));
  }

  // 赋值更换邮箱时安全验证手机号输入的验证码
  void upDataSMSVerCode(String code) {
    emit(state.copyWith(oldPhoneVerCode: code));
  }

  // 赋值安全验证谷歌输入的验证码
  void upDataGaVerCode(String code) {
    emit(state.copyWith(googleVerCode: code));
  }

  // 是否显示密码
  void showPassword(bool showPassword) {
    emit(state.copyWith(showPassword: showPassword));
  }

  // 倒计时
  void requestVerCode(String type) async {
    if (type == "email") {
      emit(state.copyWith(
          isEmailVerSent: true, emailCountdown: state.emailCountdown));
    }
    if (type == "phone") {
      emit(state.copyWith(
          isPhoneVerSent: true, phoneCountdown: state.phoneCountdown));
    }
    _countDownCompleter = Completer<void>();

    int countDownNum = 0;
    if (type == "email") {
      countDownNum = state.emailCountdown ?? 60;
    }
    if (type == "phone") {
      countDownNum = state.phoneCountdown ?? 60;
    }
    _countDownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isClosed) {
        // 检查是否已关闭
        _countDownTimer?.cancel();
        _countDownCompleter.complete();
        return;
      }
      if (!_countDownCompleter.isCompleted && countDownNum > 0) {
        countDownNum--;
        if (type == "email") {
          emit(state.copyWith(
              isEmailVerSent: true, emailCountdown: countDownNum));
        }
        if (type == "phone") {
          emit(state.copyWith(
              isPhoneVerSent: true, phoneCountdown: countDownNum));
        }
      } else {
        _countDownTimer?.cancel();
        _countDownCompleter.complete();
        if (type == "email") {
          emit(state.copyWith(isEmailVerSent: false, emailCountdown: 60));
        }
        if (type == "phone") {
          emit(state.copyWith(isPhoneVerSent: false, phoneCountdown: 60));
        }
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
