import 'package:ceex_flutter/components/app_bar_center_text.dart';
import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/safe/replace_account/replace_email_cubit.dart';
import 'package:ceex_flutter/cubit/safe/safe_ver_view_cubit.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:ceex_flutter/views/safe/safe_ver/safe_ver_email.dart';
import 'package:ceex_flutter/views/safe/safe_ver/safe_ver_google.dart';
import 'package:ceex_flutter/views/safe/safe_ver/safe_ver_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// 安全验证
///
class SafeVerView extends StatefulWidget {
  final String newAccount;
  final String newVerNumber;
  final String newOrderId;
  final SafeNeedVerType safeNeedVerType;
  final String areaCode;
  final cubit1 = SafeVerViewCubit();
  final VoidCallback didLogin;

  SafeVerView(
      {required this.newAccount,
      required this.newVerNumber,
      required this.newOrderId,
      required this.safeNeedVerType,
      this.areaCode = "",
      required this.didLogin,
      super.key});
  static Route route({
    required String newAccount,
    required String newVerNumber,
    required String newOrderId,
    required SafeNeedVerType safeNeedVerType,
    String? areaCode,
    VoidCallback? didLogin,
  }) =>
      MaterialPageRoute(
          builder: (context) => SafeVerView(
                newAccount: newAccount,
                newVerNumber: newVerNumber,
                newOrderId: newOrderId,
                safeNeedVerType: safeNeedVerType,
                areaCode: areaCode ?? "",
                didLogin: didLogin ?? () {},
              ));
  @override
  State<SafeVerView> createState() => _SafeVerViewState();
}

