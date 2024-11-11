import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_state.dart';
import 'package:ceex_flutter/views/argeement/argeement_view.dart';
import 'package:ceex_flutter/views/login/components/login_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';

/**
 * 手机登录
 */
class SignInViewPhone extends StatefulWidget {
  const SignInViewPhone({super.key});

  @override
  State<SignInViewPhone> createState() => _SignInViewPhoneState();
}

class _SignInViewPhoneState extends State<SignInViewPhone> {
  LoginViewCubit? loginViewCubit;
  TextEditingController phoneController = TextEditingController();
  final FocusNode phoneFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();
  TextEditingController verController = TextEditingController();
  final FocusNode verdFocusNode = FocusNode();
  TextEditingController inviCodeController = TextEditingController();
  final FocusNode inviCodeFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginViewCubit = BlocProvider.of<LoginViewCubit>(context);
    phoneController.addListener(() {
      setState(() {});
    });
    passwordController.addListener(() {
      setState(() {});
    });
    inviCodeController.addListener(() {
      setState(() {});
    });
    verController.addListener(() {
      setState(() {});
    });
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    phoneController.dispose();
    phoneFocusNode.dispose();
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
          children: [
            const SizedBox(
              height: 20,
            ),
            // 手机号
            loginInputView.inputTextField(
                phoneController, phoneFocusNode, LoginInputType.phone,
                leftChild: loginInputView.areaCodeChoose(),
                hintText: AppLocalizations.of(context)!.loginSignViewPhone),
            // 密码输入
            loginInputView.inputTextField(
                passwordController, passwordFocusNode, LoginInputType.password,
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
              LoginInputType.phone,
              hintText: AppLocalizations.of(context)!.loginSignViewPhoneVer,
              rightChild: loginInputView.emailSendVer(
                  text: AppLocalizations.of(context)!.sentVerfyCode,
                  account: phoneController.text,
                  loginType: LoginType.signPhone),
            ),
            const SizedBox(
              height: 12,
            ),
            // 邀请码
            loginInputView
                .inviteCode(AppLocalizations.of(context)!.loginSignViewInCode),
            state.showInviteCode
                ? loginInputView.inputTextField(
                    inviCodeController,
                    inviCodeFocusNode,
                    LoginInputType.none,
                    hintText: AppLocalizations.of(context)!.loginSignViewInCode,
                  )
                : SizedBox(),
            SizedBox(
              height: 28,
            ),
            loginInputView.loginSignButton(
                text: AppLocalizations.of(context)!.loginSignViewCreatAccount,
                loginType: LoginType.signPhone,
                account: phoneController.text,
                password: passwordController.text,
                verCode: verController.text,
                inviteCode: inviCodeController.text),
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
        ),
      );
    });
  }
}
