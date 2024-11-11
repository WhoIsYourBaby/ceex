import 'package:ceex_flutter/components/app_bar_center_text.dart';
import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/safe/replace_account/replace_email_cubit.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:ceex_flutter/views/safe/components/safe_input_text_widget.dart';
import 'package:ceex_flutter/views/safe/safe_ver/safe_ver_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

class SetMoneyPassword extends StatefulWidget {
  final VoidCallback didLogin;
  const SetMoneyPassword({super.key, required this.didLogin});
  static Route route({VoidCallback? didLogin}) => MaterialPageRoute(
      builder: (context) => SetMoneyPassword(
            didLogin: didLogin ?? () {},
          ));
  @override
  State<SetMoneyPassword> createState() => _SetMoneyPasswordState();
}

class _SetMoneyPasswordState extends State<SetMoneyPassword> {
  final cubit = ReplaceEmailCubit();
  late SafeInputTextWidget safeInputTextWidget;
  late AppTheme appTheme;
  TextEditingController moneyController = TextEditingController();
  FocusNode moneyFocusNode = FocusNode();
  TextEditingController moneyTwoController = TextEditingController();
  FocusNode moneyTwoFocusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moneyController.addListener(() {
      setState(() {});
    });
    moneyTwoController.addListener(() {
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appTheme = context.watch<AppconfCubit>().state.appTheme;
    safeInputTextWidget =
        SafeInputTextWidget(buildContext: context, appTheme: appTheme);
  }

  @override
  void dispose() {
    super.dispose();
    moneyController.dispose();
    moneyFocusNode.dispose();
    moneyTwoController.dispose();
    moneyTwoFocusNode.dispose();
    cubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWrapper(
        statusBarColor: appTheme.colorSet.colorWhite,
        child: AppBarCenterText(
          title: "${UserInfoManager.shared.userBaseInfoModel?.bindTradePwd ?? false ? "修改":"设置"}资金密码",
        ),
      ),
      body: BlocBuilder<ReplaceEmailCubit, ReplaceEmailState>(
          bloc: cubit,
          builder: (context, state) {
            return CustomScrollView(slivers: [
              const SliverToBoxAdapter(
                  child: SizedBox(
                height: 32,
              )),
              SliverToBoxAdapter(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "资金密码",
                        style: appTheme.colorSet.textBlack.style(),
                      ))),
              const SliverToBoxAdapter(
                  child: SizedBox(
                height: 12,
              )),
              SliverToBoxAdapter(
                child: safeInputTextWidget.inputTextField(
                    moneyController, moneyFocusNode,
                    hintText: "请输入资金密码",
                    isPassowrd: true,
                    showPassword: state.showPassword ?? false,
                    rightChild: safeInputTextWidget.passwordEyesOpen(
                        onTap: () {
                          cubit.showPassword(!(state.showPassword ?? false));
                        },
                        showPassword: state.showPassword ?? false)),
              ),
              const SliverToBoxAdapter(
                  child: SizedBox(
                height: 10,
              )),
              SliverToBoxAdapter(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "8-32个字符，两种以上字母、数字、符号组合",
                        style: appTheme.colorSet.textGrey.style(fontSize: 12),
                      ))),
              const SliverToBoxAdapter(
                  child: SizedBox(
                height: 32,
              )),
              SliverToBoxAdapter(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "确认资金密码",
                        style: appTheme.colorSet.textBlack.style(),
                      ))),
              const SliverToBoxAdapter(
                  child: SizedBox(
                height: 12,
              )),
              SliverToBoxAdapter(
                child: safeInputTextWidget.inputTextField(
                    moneyTwoController, moneyTwoFocusNode,
                    hintText: "请输入资金密码",
                    isPassowrd: true,
                    showPassword: state.showPassword1 ?? false,
                    rightChild: safeInputTextWidget.passwordEyesOpen(
                        onTap: () {
                          cubit.showPassword1(!(state.showPassword1 ?? false));
                        },
                        showPassword: state.showPassword1 ?? false)),
              ),
              const SliverToBoxAdapter(
                  child: SizedBox(
                height: 100,
              )),
              SliverToBoxAdapter(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: safeInputTextWidget.loginSignButton(
                        text: "提交",
                        onTap: () {
                          setMoneyPassword();
                        })),
              ),
            ]);
          }),
    );
  }

  setMoneyPassword() {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,20}$');
    bool verify = regex.hasMatch(moneyController.text);
    if (!verify) {
      showToast("新密码不符合验证规则");
      return;
    }
    if (moneyController.text == moneyTwoController.text) {
      Navigator.push(
          context,
          SafeVerView.route(
              newAccount: moneyController.text,
              newVerNumber: "",
              newOrderId: "",
              didLogin: widget.didLogin,
              safeNeedVerType: SafeNeedVerType.moneyPassword));
    } else {
      showToast("新密码和确认密码不一致");
    }
  }
}
