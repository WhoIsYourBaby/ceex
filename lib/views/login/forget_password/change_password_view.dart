import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_state.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';
import 'package:ceex_flutter/views/login/components/login_app_bar.dart';
import 'package:ceex_flutter/views/login/components/login_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswprdView extends StatefulWidget {
  const ChangePasswprdView({super.key});

  static Route route() =>
      MaterialPageRoute(builder: (context) => const ChangePasswprdView());

  @override
  State<ChangePasswprdView> createState() => _ChangePasswprdViewState();
}

class _ChangePasswprdViewState extends State<ChangePasswprdView> {
  LoginViewCubit? loginViewCubit;
  TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();
  late AppTheme appTheme;
  bool isShowDialog = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginViewCubit = BlocProvider.of<LoginViewCubit>(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    appTheme = context.watch<AppconfCubit>().state.appTheme;
    return Scaffold(
      appBar: LoginAppBar(
        type: AppLocalizations.of(context)!.setPassword,
        needLoginSign: false,
      ),
      body: BlocConsumer<LoginViewCubit, LoginViewState>(
        builder: (ctx, state) {
          final LoginInputView loginInputView = LoginInputView(
              buildContext: context,
              loginViewCubit: loginViewCubit!,
              state: state,
              appTheme: appTheme);

          return Padding(
              padding:
                  const EdgeInsets.only(top: 8, left: 15, bottom: 6, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.setPassword,
                    style: appTheme.colorSet.textBlack.style(fontSize: 24),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // 密码输入
                  loginInputView.inputTextField(passwordController,
                      passwordFocusNode, LoginInputType.password,
                      isPassowrd: true,
                      hintText: AppLocalizations.of(context)!
                          .loginSignViewInputPassword,
                      rightChild: loginInputView.passwordEyesOpen()),
                  // 密码要求
                  loginInputView.passwordRequest(passwordController),
                  SizedBox(
                    height: 20,
                  ),
                  loginInputView.loginSignButton(
                      text: "重置密码",
                      account: "account",
                      password: passwordController.text,
                      loginType: LoginType.resetPassword)
                ],
              ));
        },
        listener: (BuildContext context, LoginViewState state) {
          if (state.changePasswordSuccess != ChangePasswordStatus.none &&
              !isShowDialog) {
            isShowDialog = true;
            showDialog(
                context: context,
                builder: ((context) =>
                    dialogView(status: state.changePasswordSuccess)));
          }
        },
      ),
    );
  }

  Widget dialogView({required ChangePasswordStatus status}) {
    return Center(
        child: Padding(
      padding: EdgeInsets.only(left: 33, right: 33),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(77, 24, 77, 24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: appTheme.colorSet.textWhite),
            child: Column(
              children: [
                Image.asset(
                  status == ChangePasswordStatus.success ? R.ASSETS_IMAGES_SUCCESS_PNG : R.ASSETS_IMAGES_FAIL_PNG,
                  width: 42,
                  height: 42,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  status == ChangePasswordStatus.success
                      ? "密码找回成功!"
                      : "密码找回失败!",
                  style: appTheme.colorSet.textBlack.style(fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  status == ChangePasswordStatus.success
                      ? "您的密码找回成功，即可登录"
                      : "连接超时",
                  style: appTheme.colorSet.textGrey.style(fontSize: 12),
                ),
              ],
            ),
          ),
          GestureDetector(
              onTap: status == ChangePasswordStatus.success
                  ? () {
                      Navigator.of(context)
                        ..pop()
                        ..pop()
                        ..pop();
                    }
                  : () {
                      Navigator.of(context)..pop();
                    },
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Image.asset(R.ASSETS_IMAGES_CLOSE_CIRCLE_LINE_PNG),
              ))
        ],
      ),
    ));
  }
}
