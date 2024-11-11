import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/auth/auth_cubit.dart';
import 'package:ceex_flutter/cubit/safe/replace_account/replace_email_cubit.dart';
import 'package:ceex_flutter/cubit/safe/safe_ver_view_cubit.dart';
import 'package:ceex_flutter/utils/config.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:ceex_flutter/views/safe/components/safe_input_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:zendesk_helpcenter/zendesk_helpcenter.dart';

class SafeVerPhone extends StatefulWidget {
  final SafeVerViewCubit cubit1;
  final String newAccount;
  final String newAccountVer;
  final String newOrderId;
  final SafeNeedVerType safeNeedVerType;
  final String areaCode;
  final VoidCallback didLogin;
  final bool isUseGA;
  const SafeVerPhone(
      {required this.newAccount,
      required this.newAccountVer,
      required this.newOrderId,
      required this.safeNeedVerType,
      required this.cubit1,
      this.areaCode = "",
      required this.didLogin,
      required this.isUseGA,
      super.key});

  @override
  State<SafeVerPhone> createState() => _SafeVerPhoneState();
}

class _SafeVerPhoneState extends State<SafeVerPhone>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late SafeInputTextWidget safeInputTextWidget;
  late AppTheme appTheme;
  TextEditingController phoneController = TextEditingController();
  FocusNode phoneFocusNode = FocusNode();
  TextEditingController verController = TextEditingController();
  FocusNode verFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    phoneController.addListener(() {
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
    phoneController.text =
        context.read<AuthCubit>().state.userBaseInfo?.mobile ?? "加载失败请重试";
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    phoneFocusNode.dispose();
    verController.dispose();
    verFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<SafeVerViewCubit, SafeVerViewState>(
      bloc: widget.cubit1,
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
                    "手机号",
                    style: appTheme.colorSet.textBlack.style(),
                  ))),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 12,
          )),
          SliverToBoxAdapter(
            child: safeInputTextWidget.inputTextField(
                phoneController, phoneFocusNode,
                enable: false, hintText: "请输入手机号"),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 32,
          )),
          SliverToBoxAdapter(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "手机验证码",
                    style: appTheme.colorSet.textBlack.style(),
                  ))),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 12,
          )),
          SliverToBoxAdapter(
            child: safeInputTextWidget.inputTextField(
                verController, verFocusNode, onChanged: (value) {
              widget.cubit1.upDataSMSVerCode(value);
            },
                hintText: "请输入验证码",
                rightChild: safeInputTextWidget.emailSendVer(
                    text: state.isPhoneVerSent ?? false
                        ? "${state.phoneCountdown}s"
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
        break;
      case SafeNeedVerType.bindEmail:
        // 绑定邮箱
        widget.cubit1.sendBindEmailPhoneVer();
        break;
      case SafeNeedVerType.replaceEmail:
        // 更换邮箱
        widget.cubit1.sendChangeEmailEMSVer();
        break;
      case SafeNeedVerType.replacePhone:
        // 更换手机
        widget.cubit1.sendPhoneOldSMSVer();
        break;
      case SafeNeedVerType.moneyPassword:
        // 资金密码
        widget.cubit1.sendMoneyPasswordSmsVer();
        break;
      default:
    }
  }

  // 验证
  void verify() {
    switch (widget.safeNeedVerType) {
      case SafeNeedVerType.bindPhone:
        // 绑定手机号
        break;
      case SafeNeedVerType.bindEmail:
        // 绑定邮箱
        if (verController.text.isEmpty) {
          showToast("请输入手机验证码");
          return;
        }
        widget.cubit1.bindEmail(
            email: widget.newAccount,
            newOrderId: widget.newOrderId,
            emailVer: widget.newAccountVer,
            phoneVer: verController.text);
        break;
      case SafeNeedVerType.moneyPassword:
        // 资金密码
        if (verController.text.isEmpty) {
          showToast("请填写验证码");
          return;
        }
        if (widget.cubit1.state.phoneOrderId == null ||
            widget.cubit1.state.phoneOrderId == "") {
          showToast("请先获取手机验证码");
          return;
        }
        widget.cubit1.tradePwdSet(
            tradePwd: widget.newAccount,
            verCode: verController.text,
            orderId: widget.cubit1.state.phoneOrderId ?? "");
        break;
      case SafeNeedVerType.replaceEmail:
        // 更换邮箱 完成
        widget.cubit1.changeEmail(
          newEmail: widget.newAccount,
          newEmailVerCode: widget.newAccountVer,
          newOrderId: widget.newOrderId,
          isUseGA: widget.isUseGA,
        );
        break;
      case SafeNeedVerType.replacePhone:
        // 更换手机 完成
        widget.cubit1.changePhone(
            newMobile: widget.newAccount,
            newMobileVerCode: widget.newAccountVer,
            newOrderId: widget.newOrderId,
            nationalCode: widget.areaCode,
            isUseGA: widget.isUseGA);
        break;
      default:
    }
  }
}
