import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_state.dart';
import 'package:ceex_flutter/views/argeement/argeement_view.dart';
import 'package:ceex_flutter/views/login/components/login_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';

/**
 * 邮箱注册
 */
class SignInViewEmail extends StatefulWidget {
  const SignInViewEmail({super.key});

  @override
  State<SignInViewEmail> createState() => _SignInViewEmailState();
}

class _SignInViewEmailState extends State<SignInViewEmail> {
  LoginViewCubit? loginViewCubit;
  TextEditingController emailController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();
  TextEditingController verController = TextEditingController();
  final FocusNode verdFocusNode = FocusNode();
  TextEditingController inviCodeController = TextEditingController();
  final FocusNode inviCodeFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    loginViewCubit = BlocProvider.of<LoginViewCubit>(context);
    emailController.addListener(() {
      setState(() {});
    });
     inviCodeController.addListener(() {
      setState(() {});
    });
    passwordController.addListener(() {
      setState(() {});
    });
    verController.addListener(() {
      setState(() {});
    });
    emailFocusNode.addListener(() {
      if (emailFocusNode.hasFocus) {
        // 获取焦点
      } else {
        // 失去焦点
      loginViewCubit!.showPrompt(
          loginViewCubit!.emailRegExp.hasMatch(emailController.text));
      loginViewCubit!.hindemailQuickChoose(false);
      }
      
    });
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    verController.dispose();
    verdFocusNode.dispose();
    inviCodeController.dispose();
    inviCodeFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return BlocBuilder<LoginViewCubit, LoginViewState>(builder: (ctx, state) {
      final LoginInputView loginInputView = LoginInputView(
          buildContext: context,
          loginViewCubit: loginViewCubit!,
          state: state,
          appTheme: appTheme);
      return Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              // 邮箱输入
              loginInputView.inputTextField(
                  emailController, emailFocusNode, LoginInputType.email,
                  hintText: AppLocalizations.of(context)!.email),
              // 邮箱输入提示信息
              loginInputView.prompt(
                  AppLocalizations.of(context)!.inputRealEmail,
                  !state.accountInputIsRight),
              // 邮箱推荐
              loginInputView.emailRecomment(
                  textEditingController: emailController),
              // 密码输入
              loginInputView.inputTextField(passwordController,
                  passwordFocusNode, LoginInputType.password,
                  isPassowrd: true,
                  hintText:
                      AppLocalizations.of(context)!.loginSignViewInputPassword,
                  rightChild: loginInputView.passwordEyesOpen()),
              // 密码要求
               loginInputView.passwordRequest(passwordController),
              // 验证码
              loginInputView.inputTextField(
                verController,
                verdFocusNode,
                LoginInputType.ver,
                hintText: AppLocalizations.of(context)!.loginSignViewEmailVer,
                rightChild: loginInputView.emailSendVer(
                    // text: AppLocalizations.of(context)!.loginSignViewEmailVer,
                    text: AppLocalizations.of(context)!.sentVerfyCode,
                    account: emailController.text,
                    loginType: LoginType.signEmail),
              ),
              const SizedBox(
                height: 12,
              ),
              // 邀请码
              loginInputView.inviteCode(
                  AppLocalizations.of(context)!.loginSignViewInCode),
              state.showInviteCode
                  ? loginInputView.inputTextField(
                      inviCodeController,
                      inviCodeFocusNode,
                      LoginInputType.none,
                      hintText:
                          AppLocalizations.of(context)!.loginSignViewInCode,
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 28,
              ),
              loginInputView.loginSignButton(
                text: AppLocalizations.of(context)!.loginSignViewCreatAccount,
                loginType: LoginType.signEmail,
                account: emailController.text,
                password: passwordController.text,
                verCode: verController.text,
                inviteCode: inviCodeController.text
              ),
              const SizedBox(height: 90,),
              const SizedBox(
              height: 90,
            ),
            loginInputView.privacyPolicy(
                privacyPolicy: AppLocalizations.of(context)!.privacyPolicy,
                privacyPolicyText:
                    AppLocalizations.of(context)!.privacyPolicyText,
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
          ));
    });
  }
}
