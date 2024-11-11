import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_state.dart';
import 'package:ceex_flutter/views/login/components/login_app_bar.dart';
import 'package:ceex_flutter/views/login/components/login_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 登录二次验证
class LoginNeedFa extends StatefulWidget {
  final LoginViewCubit cubit;
  final LoginFaType loginFaType;
  final String netText;
  final String addressText;
  final String remarksText;
  final String tokenText;
  final VoidCallback didLogin;
  LoginNeedFa(
      {required this.loginFaType,
      this.netText = "",
      this.addressText = "",
      this.remarksText = "",
      this.tokenText = "",
      required this.cubit,
      required this.didLogin,
      super.key});

  static Route route(
          {LoginFaType loginFaType = LoginFaType.email,
          String netText = "",
          String addressText = "",
          String tokenText = "",
          String remarksText = "",
          VoidCallback? didLogin,
          required LoginViewCubit cubit}) =>
      MaterialPageRoute(
          builder: (context) => LoginNeedFa(
                loginFaType: loginFaType,
                netText: netText,
                addressText: addressText,
                remarksText: remarksText,
                tokenText: tokenText,
                cubit: cubit,
                didLogin: didLogin ?? () {},
              ));

  @override
  State<LoginNeedFa> createState() => _LoginNeedFaState();
}

class _LoginNeedFaState extends State<LoginNeedFa> {
  late AppTheme appTheme;
  LoginViewCubit? loginViewCubit;
  TextEditingController verController = TextEditingController();
  final FocusNode verFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    verController.dispose();
    verFocusNode.dispose();
    loginViewCubit!.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginViewCubit = BlocProvider.of<LoginViewCubit>(context);
    loginViewCubit!.upDataVerType(widget.loginFaType);
    verController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    appTheme = context.watch<AppconfCubit>().state.appTheme;
    return Scaffold(
      appBar: const LoginAppBar(
        type: "安全验证",
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
                    "安全验证",
                    style: appTheme.colorSet.textBlack.style(fontSize: 24),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    verTye(state),
                    style: appTheme.colorSet.textBlack.style(fontSize: 16),
                  ),
                  // 验证码
                  loginInputView.inputTextField(
                      verController, verFocusNode, LoginInputType.ver,
                      hintText: verTye(state),
                      rightChild: loginInputView.emailSendVer(
                          text: verCodeTye(state),
                          account: verController.text,
                          loginType: LoginType.verFa,
                          loginFaType: state.loginFaType)),
                  SizedBox(
                    height: 20,
                  ),
                  loginInputView.loginSignButton(
                      text: "提交",
                      password: "1",
                      account: "1",
                      verCode: verController.text,
                      loginType: LoginType.verFa,
                      netText: widget.netText,
                      addressText: widget.addressText,
                      remarksText: widget.remarksText,
                      loginFaType: state.loginFaType,
                      tokenText: widget.tokenText)
                ],
              ));
        },
        listener: (BuildContext context, LoginViewState state) {
          if (state.need2FASuccess) {
            // 登录成功后直接调用该API会自动重置路由
            // widget.cubit.authCubit.requestUserBaseInfo();
            widget.didLogin();
          }
          if (state.addSuccess) {
            widget.didLogin();
          }
        },
      ),
    );
  }

  String verTye(LoginViewState state) {
    String text = "";
    switch (state.loginFaType) {
      case LoginFaType.email:
        text = "邮箱验证";
        break;
      case LoginFaType.phone:
        text = "手机验证";
        break;
      case LoginFaType.google:
        text = "谷歌验证";
        break;
      case LoginFaType.addAddressEmail:
        text = "邮箱验证码";
      default:
    }
    return text;
  }

  String verCodeTye(LoginViewState state) {
    String text = "";
    switch (state.loginFaType) {
      case LoginFaType.email:
        text = "发送验证码";
        break;
      case LoginFaType.phone:
        text = "发送验证码";
        break;
      case LoginFaType.google:
        text = "";
        break;
      case LoginFaType.addAddressEmail:
        text = "发送验证码";
        break;
      case LoginFaType.addAddressPhone:
        text = "发送验证码";
        break;
      default:
    }
    return text;
  }
}
