import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/components/primary_button.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/auth/auth_cubit.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';
import 'package:ceex_flutter/utils/dio_manager.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:ceex_flutter/views/mine/components/mine_dialog.dart';
import 'package:ceex_flutter/views/mine/components/setting_app_bar.dart';
import 'package:ceex_flutter/views/root_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  static Route route() =>
      MaterialPageRoute(builder: (context) => const SettingView());

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  late AppTheme appTheme;

  PackageInfo? _packageInfo;

  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((value) {
      setState(() {
        _packageInfo = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    appTheme = context.watch<AppconfCubit>().state.appTheme;
    return Scaffold(
      appBar: AppBarWrapper(
        statusBarColor: appTheme.colorSet.colorWhite,
        child: SettingAppBar(
          title: AppLocalizations.of(context)!.setting,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          // SliverToBoxAdapter(
          //   child: _childBuild(context,
          //       title: AppLocalizations.of(context)!.language,
          //       conn: AppLocalizations.of(context)!.localLanguage,
          //       type: SettingOnClickType.changeLanguage),
          // ),
          // SliverToBoxAdapter(
          //   child: _childBuild(context, title: "计价货币", conn: "人民币"),
          // ),
          // SliverToBoxAdapter(
          //   child: _childBuild(
          //     context,
          //     title: "API",
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: _childBuild(context, title: "红绿色", conn: "绿涨红跌"),
          // ),
          // SliverToBoxAdapter(
          //   child: _childBuild(context, title: "切换线路", conn: ""),
          // ),
          SliverToBoxAdapter(
            child: _childBuild(
              context,
              title: "版本",
              type: SettingOnClickType.version,
              conn:
                  "${_packageInfo?.version ?? ""}+${_packageInfo?.buildNumber ?? 1}",
            ),
          ),
          if (UserInfoManager.shared.isLogin)
            SliverToBoxAdapter(
              child: _childBuild(
                context,
                title: "注销账号",
                type: SettingOnClickType.cancel,
              ),
            ),
          if (UserInfoManager.shared.isLogin)
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: PrimaryButton(
                  size: Size(MediaQuery.of(context).size.width * 0.8, 48),
                  onTap: onLogoutTap,
                  child: Text(
                    "退出登录",
                    style: appTheme.colorSet.textWhite.style(fontSize: 16),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _childBuild(BuildContext context,
      {required String title,
      String conn = "",
      SettingOnClickType type = SettingOnClickType.none}) {
    return GestureDetector(
        onTap: () => onClick(type, context),
        child: Container(
          color: appTheme.colorSet.textWhite,
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
          child: Row(
            children: [
              Text(
                title,
                style: appTheme.colorSet.textBlack.style(fontSize: 15),
              ),
              const Expanded(child: SizedBox()),
              Text(
                conn,
                style: appTheme.colorSet.textGrey.style(fontSize: 12),
              ),
              const SizedBox(
                width: 8,
              ),
              Image.asset(
                R.ASSETS_IMAGES_CHEVRON_RIGHT_PNG,
                width: 12,
                height: 12,
              )
            ],
          ),
        ));
  }

  onClick(SettingOnClickType type, BuildContext context) async {
    switch (type) {
      case SettingOnClickType.changeLanguage:
        // changeLanguage(context: context);
        // showMsg("暂缓开通");
        break;
      case SettingOnClickType.logout:
        if (context.read<AuthCubit>().state.isLogin()) {
          UserInfoManager.shared.clearUserInfoAndCookie();
          await DioManager.shared.clearCookie();
          context.read<AuthCubit>().requestUserBaseInfo();
        }
        Navigator.pushAndRemoveUntil(
            context, RootTabBar.route(), (route) => false);
        break;
      case SettingOnClickType.version:
        break;
      case SettingOnClickType.cancel:
        onCancelTap();
        break;
      default:
        showMsg("暂缓开通");
        break;
    }
  }

  onCancelTap() async {
    final willLogout = await showDialog<bool?>(
      context: context,
      builder: (context) {
        final contentStyle = context
            .read<AppconfCubit>()
            .state
            .appTheme
            .colorSet
            .textBlack
            .style(
              fontSize: 14,
            );
        return AlertDialog(
          title: Text(
            "你确定要注销账号吗？",
            style: context
                .read<AppconfCubit>()
                .state
                .appTheme
                .colorSet
                .textBlack
                .style(
                  fontSize: 18,
                ),
          ),
          content: RichText(
            text: TextSpan(
              text: "感谢您使用CEEX应用。如果您确定要注销您的账户，请注意以下事项：\n",
              style: contentStyle.copyWith(fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                  text: "- 注销账户后，您将无法再访问您的个人资料、历史记录和其他相关信息。\n",
                  style: contentStyle,
                ),
                TextSpan(
                  text: "- 所有与您账户相关的数据将被永久删除，无法恢复。\n",
                  style: contentStyle,
                ),
                TextSpan(
                  text: "- 如果您有任何未完成的交易或待处理事项，请在注销前完成或处理。\n",
                  style: contentStyle,
                ),
                TextSpan(
                  text: "- 注销冷静期7天，期间登录视为放弃注销。如果您仍然决定注销账户，请点击下方按钮确认注销。",
                  style: contentStyle,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("取消"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text("确定"),
            ),
          ],
        );
      },
    );
    if (willLogout == true) {
      showMsg("您的账号已经进入注销流程");
      Future.delayed(Duration(seconds: 2), () async {
        UserInfoManager.shared.clearUserInfoAndCookie();
        await DioManager.shared.clearCookie();
        context.read<AuthCubit>().requestUserBaseInfo();
        Navigator.pushAndRemoveUntil(
          context,
          RootTabBar.route(),
          (route) => false,
        );
      });
    }
  }

  onLogoutTap() async {
    final willLogout = await showDialog<bool?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("你确定要退出登录吗？"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("取消"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text("确定"),
            ),
          ],
        );
      },
    );
    if (willLogout == true) {
      UserInfoManager.shared.clearUserInfoAndCookie();
      await DioManager.shared.clearCookie();
      context.read<AuthCubit>().requestUserBaseInfo();
      Navigator.pushAndRemoveUntil(
          context, RootTabBar.route(), (route) => false);
    }
  }
}

enum SettingOnClickType {
  changeLanguage,
  none,
  logout,
  version,
  // 注销账号
  cancel,
}
