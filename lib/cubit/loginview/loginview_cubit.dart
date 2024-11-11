import 'dart:async';
import 'dart:convert';
import 'package:ceex_flutter/cubit/auth/auth_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_state.dart';
import 'package:ceex_flutter/model/user/user_model.dart';
import 'package:ceex_flutter/repository/address_repository.dart';
import 'package:ceex_flutter/repository/user_repository.dart';
import 'package:ceex_flutter/utils/config.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:crypto/crypto.dart';
import 'package:oktoast/oktoast.dart';

class LoginViewCubit extends Cubit<LoginViewState> {
  final AuthCubit authCubit;
  LoginViewCubit({
    required this.authCubit,
  }) : super(LoginViewState.initial());

  static const platform = MethodChannel("com.example.my_flutter_app/native");

  late Completer<void> _countDownCompleter;
  Timer? _countDownTimer;
  // 邮箱验证
  final RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9.-]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
  // 手机号验证
  final RegExp phoneRegExp = RegExp(r'^\+?[0-9]+$');
  // 密码大写验证
  final RegExp passwordHasBig = RegExp(r'[A-Z]');
  // 密码含有数字和字母验证
  final RegExp passwordHasNum = RegExp(r'[a-zA-Z0-9]');

  // 登录
  void platformLogin() {
    // emit(LoginViewState(isLoading: true));
    emit(state.copyWith(isLoading: true));
  }

  // 发送验证码并倒计时
  void requestVerCode() {
    // emit(LoginViewState(isVerSent: true, countdown: state.countdown));
    emit(state.copyWith(isVerSent: true, countdown: state.countdown));
    _countDownCompleter = Completer<void>();
    // 开始倒计时
    int countDownNum = state.countdown;
    countDownFunction() async {
      while (!_countDownCompleter.isCompleted && countDownNum > 0) {
        await Future.delayed(const Duration(seconds: 1));
        countDownNum--;
        emit(state.copyWith(isVerSent: true, countdown: countDownNum));
      }
    }

    // 倒计时结束
    countDownFunction().then((value) {
      _countDownCompleter.complete();
      emit(state.copyWith(isVerSent: false, countdown: 60));
    });
  }

  // 发送验证码并倒计时
  void requestVerCodeCountDown(String type) {
    // emit(LoginViewState(isVerSent: true, countdown: state.countdown));
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

  // 取消倒计时
  void cancelCountDown() {
    if (!_countDownCompleter.isCompleted) {
      _countDownCompleter.complete();
    }
  }

  // 输入框焦点
  void focusChanged(bool hasFocus) {
    emit(state.copyWith(hasFocus: hasFocus));
  }

  void changeNavigatorStatus(bool should) {
    emit(state.copyWith(shouldNavigate: should));
  }

  void hindemailQuickChoose(bool value) {
    emit(state.copyWith(showemailQuickChoose: value));
  }

  // 输入框是否有内容
  void inputConnect(String text, LoginInputType loginInputType) {
    switch (loginInputType) {
      case LoginInputType.email:
        emit(state.copyWith(showemailQuickChoose: text.isNotEmpty));
        break;
      case LoginInputType.password:
        emit(state.copyWith(showPasswordRequest: text.isNotEmpty));
        emit(state.copyWith(isPasswordRequest1: passwordHasBig.hasMatch(text)));
        emit(state.copyWith(isPasswordRequest2: passwordHasNum.hasMatch(text)));
        emit(state.copyWith(isPasswordRequest3: text.length > 8));
        break;
      default:
        break;
    }
  }

  // 是否显示密码
  void showPassword(bool showPassword) {
    emit(state.copyWith(showPassword: showPassword));
  }

  // 恢复初始值
  void dispose() {
    emit(LoginViewState.initial());
  }

  /// 展示邀请码
  void showInviteCode(bool showInviteCode) {
    emit(state.copyWith(showInviteCode: showInviteCode));
  }

  /// 更新区号
  void upDataAreaCode(String areaCode) {
    emit(state.copyWith(areaCode: areaCode));
  }

  /// 更新验证方式
  void upDataVerType(LoginFaType loginFaType) {
    emit(state.copyWith(loginFaType: loginFaType));
  }

  /// 显示提示信息
  void showPrompt(bool status) {
    emit(state.copyWith(accountInputIsRight: status));
  }

  /// 发送验证码
  void sendVerfy(
      {required String account,
      required String national_code,
      required String captcha_response,
      required LoginType loginType,
      LoginFaType loginFaType = LoginFaType.none}) {
    switch (loginType) {
      case LoginType.signEmail:
        final repo = GetIt.I.get<UserRepository>();
        final formData = FormData.fromMap({
          "type": "1",
          "email": account,
          "captcha_response": captcha_response,
        });
        final resp = repo.sendCommonEmailVerfyCode(formData);
        resp.then((value) {
          dismissAllToast();
          emit(state.copyWith(orderId: value.data.orderId));
          requestVerCode(); // 开始倒计时
        });
        break;
      case LoginType.signPhone:
        final repo = GetIt.I.get<UserRepository>();
        final formData = FormData.fromMap({
          "type": "1",
          "national_code": state.areaCode.replaceFirst("+", ""),
          "mobile": account,
          "captcha_response": captcha_response,
        });
        final resp = repo.sendCommonSmsVerfyCode(formData);
        resp.then((value) {
          emit(state.copyWith(orderId: value.data.orderId));
          dismissAllToast();
          requestVerCode();
        });
        break;
      case LoginType.forgetPasswordEmail:
        final repo = GetIt.I.get<UserRepository>();
        final formData = FormData.fromMap({
          "type": "3",
          "email": account,
          "captcha_response": captcha_response,
          "captcha_id": kGt3Gt,
          "challenge": captcha_response,
        });
        final resp = repo.sendCommonEmailVerfyCode(formData);
        resp.then((value) {
          dismissAllToast();
          emit(state.copyWith(emailOrderId: value.data.orderId));
          // requestVerCode(); // 开始倒计时
          requestVerCodeCountDown("email");
        });
        break;
      case LoginType.forgetPasswordPhone:
        final repo = GetIt.I.get<UserRepository>();
        final formData = FormData.fromMap({
          "type": "3",
          "mobile": account,
          "national_code": national_code,
          "captcha_response": captcha_response,
          "captcha_id": kGt3Gt,
          "challenge": captcha_response,
        });
        final resp = repo.sendCommonSmsVerfyCode(formData);
        resp.then((value) {
          dismissAllToast();
          emit(state.copyWith(phoneOrderId: value.data.orderId));
          // requestVerCode(); // 开始倒计时
          requestVerCodeCountDown("phone");
        });
        break;
      case LoginType.verFa:
        if (loginFaType == LoginFaType.email) {
          final repo = GetIt.I.get<UserRepository>();
          final formData = FormData.fromMap({"request_id": state.requestId});
          final resp = repo.userSendEmailVerifyCode(formData);
          resp.then((value) {
            dismissAllToast();
            emit(state.copyWith(orderId: value.data.orderId));
            requestVerCode(); // 开始倒计时
          });
        }

        if (loginFaType == LoginFaType.phone) {
          final repo = GetIt.I.get<UserRepository>();
          final formData = FormData.fromMap({"request_id": state.requestId});
          final resp = repo.userSmsEmailVerifyCode(formData);
          resp.then((value) {
            dismissAllToast();
            emit(state.copyWith(orderId: value.data.orderId));
            requestVerCode(); // 开始倒计时
          });
        }

        if (loginFaType == LoginFaType.google) {}
        if (loginFaType == LoginFaType.addAddressEmail) {
          final repo = GetIt.I.get<UserRepository>();
          final formData = FormData.fromMap(
              {"type": "8", "captcha_response": captcha_response});
          final resp = repo.userSendEmail(formData);
          resp.then((value) {
            dismissAllToast();
            emit(state.copyWith(orderId: value.data.orderId));
            requestVerCode(); // 开始倒计时
          });
        }
        if (loginFaType == LoginFaType.addAddressPhone) {
          final repo = GetIt.I.get<UserRepository>();
          final formData = FormData.fromMap(
              {"type": "8", "captcha_response": captcha_response});
          final resp = repo.userSendSms(formData);
          resp.then((value) {
            dismissAllToast();
            emit(state.copyWith(orderId: value.data.orderId));
            requestVerCode(); // 开始倒计时
          });
        }
        break;
      default:
        break;
    }
  }

  /// 登录
  void login({
    required String account,
    required String password,
    required LoginType loginType,
    String token = "",
    String verCode = "",
    String inviteCode = "",
    String netText = "",
    String addressText = "",
    String remarksText = "",
    String tokenText = "",
    LoginFaType loginFaType = LoginFaType.none,
  }) async {
    switch (loginType) {
      case LoginType.loginEmail:
        final repo = GetIt.I.get<UserRepository>();
        final formData = FormData.fromMap({
          "email": account,
          "password": encode(password),
          "captcha_response": token,
          "captcha_id": kGt3Gt,
          "challenge": token,
        });
        final resp = repo.emailAuthorize(formData);
        resp.then((value) async {
          dismissAllToast();
          if (value.data.need2FA!) {
            switch (value.data.authType) {
              case "EMAIL":
                emit(state.copyWith(
                    need2FA: true,
                    loginFaType: LoginFaType.email,
                    requestId: value.data.requestId));
                break;
              case "MOBILE":
                emit(state.copyWith(
                    need2FA: true,
                    loginFaType: LoginFaType.phone,
                    requestId: value.data.requestId));
                break;
              case "GA":
                emit(state.copyWith(
                    need2FA: true,
                    loginFaType: LoginFaType.google,
                    requestId: value.data.requestId));
                break;
              default:
            }
            return;
          }
          UserCookie userCookie =
              getCookie(value.response.headers['set-cookie'].toString());
          await UserInfoManager.shared.saveUserInfo(value.data);
          await UserInfoManager.shared.saveUserCookie(userCookie);
          await authCubit.requestUserBaseInfo();
          emit(state.copyWith(loginSuccess: true));
          dismissAllToast();
        });
        break;
      case LoginType.loginPhone:
        final repo = GetIt.I.get<UserRepository>();
        final formData = FormData.fromMap({
          "mobile": account,
          "password": encode(password),
          "national_code": state.areaCode.replaceFirst("+", ""),
          "captcha_response": token,
          "captcha_id": kGt3Gt,
          "challenge": token,
        });
        final resp = repo.mobileAuthorize(formData);
        resp.then((value) async {
          if (value.data.need2FA!) {
            dismissAllToast();
            switch (value.data.authType) {
              case "EMAIL":
                emit(state.copyWith(
                    need2FA: true,
                    loginFaType: LoginFaType.email,
                    requestId: value.data.requestId));
                break;
              case "MOBILE":
                emit(state.copyWith(
                    need2FA: true,
                    loginFaType: LoginFaType.phone,
                    requestId: value.data.requestId));
                break;
              case "GA":
                emit(state.copyWith(
                    need2FA: true,
                    loginFaType: LoginFaType.google,
                    requestId: value.data.requestId));
                break;
              default:
            }
            return;
          }
          UserCookie userCookie =
              getCookie(value.response.headers['set-cookie'].toString());
          await UserInfoManager.shared.saveUserInfo(value.data);
          await UserInfoManager.shared.saveUserCookie(userCookie);
          await authCubit.requestUserBaseInfo();
          emit(state.copyWith(loginSuccess: true));
          dismissAllToast();
        });
        break;
      case LoginType.signEmail:
        final repo = GetIt.I.get<UserRepository>();
        final formData = FormData.fromMap({
          "email": account,
          "password1": encode(password),
          "password2": encode(password),
          "order_id": state.orderId,
          "verify_code": verCode,
          "invite_code": inviteCode,
        });
        final resp = repo.emailSignUp(formData);
        resp.then((value) async {
          UserCookie userCookie =
              getCookie(value.response.headers['set-cookie'].toString());
          await UserInfoManager.shared.saveUserInfo(value.data);
          await UserInfoManager.shared.saveUserCookie(userCookie);
          await authCubit.requestUserBaseInfo();
          emit(state.copyWith(signSuccess: true));
          dismissAllToast();
        });
        break;
      case LoginType.signPhone:
        final repo = GetIt.I.get<UserRepository>();
        final formData = FormData.fromMap({
          "national_code": state.areaCode.replaceFirst("+", ""),
          "mobile": account,
          "password1": encode(password),
          "password2": encode(password),
          "order_id": state.orderId,
          "verify_code": verCode,
          "invite_code": inviteCode,
        });
        final resp = repo.mobileSignUp(formData);
        resp.then((value) async {
          UserCookie userCookie =
              getCookie(value.response.headers['set-cookie'].toString());
          await UserInfoManager.shared.saveUserInfo(value.data);
          await UserInfoManager.shared.saveUserCookie(userCookie);
          await authCubit.requestUserBaseInfo();
          emit(state.copyWith(signSuccess: true));
          dismissAllToast();
        });
        break;
      case LoginType.forgetPasswordEmail:
        final repo = GetIt.I.get<UserRepository>();
        final formData = FormData.fromMap({
          "email": account,
          "order_id": state.emailOrderId,
          "verify_code": verCode,
        });
        final resp = repo.checkEmailVerfyCode(formData);
        resp.then((value) {
          dismissAllToast();
          emit(state.copyWith(orderId: value.data.requestId));
          changeNavigatorStatus(true);
        });
        break;
      case LoginType.forgetPasswordPhone:
        final repo = GetIt.I.get<UserRepository>();
        final formData = FormData.fromMap({
          "mobile": account,
          "national_code": state.areaCode.replaceFirst("+", ""),
          "order_id": state.phoneOrderId,
          "verify_code": verCode,
        });
        final resp = repo.checkMobileVerfyCode(formData);
        resp.then((value) {
          dismissAllToast();
          emit(state.copyWith(orderId: value.data.requestId));
          changeNavigatorStatus(true);
        });
        break;
      case LoginType.verFa:
        int i = 0;
        if (loginFaType == LoginFaType.phone) {
          i = 1;
        }
        if (loginFaType == LoginFaType.email) {
          i = 2;
        }
        if (loginFaType == LoginFaType.google) {
          i = 3;
        }
        if (loginFaType == LoginFaType.addAddressEmail) {
          final repo = GetIt.I.get<AddressRepository>();
          final formData = FormData.fromMap({
            "token_id": tokenText,
            "order_id": state.orderId,
            "verify_code": verCode,
            "chain_type": netText,
            "address": addressText,
            "remark": remarksText,
            "auth_type": "2",
          });
          final resp = repo.addAddress(formData);
          resp.then((value) async {
            dismissAllToast();
            emit(state.copyWith(addSuccess: true));
          });
        } else if (loginFaType == LoginFaType.addAddressPhone) {
          final repo = GetIt.I.get<AddressRepository>();
          final formData = FormData.fromMap({
            "token_id": tokenText,
            "order_id": state.orderId,
            "verify_code": verCode,
            "chain_type": netText,
            "address": addressText,
            "remark": remarksText,
            "auth_type": "1",
          });
          final resp = repo.addAddress(formData);
          resp.then((value) async {
            dismissAllToast();
            emit(state.copyWith(addSuccess: true));
          });
        } else {
          final repo = GetIt.I.get<UserRepository>();
          final formData = FormData.fromMap({
            "request_id": state.requestId,
            "auth_type": i,
            "order_id": state.orderId,
            "verify_code": verCode,
          });
          final resp = repo.userAuthorizeAdvance(formData);
          resp.then((value) async {
            UserCookie userCookie =
                getCookie(value.response.headers['set-cookie'].toString());
            await UserInfoManager.shared.saveUserInfo(value.data);
            await UserInfoManager.shared.saveUserCookie(userCookie);
            await authCubit.requestUserBaseInfo();
            emit(state.copyWith(need2FASuccess: true));
            dismissAllToast();
          });
        }
        break;
      default:
        break;
    }
  }

  // 重置密码
  void resertPassword(String password) async {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "password1": encode(password),
      "password2": encode(password),
      "request_id": state.orderId,
    });
    final resp = repo.findPwd(formData);
    try {
      resp.then((value) {
        dismissAllToast();
        showMsg("更改成功");
        emit(state.copyWith(
            changePasswordSuccess: ChangePasswordStatus.success));
      });
    } catch (e) {
      emit(state.copyWith(changePasswordSuccess: ChangePasswordStatus.fail));
    }
  }

  // 登录成功
  void registrationSuccess() {
    emit(state.copyWith(loginSuccess: true));
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

  UserCookie getCookie(String value) {
    Map<String, String> cookie = {};
    String cookString = value.substring(1, value.length - 1);
    List<String> keyValuePairs = cookString.split(RegExp(r'[;,]'));
    Map<String, String> headerMap = {};
    for (String pair in keyValuePairs) {
      List<String> keyValue = pair.trim().split('=');
      if (keyValue.length == 2) {
        String key = keyValue[0].trim();
        String value = keyValue[1].trim();
        headerMap[key] = value;
      }
    }
    if (headerMap['au_token'] != null) {
      cookie.addAll({"au_token": headerMap['au_token']!});
    }

    if (headerMap['c_token'] != null) {
      cookie.addAll({"c_token": headerMap['c_token']!});
    }
    return UserCookie.fromJson(cookie);
  }
}
