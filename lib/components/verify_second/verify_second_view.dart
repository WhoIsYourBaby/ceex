import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_state.dart';
import 'package:ceex_flutter/cubit/verify_second/verify_second_cubit.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';
import 'package:ceex_flutter/views/login/components/login_app_bar.dart';
import 'package:ceex_flutter/views/login/components/login_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 登录二次验证
class VerifySecondView extends StatefulWidget {
  final cubit = VerifySecondCubit();
  final VerifyType verifyType;
  VerifySecondView({required this.verifyType, super.key});

  static Route route({
    required VerifyType verifyType,
  }) =>
      MaterialPageRoute(
          builder: (context) => VerifySecondView(
                verifyType: verifyType,
              ));

  @override
  State<VerifySecondView> createState() => _VerifySecondViewState();
}

class _VerifySecondViewState extends State<VerifySecondView> {
  late AppTheme appTheme;
  LoginViewCubit? loginViewCubit;
  TextEditingController verController = TextEditingController();
  final FocusNode verFocusNode = FocusNode();
  late VerifySecondState state;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    verController.dispose();
    verFocusNode.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    appTheme = context.watch<AppconfCubit>().state.appTheme;
    return Scaffold(
      appBar: LoginAppBar(
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
                    verTye(widget.verifyType),
                    style: appTheme.colorSet.textBlack.style(fontSize: 16),
                  ),
                  // 验证码
                  SizedBox(
                    height: 20,
                  ),
                ],
              ));
        },
        listener: (BuildContext context, LoginViewState state) {
          if (state.need2FASuccess) {
            Navigator.of(context)
              ..pop()
              ..pop();
          }
        },
      ),
    );
  }

  Widget pushButton() {
    return GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              color: appTheme.colorSet.colorDark),
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 14, bottom: 14),
          child: Text(
            "text",
            style: appTheme.colorSet.textWhite.style(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ));
  }

  String verTye(VerifyType loginFaType) {
    String text = "";
    switch (loginFaType) {
      case VerifyType.loginEmail:
        text = "邮箱验证码";
        break;
      case VerifyType.loginPhone:
        text = "手机验证";
        break;
      case VerifyType.loginGoogle:
        text = "谷歌验证";
        break;
      case VerifyType.addAddressEmail:
        text = "邮箱验证码";
        break;
      default:
        text = "未知";
        break;
    }
    return text;
  }

  /// 输入框
  Widget inputTextField(
    TextEditingController textEditingController,
    FocusNode focusNode,
  ) {
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
          Expanded(
            child: TextField(
              // onTap: () =>
              //     buildContext.read<LoginViewCubit>().focusChanged(true),
              // controller: textEditingController,
              // onChanged: (value) {
              //   loginViewCubit.inputConnect(value, loginInputType);
              //   print("改变$value");
              // },
              // onEditingComplete: () =>
              //     buildContext.read<LoginViewCubit>().focusChanged(false),
              // focusNode: focusNode,
              // scrollPadding: EdgeInsets.zero,
              // enableInteractiveSelection: true,
              // obscureText: isPassowrd && !state.showPassword,
              // style: appTheme.colorSet.textBlack.style(),
              // keyboardType: TextInputType.visiblePassword,
              // decoration: InputDecoration(
              //     hintText: hintText,
              //     isDense: true,
              //     hintStyle: appTheme.colorSet.textGrey2.style(),
              //     border: InputBorder.none),
            ),
          ),
          // emailSendVer()
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
      onTap: () {},
      child: Container(
          height: 44,
          padding: EdgeInsets.only(left: 10, right: 10),
          alignment: Alignment.center,
          child: Text(
            // state.isVerSent ? "${state.countdown}s" : text,
            "asd",
            style: appTheme.colorSet.colorDark.style(fontSize: 16, fontWeight: FontWeight.w600),
          )),
    );
  }
}
