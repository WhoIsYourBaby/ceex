import 'package:ceex_flutter/components/app_bar_center_text.dart';
import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/safe/replace_account/replace_email_cubit.dart';
import 'package:ceex_flutter/cubit/safe/safe_center_view_cubit.dart';
import 'package:ceex_flutter/utils/config.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:ceex_flutter/views/safe/components/safe_input_text_widget.dart';
import 'package:ceex_flutter/views/safe/safe_ver/safe_ver_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:zendesk_helpcenter/zendesk_helpcenter.dart';

/// 绑定邮箱
class BindEmail extends StatefulWidget {
  final SafeVerType safeVerType;
  final VoidCallback didLogin;
  const BindEmail(
      {required this.safeVerType, required this.didLogin, super.key});
  static Route route(
          {required SafeVerType safeVerType, VoidCallback? didLogin}) =>
      MaterialPageRoute(
          builder: (context) => BindEmail(
                safeVerType: safeVerType,
                didLogin: didLogin ?? () {},
              ));

  @override
  State<BindEmail> createState() => _BindEmailState();
}

class _BindEmailState extends State<BindEmail> {
  late AppTheme appTheme;
  late SafeInputTextWidget safeInputTextWidget;
  final cubit = ReplaceEmailCubit();
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  TextEditingController verController = TextEditingController();
  FocusNode verFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
    verController.addListener(() {
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
    emailController.dispose();
    emailFocusNode.dispose();
    verController.dispose();
    verFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appTheme.colorSet.textWhite,
        appBar: AppBarWrapper(
          statusBarColor: appTheme.colorSet.colorWhite,
          child: AppBarCenterText(
            title: "绑定邮箱",
          ),
        ),
        body: SafeArea(
            bottom: true,
            child: BlocBuilder<ReplaceEmailCubit, ReplaceEmailState>(
                bloc: cubit,
                builder: (context, state) {
                  return CustomScrollView(slivers: [
                    const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 20,
                    )),
                    SliverToBoxAdapter(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "邮箱",
                              style: appTheme.colorSet.textBlack.style(),
                            ))),
                    const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 12,
                    )),
                    SliverToBoxAdapter(
                      child: safeInputTextWidget.inputTextField(
                          emailController, emailFocusNode,
                          hintText: "请输入邮箱"),
                    ),
                    const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 32,
                    )),
                    SliverToBoxAdapter(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "邮箱验证码",
                              style: appTheme.colorSet.textBlack.style(),
                            ))),
                    const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 12,
                    )),
                    SliverToBoxAdapter(
                      child: safeInputTextWidget.inputTextField(
                          verController, verFocusNode,
                          hintText: "请输入验证码",
                          rightChild: safeInputTextWidget.emailSendVer(
                              text: state.isVerSent ?? false
                                  ? "${state.countdown}s"
                                  : "发送验证码",
                              account: "",
                              sendVer: () => sendVer())),
                    ),
                    const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 100,
                    )),
                    SliverToBoxAdapter(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: safeInputTextWidget.loginSignButton(
                              text: "提交", onTap: () => submit())),
                    ),
                    const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 32,
                    )),
                    SliverToBoxAdapter(
                      child: GestureDetector(
                          onTap: () {
                            ZendeskHelpcenter.initialize(
                                appId: kZendeskAppId,
                                clientId: kZendeskClientId,
                                urlString: kZendeskUrl,
                                name: UserInfoManager.shared.userBaseInfoModel?.userId,
                                email: UserInfoManager.shared.userBaseInfoModel?.email,
                              );
                              ZendeskHelpcenter.showRequestList();
                          },
                          child: Text("我没有收到验证码",
                              textAlign: TextAlign.center,
                              style: appTheme.colorSet.textBlack
                                  .style(fontSize: 12))),
                    ),
                  ]);
                })));
  }

  // 发送验证码
  void sendVer() {
    if (emailController.text.isNotEmpty) {
      cubit.sendBindEmailVer(email: emailController.text);
    } else {
      showToast("请填写邮箱号码");
    }
  }

  void submit() {
    if (emailController.text.isEmpty) {
      showMsg("请填写邮箱号码");
      return;
    }
    if (verController.text.isEmpty) {
      showMsg("请填写验证码");
      return;
    }
    if (cubit.state.orderId == null || cubit.state.orderId!.isEmpty) {
      showMsg("请先获取验证码");
      return;
    }
    Navigator.push(
        context,
        SafeVerView.route(
            newAccount: emailController.text,
            newVerNumber: verController.text,
            areaCode: cubit.state.areaCode,
            newOrderId: cubit.state.orderId ?? "",
            didLogin: widget.didLogin,
            safeNeedVerType: SafeNeedVerType.bindEmail));
  }
}