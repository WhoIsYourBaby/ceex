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
class LoginViewPhone extends StatefulWidget {
  const LoginViewPhone({super.key});

  @override
  State<LoginViewPhone> createState() => _LoginViewPhoneState();
}

class _LoginViewPhoneState extends State<LoginViewPhone> {
  late LoginViewCubit loginViewCubit;
  TextEditingController phoneController = TextEditingController();
  final FocusNode phoneFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();

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
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordController.dispose();
    phoneController.dispose();
    passwordFocusNode.dispose();
    phoneFocusNode.dispose();
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
            // 手机号
            loginInputView.inputTextField(
                phoneController, phoneFocusNode, LoginInputType.phone,
                leftChild: loginInputView.areaCodeChoose(),
                hintText: AppLocalizations.of(context)!.loginSignViewPhone),
            // 密码
            loginInputView.inputTextField(
                passwordController, passwordFocusNode, LoginInputType.password,
                isPassowrd: true,
                hintText:
                    AppLocalizations.of(context)!.loginSignViewInputPassword,
                rightChild: loginInputView.passwordEyesOpen()),
            // 忘记密码
            loginInputView
                .forgetPassword(AppLocalizations.of(context)!.forgetPassword),
            // 登录按钮
            loginInputView.loginSignButton(
              account: phoneController.text,
              password: passwordController.text,
              text: AppLocalizations.of(context)!.loginViewTitle,
              loginType: LoginType.loginPhone,
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
