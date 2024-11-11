import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_state.dart';
import 'package:ceex_flutter/views/login/components/login_input.dart';
import 'package:ceex_flutter/views/login/forget_password/change_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';

/// 忘记密码 邮箱
class ForgetPasswordEmail extends StatefulWidget {
  const ForgetPasswordEmail({super.key});

  @override
  State<ForgetPasswordEmail> createState() => _ForgetPasswordEmailState();
}

class _ForgetPasswordEmailState extends State<ForgetPasswordEmail> {
  late LoginViewCubit loginViewCubit;
  TextEditingController emailController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  TextEditingController verController = TextEditingController();
  final FocusNode verFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    loginViewCubit = BlocProvider.of<LoginViewCubit>(context);
    emailController.addListener(() {
      setState(() {});
    });
    verController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    verController.dispose();
    emailFocusNode.dispose();
    verFocusNode.dispose();
    loginViewCubit.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return BlocConsumer<LoginViewCubit, LoginViewState>(builder: (ctx, state) {
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
            // 邮箱输入提示信息
            loginInputView.prompt(AppLocalizations.of(context)!.inputRealEmail,
                !state.accountInputIsRight),
            // 邮箱推荐
            loginInputView.emailRecomment(
                textEditingController: emailController),
            // 验证码
            loginInputView.inputTextField(
              verController,
              verFocusNode,
              LoginInputType.ver,
              hintText: AppLocalizations.of(context)!.loginSignViewEmailVer,
              rightChild: loginInputView.emailSendVer(
                  text: AppLocalizations.of(context)!.sentVerfyCode,
                  account: emailController.text,
                  loginType: LoginType.forgetPasswordEmail),
            ),
            const SizedBox(
              height: 60,
            ),
            loginInputView.loginSignButton(
              text: AppLocalizations.of(context)!.forgetPassowrdGoOn,
              loginType: LoginType.forgetPasswordEmail,
              account: emailController.text,
              password: "forget",
              verCode: verController.text,
            ),
          ],
      );
    },
    listener: (BuildContext context, LoginViewState state) { 
      if (state.shouldNavigate) {
        loginViewCubit.changeNavigatorStatus(false);
        Navigator.push(context, ChangePasswprdView.route());
      }
     },);
  }
}
