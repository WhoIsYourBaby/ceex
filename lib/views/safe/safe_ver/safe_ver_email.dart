import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/auth/auth_cubit.dart';
import 'package:ceex_flutter/cubit/safe/replace_account/replace_email_cubit.dart';
import 'package:ceex_flutter/cubit/safe/safe_ver_view_cubit.dart';
import 'package:ceex_flutter/utils/config.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:ceex_flutter/views/safe/components/safe_input_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:zendesk_helpcenter/zendesk_helpcenter.dart';

class SafeVerEmail extends StatefulWidget {
  final SafeVerViewCubit cubit;
  final String newAccount;
  final String newAccountVer;
  final String newOrderId;
  final SafeNeedVerType safeNeedVerType;
  final String areaCode;
  final bool isUseGA;
  final VoidCallback didLogin;
  const SafeVerEmail(
      {required this.newAccount,
      required this.newAccountVer,
      required this.newOrderId,
      required this.safeNeedVerType,
      required this.cubit,
      this.areaCode = "",
      required this.didLogin,
      required this.isUseGA,
      super.key});

  @override
  State<SafeVerEmail> createState() => _SafeVerEmailState();
}

class _SafeVerEmailState extends State<SafeVerEmail>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  late SafeInputTextWidget safeInputTextWidget;
  late AppTheme appTheme;
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
    emailController.text =
        context.read<AuthCubit>().state.userBaseInfo?.email ?? "加载失败请重试";
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
    super.build(context);
    return BlocConsumer<SafeVerViewCubit, SafeVerViewState>(
      bloc: widget.cubit,
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
                enable: false, hintText: "请输入邮箱"),
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
                verController, verFocusNode, onChanged: (value) {
              widget.cubit.upDataEmailVerCode(value);
            },
                hintText: "请输入验证码",
                rightChild: safeInputTextWidget.emailSendVer(
                    text: state.isEmailVerSent ?? false
                        ? "${state.emailCountdown}s"
                        : "发送验证码",
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
                    text: "提交",
                    onTap: () {
                      verify();
                    })),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 32,
          )),
          SliverToBoxAdapter(
            child: GestureDetector(
                onTap: () {
                  // Navigator.push(context, ReplaceEmailWidget.route());
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
                    style: appTheme.colorSet.textBlack.style(fontSize: 12))),
          ),
        ]);
      },
      listener: (BuildContext context, SafeVerViewState state) {},
    );
  }

  // 发送验证码
  void sendVer() {
    switch (widget.safeNeedVerType) {
      case SafeNeedVerType.bindPhone:
        // 绑定手机号
        widget.cubit.sendBindPhoneEmailVer();
        break;
      case SafeNeedVerType.bindEmail:
        // 绑定邮箱
        // widget.cubit.sendBindEmailVer();
        break;
      case SafeNeedVerType.replaceEmail:
        // 更换邮箱
        widget.cubit.sendOldEmailVer();

        break;
      case SafeNeedVerType.replacePhone:
        // 更换手机号
        widget.cubit.sendPhoneOldEmailVer();

        break;
      case SafeNeedVerType.moneyPassword:
        // 资金密码
        widget.cubit.sendMoneyPasswordEmailVer();
        break;
      default:
    }
  }

  // 验证
  void verify() {
    switch (widget.safeNeedVerType) {
      case SafeNeedVerType.bindPhone:
        if (verController.text.isEmpty) {
          showMsg("请填写验证码");
          return;
        }
        // 绑定手机号
        widget.cubit.bindMobile(
          mobile: widget.newAccount,
          areaCode: widget.areaCode,
          mobileVer: widget.newAccountVer,
          newOrderId: widget.newOrderId,
          emailVer: verController.text,
        );
        break;
      case SafeNeedVerType.bindEmail:
        break;
      case SafeNeedVerType.moneyPassword:
        // 资金密码
        if (verController.text.isEmpty) {
          showToast("请填写验证码");
          return;
        }
        if (widget.cubit.state.emailOrderId == null ||
            widget.cubit.state.emailOrderId == "") {
          showToast("请先获取邮箱验证码");
          return;
        }
        widget.cubit.tradePwdSet(
            tradePwd: widget.newAccount,
            verCode: verController.text,
            orderId: widget.cubit.state.emailOrderId ?? "");
        break;
      case SafeNeedVerType.replaceEmail:
        // 更换邮箱
        widget.cubit.changeEmail(
          newEmail: widget.newAccount,
          newEmailVerCode: widget.newAccountVer,
          newOrderId: widget.newOrderId,
          isUseGA: widget.isUseGA,
        );
      case SafeNeedVerType.replacePhone:
        // 更换手机
        widget.cubit.changePhone(
          newMobile: widget.newAccount,
          newMobileVerCode: widget.newAccountVer,
          newOrderId: widget.newOrderId,
          nationalCode: widget.areaCode,
          isUseGA: widget.isUseGA,
        );
        break;
      default:
    }
  }
}