class _SafeVerViewState extends State<SafeVerView>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AppTheme appTheme;

  late TabController _tabController;
  List<Widget> tabView = [];
  List<Widget> tabTitle = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabView.length);
    initTabController();
  }

  initTabController() {
    bool bindGA = UserInfoManager.shared.userBaseInfoModel?.bindGA ?? false;
    String phone = UserInfoManager.shared.userBaseInfoModel?.mobile ?? "";
    String email = UserInfoManager.shared.userBaseInfoModel?.email ?? "";
    bool bindPhone = phone.isNotEmpty;
    bool bindEmail = email.isNotEmpty;
    int registerType =
        UserInfoManager.shared.userBaseInfoModel?.registerType ?? -1;
    if (widget.safeNeedVerType == SafeNeedVerType.replacePhone) {
      // 切换绑定手机号
      // 旧手机号
      tabView.add(SafeVerPhone(
        newAccount: widget.newAccount,
        newAccountVer: widget.newVerNumber,
        newOrderId: widget.newOrderId,
        safeNeedVerType: widget.safeNeedVerType,
        areaCode: widget.areaCode,
        cubit1: widget.cubit1,
        didLogin: widget.didLogin,
        isUseGA: bindGA,
      ));
      tabTitle.add(const Text("手机验证"));
      // 优先使用谷歌验证
      if (bindGA) {
        tabView.add(SafeVerGoogle(
          newAccount: widget.newAccount,
          newAccountVer: widget.newVerNumber,
          newOrderId: widget.newOrderId,
          safeNeedVerType: widget.safeNeedVerType,
          areaCode: widget.areaCode,
          cubit: widget.cubit1,
          isUseGA: bindGA,
        ));
        tabTitle.add(const Text("谷歌验证"));
      } else {
        tabView.add(
          SafeVerEmail(
            newAccount: widget.newAccount,
            newAccountVer: widget.newVerNumber,
            newOrderId: widget.newOrderId,
            safeNeedVerType: widget.safeNeedVerType,
            areaCode: widget.areaCode,
            cubit: widget.cubit1,
            didLogin: widget.didLogin,
            isUseGA: false,
          ),
        );
        tabTitle.add(const Text("邮箱验证"));
      }
    } else if (widget.safeNeedVerType == SafeNeedVerType.replaceEmail) {
      // 切换绑定邮箱号
      // 旧邮箱
      tabView.add(
        SafeVerEmail(
          newAccount: widget.newAccount,
          newAccountVer: widget.newVerNumber,
          newOrderId: widget.newOrderId,
          safeNeedVerType: widget.safeNeedVerType,
          areaCode: widget.areaCode,
          cubit: widget.cubit1,
          didLogin: widget.didLogin,
          isUseGA: bindGA,
        ),
      );
      tabTitle.add(const Text("邮箱验证"));
      // 优先使用谷歌验证
      if (bindGA) {
        tabView.add(SafeVerGoogle(
          newAccount: widget.newAccount,
          newAccountVer: widget.newVerNumber,
          newOrderId: widget.newOrderId,
          safeNeedVerType: widget.safeNeedVerType,
          areaCode: widget.areaCode,
          cubit: widget.cubit1,
          isUseGA: bindGA,
        ));
        tabTitle.add(const Text("谷歌验证"));
      } else {
        tabView.add(SafeVerPhone(
          newAccount: widget.newAccount,
          newAccountVer: widget.newVerNumber,
          newOrderId: widget.newOrderId,
          safeNeedVerType: widget.safeNeedVerType,
          areaCode: widget.areaCode,
          cubit1: widget.cubit1,
          didLogin: widget.didLogin,
          isUseGA: false,
        ));
        tabTitle.add(const Text("手机验证"));
      }
    } else if (widget.safeNeedVerType == SafeNeedVerType.bindPhone) {
      // 绑定手机号 只有邮箱验证 没有google验证
      // 旧邮箱
      tabView.add(
        SafeVerEmail(
          newAccount: widget.newAccount,
          newAccountVer: widget.newVerNumber,
          newOrderId: widget.newOrderId,
          safeNeedVerType: widget.safeNeedVerType,
          areaCode: widget.areaCode,
          cubit: widget.cubit1,
          didLogin: widget.didLogin,
          isUseGA: bindGA,
        ),
      );
      tabTitle.add(const Text("邮箱验证"));
    } else if (widget.safeNeedVerType == SafeNeedVerType.bindEmail) {
      // 绑定邮箱 只有手机号验证 没有google验证
      // 旧手机号
      tabView.add(
        SafeVerPhone(
          newAccount: widget.newAccount,
          newAccountVer: widget.newVerNumber,
          newOrderId: widget.newOrderId,
          safeNeedVerType: widget.safeNeedVerType,
          areaCode: widget.areaCode,
          cubit1: widget.cubit1,
          didLogin: widget.didLogin,
          isUseGA: bindGA,
        ),
      );
      tabTitle.add(const Text("手机验证"));
    } else if (widget.safeNeedVerType == SafeNeedVerType.moneyPassword) {
      // 更改自己密码 只有注册时的账号验证
      if (registerType == 1) {
        // 手机号注册
        tabView.add(
          SafeVerPhone(
            newAccount: widget.newAccount,
            newAccountVer: widget.newVerNumber,
            newOrderId: widget.newOrderId,
            safeNeedVerType: widget.safeNeedVerType,
            areaCode: widget.areaCode,
            cubit1: widget.cubit1,
            didLogin: widget.didLogin,
            isUseGA: bindGA,
          ),
        );
        tabTitle.add(const Text("手机验证"));
      } else if (registerType == 2) {
        // 邮箱注册
        tabView.add(
          SafeVerEmail(
            newAccount: widget.newAccount,
            newAccountVer: widget.newVerNumber,
            newOrderId: widget.newOrderId,
            safeNeedVerType: widget.safeNeedVerType,
            areaCode: widget.areaCode,
            cubit: widget.cubit1,
            didLogin: widget.didLogin,
            isUseGA: bindGA,
          ),
        );
        tabTitle.add(const Text("邮箱验证"));
      }
    } else {
      if (bindEmail) {
        tabView.add(
          SafeVerEmail(
            newAccount: widget.newAccount,
            newAccountVer: widget.newVerNumber,
            newOrderId: widget.newOrderId,
            safeNeedVerType: widget.safeNeedVerType,
            areaCode: widget.areaCode,
            cubit: widget.cubit1,
            didLogin: widget.didLogin,
            isUseGA: false,
          ),
        );
        tabTitle.add(const Text("邮箱验证"));
      }
      if (bindPhone) {
        tabView.add(SafeVerPhone(
          newAccount: widget.newAccount,
          newAccountVer: widget.newVerNumber,
          newOrderId: widget.newOrderId,
          safeNeedVerType: widget.safeNeedVerType,
          areaCode: widget.areaCode,
          cubit1: widget.cubit1,
          didLogin: widget.didLogin,
          isUseGA: false,
        ));
        tabTitle.add(const Text("手机验证"));
      }
      if (bindGA) {
        tabView.add(SafeVerGoogle(
          newAccount: widget.newAccount,
          newAccountVer: widget.newVerNumber,
          newOrderId: widget.newOrderId,
          safeNeedVerType: widget.safeNeedVerType,
          areaCode: widget.areaCode,
          cubit: widget.cubit1,
          isUseGA: bindGA,
        ));
        tabTitle.add(const Text("谷歌验证"));
      }
    }

    _tabController = TabController(vsync: this, length: tabView.length);
    _tabController.addListener(_handleTabChange);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appTheme = context.watch<AppconfCubit>().state.appTheme;
  }

  void _handleTabChange() {}

  @override
  void dispose() {
    super.dispose();
    widget.cubit1.close();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); //保存状态有效
    return Scaffold(
      backgroundColor: appTheme.colorSet.textWhite,
      appBar: AppBarWrapper(
        statusBarColor: appTheme.colorSet.colorWhite,
        child: const AppBarCenterText(
          title: "安全验证",
        ),
      ),
      body: SafeArea(
          bottom: true,
          child: BlocConsumer<SafeVerViewCubit, SafeVerViewState>(
            bloc: widget.cubit1,
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabBar(
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      labelPadding:
                          const EdgeInsets.only(right: 32, bottom: 10),
                      indicatorColor: appTheme.colorSet.colorDark,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: appTheme.colorSet.textBlack,
                      unselectedLabelColor: appTheme.colorSet.textGrey,
                      controller: _tabController,
                      padding: const EdgeInsets.only(left: 15),
                      unselectedLabelStyle: appTheme.colorSet.textBlack
                          .style(fontSize: 16, fontWeight: FontWeight.w600),
                      labelStyle: appTheme.colorSet.textGrey2
                          .style(fontSize: 16, fontWeight: FontWeight.w600),
                      tabs: tabTitle),
                  Expanded(
                      child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: tabView,
                  ))
                ],
              );
            },
            listener: (BuildContext context, SafeVerViewState state) {
              if (state.bindPhoneSuccess ?? false) {
                Navigator.of(context)
                  ..pop()
                  ..pop();
              }
              if (state.needBack ?? false) {
                widget.didLogin();
              }
            },
          )),
    );
  }
}
