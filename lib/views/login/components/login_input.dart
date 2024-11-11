import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_state.dart';
import 'package:ceex_flutter/model/publish/countries_model.dart';
import 'package:ceex_flutter/utils/option_grid_view.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/views/login/area_choose.dart';
import 'package:ceex_flutter/views/login/forget_password/forget_password_page.dart';
import 'package:ceex_flutter/views/webviewPage/web_view_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginInputView {
  LoginViewCubit loginViewCubit;
  BuildContext buildContext;
  LoginViewState state;
  AppTheme appTheme;

  final List<String> emailDataSource = [
    "@gmail.com",
    "@outlook.com",
    "@yahoo.com",
    "@mail.ru",
    "@hotmail.com",
    "@icloud.com",
  ];

  LoginInputView(
      {required this.buildContext,
      required this.loginViewCubit,
      required this.state,
      required this.appTheme});

  /// 输入框
  Widget inputTextField(
    TextEditingController textEditingController,
    FocusNode focusNode,
    LoginInputType loginInputType, {
    String hintText = "",
    Widget leftChild = const SizedBox(),
    Widget rightChild = const SizedBox(),
    bool isPassowrd = false,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      margin: const EdgeInsets.only(top: 12, bottom: 12),
      height: 44,
      decoration: BoxDecoration(
          border: Border.all(
              color: focusNode.hasFocus
                  ? appTheme.colorSet.colorDark
                  : appTheme.colorSet.colorLight),
          borderRadius: BorderRadius.circular(44)),
      alignment: Alignment.center,
      child: Row(
        children: [
          leftChild,
          Expanded(
            child: TextField(
              onTap: () =>
                  buildContext.read<LoginViewCubit>().focusChanged(true),
              controller: textEditingController,
              onChanged: (value) {
                loginViewCubit.inputConnect(value, loginInputType);
              },
              onEditingComplete: () =>
                  buildContext.read<LoginViewCubit>().focusChanged(false),
              focusNode: focusNode,
              scrollPadding: EdgeInsets.zero,
              enableInteractiveSelection: true,
              obscureText: isPassowrd && !state.showPassword,
              style: appTheme.colorSet.textBlack.style(),
              keyboardType: isPassowrd ? TextInputType.visiblePassword : TextInputType.text,
              decoration: InputDecoration(
                  hintText: hintText,
                  isDense: true,
                  hintStyle: appTheme.colorSet.textGrey2.style(),
                  border: InputBorder.none),
            ),
          ),
          rightChild
        ],
      ),
    );
  }

  /// 密码小眼睛
  Widget passwordEyesOpen() {
    return GestureDetector(
      onTap: () {
        loginViewCubit.showPassword(!state.showPassword);
      },
      child: Container(
        height: 44,
        width: 44,
        child: Image.asset(
          state.showPassword
              ? R.ASSETS_IMAGES_EYE_OPEN_LINE_PNG
              : R.ASSETS_IMAGES_EYE_CLOSE_LINE_PNG,
          height: 16,
          width: 16,
        ),
      ),
    );
  }

  /// 展示邀请码
  Widget inviteCode(String text) {
    return GestureDetector(
      onTap: () {
        loginViewCubit.showInviteCode(!state.showInviteCode);
      },
      child: Row(
        children: [
          SizedBox(width: 16),
          Text(
            text,
            style: appTheme.colorSet.textBlack.style(fontSize: 12),
          ),
          Transform.rotate(
              angle: state.showInviteCode ? 3.14159 : 0,
              child: Image.asset(
                R.ASSETS_IMAGES_SELECT_DOWNLOAD_PNG,
                width: 16,
                height: 16,
              ))
        ],
      ),
    );
  }

  /// 发送验证码
  Widget emailSendVer({
    required String text,
    String account = "",
    LoginType loginType = LoginType.none,
    LoginFaType loginFaType = LoginFaType.none,
  }) {
    return GestureDetector(
      onTap: () {
        if (state.isVerSent) return; // 正在发送验证码阶段
        switch (loginType) {
          case LoginType.signEmail: // 验证邮箱格式
            loginViewCubit
                .showPrompt(loginViewCubit.emailRegExp.hasMatch(account));
            if (!loginViewCubit.emailRegExp.hasMatch(account)) return;
            break;
          case LoginType.forgetPasswordEmail: // 验证邮箱格式
            loginViewCubit
                .showPrompt(loginViewCubit.emailRegExp.hasMatch(account));
            if (!loginViewCubit.emailRegExp.hasMatch(account)) return;
            break;
          default:
            break;
        }
        if (loginFaType == LoginFaType.google) return;
        showLoading();
        showDialog(
                barrierColor: Colors.transparent,
                context: buildContext,
                builder: ((context) => const WebViewDialog()))
            .then((value) => loginViewCubit.sendVerfy(
                account: account,
                captcha_response: value,
                loginType: loginType,
                loginFaType: loginFaType,
                national_code: state.areaCode));
      },
      child: Container(
          height: 44,
          padding: const EdgeInsets.only(left: 10, right: 10),
          alignment: Alignment.center,
          child: Text(
            
            loginType == LoginType.forgetPasswordEmail? (state.isEmailVerSent ? "${state.emailCountdown}s" : text):
            loginType == LoginType.forgetPasswordPhone ?(state.isPhoneVerSent ? "${state.phoneCountdown}s" : text):
            state.isVerSent ? "${state.countdown}s" : text,
            style: appTheme.colorSet.colorPrimary
                .style(fontSize: 14),
          )),
    );
  }

  /// 登录注册按钮
  Widget loginSignButton({
    required String text,
    required String account,
    required String password,
    String verCode = "",
    String inviteCode = "",
    LoginType loginType = LoginType.loginPhone,
    LoginFaType loginFaType = LoginFaType.none,
    String netText = "",
    String addressText = "",
    String remarksText = "",
    String tokenText = "",
  }) {
    return GestureDetector(
        onTap: () async {
          // if (account == "") {
          //   showMsg("请填写账号");
          //   return;
          // }
          // if (password == "") {
          //   showMsg("请填写密码");
          //   return;
          // }
          switch (loginType) {
            case LoginType.signEmail: // 验证邮箱格式
              if (account == "") {
                showMsg("请填写邮箱号");
                return;
              }
              if (password == "") {
                showMsg("请填写密码");
                return;
              }
              if (verCode == "") {
                showMsg("请填写验证码");
                return;
              }

              loginViewCubit
                  .showPrompt(loginViewCubit.emailRegExp.hasMatch(account));
              if (!loginViewCubit.emailRegExp.hasMatch(account)) return;
              if (state.isPasswordRequest1 &&
                  state.isPasswordRequest2 &&
                  state.isPasswordRequest3) {
                showLoading();
                loginViewCubit.login(
                  account: account,
                  password: password,
                  loginType: loginType,
                  verCode: verCode,
                );
              }

              break;
            case LoginType.signPhone:
              if (account == "") {
                showMsg("请填写手机号");
                return;
              }
              if (password == "") {
                showMsg("请填写密码");
                return;
              }
              if (verCode == "") {
                showMsg("请填写验证码");
                return;
              }
              if (state.isPasswordRequest1 &&
                  state.isPasswordRequest2 &&
                  state.isPasswordRequest3) {
                showLoading();
                loginViewCubit.login(
                  account: account,
                  password: password,
                  loginType: loginType,
                  verCode: verCode,
                );
              }

              break;
            case LoginType.loginEmail: // 验证邮箱格式
              if (account == "") {
                showMsg("请填写邮箱号");
                return;
              }
              if (password == "") {
                showMsg("请填写密码");
                return;
              }
              loginViewCubit
                  .showPrompt(loginViewCubit.emailRegExp.hasMatch(account));
              if (!loginViewCubit.emailRegExp.hasMatch(account)) return;
              showLoading();
              showDialog(
                      barrierColor: Colors.transparent,
                      context: buildContext,
                      builder: ((context) => WebViewDialog()))
                  .then((value) => loginViewCubit.login(
                      account: account,
                      password: password,
                      loginType: loginType,
                      token: value));
              break;
            case LoginType.loginPhone:
              if (account == "") {
                showMsg("请填写手机号");
                return;
              }
              if (password == "") {
                showMsg("请填写密码");
                return;
              }
              showLoading();
              showDialog(
                      barrierColor: Colors.transparent,
                      context: buildContext,
                      builder: ((context) => WebViewDialog()))
                  .then((value) => loginViewCubit.login(
                      account: account,
                      password: password,
                      loginType: loginType,
                      token: value));
              break;
            case LoginType.forgetPasswordEmail:
              if (account == "") {
                showMsg("请填邮箱号");
                return;
              }
              if (verCode == "") {
                showMsg("请填写验证码");
                return;
              }
              loginViewCubit
                  .showPrompt(loginViewCubit.emailRegExp.hasMatch(account));
              if (!loginViewCubit.emailRegExp.hasMatch(account)) return;
              showLoading();
              loginViewCubit.login(
                  account: account,
                  password: password,
                  loginType: loginType,
                  verCode: verCode);
              break;
            case LoginType.forgetPasswordPhone:
              if (account == "") {
                showMsg("请填写手机号");
                return;
              }
              if (verCode == "") {
                showMsg("请填写验证码");
                return;
              }
              showLoading();
              loginViewCubit.login(
                  account: account,
                  password: password,
                  loginType: loginType,
                  verCode: verCode);
              break;
            case LoginType.resetPassword: // 重置密码
              if (state.isPasswordRequest1 &&
                  state.isPasswordRequest2 &&
                  state.isPasswordRequest3) {
                showLoading();
                loginViewCubit.resertPassword(password);
              }
              break;
            case LoginType.verFa:
              showLoading();
              loginViewCubit.login(
                account: account,
                password: password,
                loginType: loginType,
                verCode: verCode,
                loginFaType: loginFaType,
                netText: netText,
                addressText: addressText,
                remarksText: remarksText,
                tokenText: tokenText,
              );
              break;
            default:
              break;
          }
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              color: appTheme.colorSet.colorDark),
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 14, bottom: 14),
          child: Text(
            text,
            style: appTheme.colorSet.textWhite
                .style(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ));
  }

  /// email推荐
  Widget emailRecomment({
    required TextEditingController textEditingController,
  }) {
    return state.showemailQuickChoose
        ? OptionGridView(
            padding: EdgeInsets.fromLTRB(16, 4, 16, 12),
            itemCount: emailDataSource.length,
            rowCount: 3,
            mainAxisSpacing: 12.0,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  textEditingController.text =
                      textEditingController.text + emailDataSource[index];
                  loginViewCubit.showPrompt(loginViewCubit.emailRegExp
                      .hasMatch(textEditingController.text));
                },
                child: Container(
                    width: 84,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 6, bottom: 6),
                    decoration: BoxDecoration(
                      color: buildContext
                          .read<AppconfCubit>()
                          .state
                          .appTheme
                          .colorSet
                          .colorLight,
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    child: Text(
                      emailDataSource[index],
                      style: appTheme.colorSet.textBlack.style(fontSize: 10),
                    )),
              );
            },
          )
        : SizedBox();
  }

  /// 隐私政策
  Widget privacyPolicy(
      {required String privacyPolicyText, required String privacyPolicy,Function()? pricacyOnTap,Function()? argementOnTap}) {
    return Container(
      alignment: Alignment.center,
      child: RichText(
          text: TextSpan(
              children: [
                TextSpan(text: privacyPolicyText,style: appTheme.colorSet.textBlack.style(fontSize: 12)),
                // TextSpan(text: privacyPolicy,style: appTheme.colorSet.colorPrimary.style(fontSize: 12),recognizer: TapGestureRecognizer()..onTap = pricacyOnTap)])),
                TextSpan(text: "服务协议",style: appTheme.colorSet.colorPrimary.style(fontSize: 12),recognizer: TapGestureRecognizer()..onTap = pricacyOnTap),
                TextSpan(text: "和",style: appTheme.colorSet.textBlack.style(fontSize: 12)),
                TextSpan(text: "隐私协议",style: appTheme.colorSet.colorPrimary.style(fontSize: 12),recognizer: TapGestureRecognizer()..onTap = argementOnTap)])),
    );
  }

  /// 区号选择
  Widget areaCodeChoose() {
    return GestureDetector(
      onTap: () async {
        var result = await Navigator.push(buildContext, AreaChoose.route());
        if (result != null) {
          CountriesModel countriesModel = result as CountriesModel;
          loginViewCubit.upDataAreaCode(countriesModel.nationalCode!);
        }
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
            border: Border(
          right: BorderSide(width: 1, color: appTheme.colorSet.textGrey2),
        )),
        height: 24,
        child: Row(
          children: [
            Text(
              state.areaCode,
              style: appTheme.colorSet.textBlack.style(fontSize: 16),
            ),
            SizedBox(
              width: 6,
            ),
            Image.asset(
              R.ASSETS_IMAGES_AREA_CODE_CHOOSE_PNG,
              width: 16,
              height: 16,
            ),
            SizedBox(
              width: 12,
            ),
          ],
        ),
      ),
    );
  }

  /// 忘记密码
  Widget forgetPassword(String text) {
    return GestureDetector(
      onTap: () {
        loginViewCubit.dispose();
        Navigator.push(buildContext, ForgetPasswordPage.route());
      },
      child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 12, bottom: 28),
          child: Text(
            text,
            style: appTheme.colorSet.colorDark
                .style(fontSize: 13, fontWeight: FontWeight.w600),
          )),
    );
  }

  /// 密码要求
  Widget passwordRequest(TextEditingController textEditingController) {
    return state.showPasswordRequest
        ? Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Image.asset(state.isPasswordRequest1
                      ? R.ASSETS_IMAGES_GROUP_33_PNG
                      : R.ASSETS_IMAGES_GROUP_77_PNG),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "字母大小写",
                    style: state.isPasswordRequest1
                        ? appTheme.colorSet.textBlack.style(fontSize: 12)
                        : appTheme.colorSet.textGrey.style(fontSize: 12),
                  )
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Image.asset(state.isPasswordRequest2
                      ? R.ASSETS_IMAGES_GROUP_33_PNG
                      : R.ASSETS_IMAGES_GROUP_77_PNG),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "字母加数字",
                    style: state.isPasswordRequest1
                        ? appTheme.colorSet.textBlack.style(fontSize: 12)
                        : appTheme.colorSet.textGrey.style(fontSize: 12),
                  )
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Image.asset(state.isPasswordRequest3
                      ? R.ASSETS_IMAGES_GROUP_33_PNG
                      : R.ASSETS_IMAGES_GROUP_77_PNG),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "长度大于8",
                    style: state.isPasswordRequest1
                        ? appTheme.colorSet.textBlack.style(fontSize: 12)
                        : appTheme.colorSet.textGrey.style(fontSize: 12),
                  )
                ],
              ),
              SizedBox(
                height: 3,
              ),
            ],
          )
        : SizedBox();
  }

  /// 提示信息
  Widget prompt(String text, bool isShow) {
    return
        // !state.accountInputIsRight
        isShow
            ? Padding(
                padding: EdgeInsets.only(left: 16, bottom: 12),
                child: Text(
                  text,
                  style: appTheme.colorSet.colorAuxiliary2.style(fontSize: 12),
                ),
              )
            : SizedBox();
  }
}
