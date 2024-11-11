import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_state.dart';
import 'package:ceex_flutter/views/argeement/argeement_view.dart';
import 'package:ceex_flutter/views/login/components/login_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';

/// 邮箱注册
class LoginViewEmail extends StatefulWidget {
  const LoginViewEmail({super.key});

  @override
  State<LoginViewEmail> createState() => _LoginViewEmailState();
}

class _LoginViewEmailState extends State<LoginViewEmail> {
  late LoginViewCubit loginViewCubit;
  TextEditingController emailController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  TextEditingController passwprdController = TextEditingController();
  final FocusNode passwprdFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    loginViewCubit = BlocProvider.of<LoginViewCubit>(context);
    emailController.addListener(() {
      setState(() {});
    });
    passwprdController.addListener(() {
      setState(() {});
    });
    emailFocusNode.addListener(() {
      if (emailFocusNode.hasFocus) {
        // 获取焦点
      } else {
        // 失去焦点
        loginViewCubit.showPrompt(
            loginViewCubit.emailRegExp.hasMatch(emailController.text));
        loginViewCubit.hindemailQuickChoose(false);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwprdController.dispose();
    emailFocusNode.dispose();
    passwprdFocusNode.dispose();
    loginViewCubit.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return BlocBuilder<LoginViewCubit, LoginViewState>(builder: (ctx, state) {
      final LoginInputView loginInputView = LoginInputView(
          buildContext: context,
          loginViewCubit: loginViewCubit,
          state: state,
          appTheme: appTheme);
      return ListView(
        padding: const EdgeInsets.only(left: 15, right: 15),
        children: [
          const SizedBox(
            height: 20,
          ),
          // 邮箱输入
          loginInputView.inputTextField(
              emailController, emailFocusNode, LoginInputType.email,
              hintText: AppLocalizations.of(context)!.email),
          // 错误信息
          loginInputView.prompt(AppLocalizations.of(context)!.inputRealEmail,
              !state.accountInputIsRight),
          // 邮箱推荐
          loginInputView.emailRecomment(textEditingController: emailController),
          // 密码输入
          loginInputView.inputTextField(
              passwprdController, passwprdFocusNode, LoginInputType.password,
              isPassowrd: true,
              hintText:
                  AppLocalizations.of(context)!.loginSignViewInputPassword,
              rightChild: loginInputView.passwordEyesOpen()),
          // 忘记密码
          loginInputView
              .forgetPassword(AppLocalizations.of(context)!.forgetPassword),
          // 登录按钮
          loginInputView.loginSignButton(
            text: AppLocalizations.of(context)!.loginViewTitle,
            loginType: LoginType.loginEmail,
            account: emailController.text,
            password: passwprdController.text,
          ),
          const SizedBox(
              height: 90,
            ),
            loginInputView.privacyPolicy(
                privacyPolicy: AppLocalizations.of(context)!.privacyPolicy,
                privacyPolicyText:
                    "登录即表示您同意我们的",
                pricacyOnTap: () {
                  Navigator.push(
                      context,
                      ArgeementView.route(ArgeementViewLoadType.privacyZh,
                          title: "服务协议"));
                },
                argementOnTap: () {
                  Navigator.push(
                      context,
                      ArgeementView.route(ArgeementViewLoadType.argemrntZh,
                          title: "隐私协议"));
                }),
        ],
      );
    });
  }
}
