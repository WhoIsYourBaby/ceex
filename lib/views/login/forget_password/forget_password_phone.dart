import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_state.dart';
import 'package:ceex_flutter/views/login/components/login_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';

/**
 * 忘记密码 手机
 */
class ForgetPasswordPhone extends StatefulWidget {
  const ForgetPasswordPhone({super.key});

  @override
  State<ForgetPasswordPhone> createState() => _ForgetPasswordPhoneState();
}

class _ForgetPasswordPhoneState extends State<ForgetPasswordPhone> {
  late LoginViewCubit loginViewCubit;
  TextEditingController phoneController = TextEditingController();
  final FocusNode phoneFocusNode = FocusNode();
  TextEditingController verController = TextEditingController();
  final FocusNode verFocusNode = FocusNode();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginViewCubit = BlocProvider.of<LoginViewCubit>(context);
    phoneController.addListener(() {
      setState(() {});
    });
    verController.addListener(() {
      setState(() {});
    });
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    verController.dispose();
    phoneController.dispose();
    verFocusNode.dispose();
    phoneFocusNode.dispose();
    loginViewCubit.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return BlocBuilder<LoginViewCubit, LoginViewState>(builder: (ctx, state) {
      final LoginInputView loginInputView = LoginInputView(
          buildContext: context, loginViewCubit: loginViewCubit, state: state,appTheme: appTheme);
      return ListView(
        padding: EdgeInsets.only(left: 15, right: 15),
          children: [
            const SizedBox(
              height: 20,
            ),
            // 手机号
            loginInputView.inputTextField(phoneController,phoneFocusNode,LoginInputType.phone,
                leftChild: loginInputView.areaCodeChoose(),
                hintText: AppLocalizations.of(context)!.loginSignViewPhone),
            // 验证码
            loginInputView.inputTextField(
              verController,
              verFocusNode,
              LoginInputType.ver,
              hintText: AppLocalizations.of(context)!.loginSignViewPhoneVer,
              rightChild: loginInputView.emailSendVer(
                text: AppLocalizations.of(context)!.sentVerfyCode,
                account: phoneController.text,
                loginType: LoginType.forgetPasswordPhone,
              )),
            SizedBox(height: 60,),
            // 登录按钮
            loginInputView.loginSignButton(
              text: AppLocalizations.of(context)!.forgetPassowrdGoOn,
              loginType: LoginType.forgetPasswordPhone,
              account: phoneController.text,
              password: "forget",
              verCode: verController.text,
            ),
          ],
      );
    });
  }
}
