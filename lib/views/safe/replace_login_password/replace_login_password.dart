import 'package:ceex_flutter/components/app_bar_center_text.dart';
import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/safe/replace_account/replace_email_cubit.dart';
import 'package:ceex_flutter/utils/dio_manager.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:ceex_flutter/views/safe/components/safe_input_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

class ReplaceLoginPassword extends StatefulWidget {
  ReplaceLoginPassword({super.key});
  static Route route() =>
      MaterialPageRoute(builder: (context) => ReplaceLoginPassword());
  @override
  State<ReplaceLoginPassword> createState() => _ReplaceLoginPasswordState();
}

class _ReplaceLoginPasswordState extends State<ReplaceLoginPassword> {
  late SafeInputTextWidget safeInputTextWidget;
  late AppTheme appTheme;
  final cubit = ReplaceEmailCubit();
  TextEditingController oldController = TextEditingController();
  FocusNode oldFocusNode = FocusNode();
  TextEditingController newController = TextEditingController();
  FocusNode newFocusNode = FocusNode();
  TextEditingController newTwoController = TextEditingController();
  FocusNode newTwoFocusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oldController.addListener(() {
      setState(() {});
    });
    newController.addListener(() {
      setState(() {});
    });
    newTwoController.addListener(() {
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
    oldController.dispose();
    oldFocusNode.dispose();
    newController.dispose();
    newFocusNode.dispose();
    newTwoController.dispose();
    newTwoFocusNode.dispose();
    cubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWrapper(
        statusBarColor: appTheme.colorSet.colorWhite,
        child: AppBarCenterText(
          title: "修改登录密码",
        ),
      ),
      body: BlocConsumer<ReplaceEmailCubit, ReplaceEmailState>(
        bloc: cubit,
        builder: (context, state) {
          return CustomScrollView(slivers: [
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 20,
            )),
            SliverToBoxAdapter(
                child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: appTheme.colorSet.colorAuxiliary4,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 2,
                  ),
                  Image.asset(R.ASSETS_IMAGES_VECTOR_PNG),
                  const SizedBox(
                    width: 6,
                  ),
                  Expanded(
                      child: Text(
                    "为了您的资金安全，修改登录密码后24小时内无法进行提现以及P2P 卖出交易",
                    style: appTheme.colorSet.textBlack.style(fontSize: 12),
                  ))
                ],
              ),
            )),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 32,
            )),
            SliverToBoxAdapter(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "原登录密码",
                      style: appTheme.colorSet.textBlack.style(),
                    ))),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 12,
            )),
            SliverToBoxAdapter(
              child: safeInputTextWidget.inputTextField(
                  oldController, oldFocusNode,
                  hintText: "请输入原登录密码",
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
              height: 32,
            )),
            SliverToBoxAdapter(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "新登录密码",
                      style: appTheme.colorSet.textBlack.style(),
                    ))),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 12,
            )),
            SliverToBoxAdapter(
              child: safeInputTextWidget.inputTextField(
                  newController, newFocusNode,
                  hintText: "请输入新登录密码",
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
              height: 10,
            )),
            SliverToBoxAdapter(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "8-20位，至少包含1个数字/1个大写字母/1个小写字母",
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
                      "确认登录密码",
                      style: appTheme.colorSet.textBlack.style(),
                    ))),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 12,
            )),
            SliverToBoxAdapter(
              child: safeInputTextWidget.inputTextField(
                  newTwoController, newTwoFocusNode,
                  hintText: "请输入登录密码",
                  isPassowrd: true,
                  showPassword: state.showPassword2 ?? false,
                  rightChild: safeInputTextWidget.passwordEyesOpen(
                      onTap: () {
                        cubit.showPassword2(!(state.showPassword2 ?? false));
                      },
                      showPassword: state.showPassword2 ?? false)),
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
                      onTap: () async {
                        if (oldController.text.isEmpty) {
                          showToast("请填写原登录密码");
                          return;
                        }
                        RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,20}$');
                        bool verify = regex.hasMatch(newController.text);
                        if (!verify) {
                          showToast("新密码不符合验证规则");
                          return;
                        }
                        if (newController.text.toString() ==
                            newTwoController.text.toString()) {
                          cubit.updatePwd(
                            oldPassword: oldController.text,
                            password1: newController.text,
                            password2: newTwoController.text,
                          );
                        } else {
                          showToast("新密码和确认密码不一致");
                        }
                      })),
            ),
          ]);
        },
        listener: (BuildContext context, ReplaceEmailState state) {
          if (state.changePassword ?? false) {
            UserInfoManager.shared.clearUserInfoAndCookie();
            DioManager.shared.clearCookie();
            Navigator.of(context)
              ..pop()
              ..pop();
          }
        },
      ),
    );
  }
}
