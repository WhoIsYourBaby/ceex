import 'package:ceex_flutter/components/app_bar_center_text.dart';
import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/safe/replace_account/replace_email_cubit.dart';
import 'package:ceex_flutter/cubit/safe/safe_center_view_cubit.dart';
import 'package:ceex_flutter/model/publish/countries_model.dart';
import 'package:ceex_flutter/utils/config.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:ceex_flutter/views/login/area_choose.dart';
import 'package:ceex_flutter/views/safe/components/safe_input_text_widget.dart';
import 'package:ceex_flutter/views/safe/safe_ver/safe_ver_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:zendesk_helpcenter/zendesk_helpcenter.dart';

/// 绑定手机
class BindPhone extends StatefulWidget {
  final SafeVerType safeVerType;
  final bool isFromSafeCenter;
  final VoidCallback didLogin;
  const BindPhone(
      {required this.safeVerType,
      required this.didLogin,
      required this.isFromSafeCenter,
      super.key});
  static Route route(
          {required SafeVerType safeVerType,
          required bool isFromSafeCenter,
          VoidCallback? didLogin}) =>
      MaterialPageRoute(
          builder: (context) => BindPhone(
                safeVerType: safeVerType,
                isFromSafeCenter: isFromSafeCenter,
                didLogin: didLogin ?? () {},
              ));

  @override
  State<BindPhone> createState() => _BindPhoneState();
}

class _BindPhoneState extends State<BindPhone> {
  late AppTheme appTheme;
  late SafeInputTextWidget safeInputTextWidget;
  late BuildContext _buildContext;
  final cubit = ReplaceEmailCubit();
  TextEditingController phoneController = TextEditingController();
  FocusNode phoneFocusNode = FocusNode();
  TextEditingController verController = TextEditingController();
  FocusNode verFocusNode = FocusNode();

  String title = "";

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
    _buildContext = context;
    appTheme = context.watch<AppconfCubit>().state.appTheme;
    safeInputTextWidget =
        SafeInputTextWidget(buildContext: context, appTheme: appTheme);
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
    return Scaffold(
        backgroundColor: appTheme.colorSet.textWhite,
        appBar: AppBarWrapper(
          statusBarColor: appTheme.colorSet.colorWhite,
          child: const AppBarCenterText(
            title: "绑定手机号",
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
                          leftChild: safeInputTextWidget.areaCodeChoose(
                              areaChoose: () => areaChoose(),
                              areaCode: state.areaCode ?? "86"),
                          hintText: "请输入手机号"),
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

  void submit() {
    if (cubit.state.orderId == null || cubit.state.orderId!.isEmpty) {
      showMsg("请先获取验证码");
    } else {
      Navigator.push(
          context,
          SafeVerView.route(
              newAccount: phoneController.text,
              newVerNumber: verController.text,
              areaCode: cubit.state.areaCode,
              newOrderId: cubit.state.orderId ?? "",
              didLogin: widget.didLogin,
              safeNeedVerType: SafeNeedVerType.bindPhone));
    }
  }

  // 发送验证码
  void sendVer() {
    if (phoneController.text.isNotEmpty) {
      cubit.sendBindPhoneVer(
        mobile: phoneController.text,
      );
    } else {
      showToast("请填写手机号");
    }
  }

  void areaChoose() async {
    var result = await Navigator.push(_buildContext, AreaChoose.route());
    if (result != null) {
      CountriesModel countriesModel = result as CountriesModel;
      cubit.upDataAreaCode(countriesModel.nationalCode!);
    }
  }
}
