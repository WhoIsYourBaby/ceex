import 'package:ceex_flutter/components/app_bar_center_text.dart';
import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/safe/replace_account/replace_email_cubit.dart';
import 'package:ceex_flutter/cubit/safe/safe_center_view_cubit.dart';
import 'package:ceex_flutter/model/user/user_base_info_model.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:ceex_flutter/views/safe/components/safe_input_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// 绑定Google
class BindGoogleVer extends StatefulWidget {
  final SafeVerType safeVerType;
  final VoidCallback didLogin;
  const BindGoogleVer(
      {required this.safeVerType, required this.didLogin, super.key});
  static Route route(
          {required SafeVerType safeVerType, VoidCallback? didLogin}) =>
      MaterialPageRoute(
          builder: (context) => BindGoogleVer(
                safeVerType: safeVerType,
                didLogin: didLogin ?? () {},
              ));

  @override
  State<BindGoogleVer> createState() => _BindGoogleVerState();
}

class _BindGoogleVerState extends State<BindGoogleVer> {
  final cubit = ReplaceEmailCubit();
  late AppTheme appTheme;
  late SafeInputTextWidget safeInputTextWidget;
  late UserBaseInfoModel userBaseInfoModel;
  String title = "";
  TextEditingController accountController = TextEditingController();
  FocusNode accountFocusNode = FocusNode();
  TextEditingController verController = TextEditingController();
  FocusNode verFocusNode = FocusNode();
  TextEditingController googleVerController = TextEditingController();
  FocusNode googleVerFocusNode = FocusNode();
  int registerType = 0; // 注册类型

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appTheme = context.watch<AppconfCubit>().state.appTheme;
    safeInputTextWidget =
        SafeInputTextWidget(buildContext: context, appTheme: appTheme);
    userBaseInfoModel = UserInfoManager.shared.userBaseInfoModel!;
    registerType = userBaseInfoModel.registerType ?? -1;
    if (registerType == 1) {
      accountController.text = userBaseInfoModel.mobile ?? "加载失败请重试";
    } else if (registerType == 2) {
      accountController.text = userBaseInfoModel.email ?? "加载失败请重试";
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appTheme.colorSet.textWhite,
        appBar: AppBarWrapper(
          statusBarColor: appTheme.colorSet.colorWhite,
          child: const AppBarCenterText(
            title: "绑定GA",
          ),
        ),
        body: SafeArea(
            bottom: true,
            child: BlocConsumer<ReplaceEmailCubit, ReplaceEmailState>(
              bloc: cubit,
              builder: (context, state) {
                return CustomScrollView(slivers: [
                  const SliverToBoxAdapter(
                      child: SizedBox(
                    height: 32,
                  )),
                  SliverToBoxAdapter(
                    child: safeInputTextWidget.inputTextField(
                        accountController, accountFocusNode,
                        enable: false, hintText: ""),
                  ),
                  const SliverToBoxAdapter(
                      child: SizedBox(
                    height: 32,
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
                    height: 32,
                  )),
                  SliverToBoxAdapter(
                    child: safeInputTextWidget.inputTextField(
                        googleVerController, googleVerFocusNode,
                        hintText: "谷歌验证码",
                        rightChild: safeInputTextWidget.pasteGoogleVer(
                            paste: () => paste())),
                  ),
                  const SliverToBoxAdapter(
                      child: SizedBox(
                    height: 32,
                  )),
                  SliverToBoxAdapter(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: safeInputTextWidget.loginSignButton(
                            text: "提交",
                            onTap: () {
                              if (verController.text.isEmpty) {
                                showMsg("请填写验证码");
                                return;
                              }
                              if (googleVerController.text.isEmpty) {
                                showMsg("请填写谷歌验证码");
                                return;
                              }
                              cubit.bindGa(
                                  gaCode: googleVerController.text,
                                  accountVer: verController.text);
                            })),
                  ),
                ]);
              },
              listener: (BuildContext context, ReplaceEmailState state) {
                if (state.bindPhoneSuccess ?? false) {
                  widget.didLogin();
                }
              },
            )));
  }

  // 发送验证码
  void sendVer() {
    if (registerType == 1) {
      // 发送手机号验证码
      cubit.sendBindGaVer();
    } else if (registerType == 2) {
      // 发送邮箱验证码
      cubit.sendBindGaEmailVer();
    }
  }

  // 粘贴
  void paste() async {
    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    if (data != null) {
      setState(() {
        googleVerController.text = data.text!;
      });
    }
  }
}
