import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/basic/basic_config_cubit.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:ceex_flutter/views/contract/contract_view.dart';
import 'package:ceex_flutter/views/login/login_view_page.dart';
import 'package:ceex_flutter/views/market/market_view.dart';
import 'package:ceex_flutter/views/assets/assets_view.dart';
import 'package:ceex_flutter/views/mine/mine_page_view.dart';
import 'package:flutter/material.dart';
import 'package:ceex_flutter/views/home/home_view.dart';
import 'package:ceex_flutter/views/mine/mine_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';
import 'package:oktoast/oktoast.dart';

typedef TabbarControlCallback = void Function(int index);

class RootTabBar extends StatefulWidget {
  const RootTabBar({
    super.key,
  });

  static Route route() => MaterialPageRoute(
        builder: (context) => const RootTabBar(),
        settings: RouteSettings(name: RootTabBar.path),
      );

  static String path = "/";

  @override
  State<RootTabBar> createState() => _RootTabBarState();
}

class _RootTabBarState extends State<RootTabBar>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int currentPageIndex = 0;

  late AppTheme appTheme;

  late final List<Widget> _tabViews = [
    HomeView(
      tabbarControl: onTabbarTap,
    ),
    const MarketView(),
    const ContractView(),
    const AssetsView(),
    const MinePageView(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    Future.delayed(
      Duration(milliseconds: 17),
      () {
        showLoading();
        context.read<BasicConfigCubit>().fetchBasicConfig().then((value) {
          dismissAllToast();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _tabViews,
      ),
      bottomNavigationBar: BottomAppBar(
        color: appTheme.colorSet.colorWhite,
        notchMargin: 0,
        elevation: 2.0,
        shape: CircularNotchedRectangle(),
        child: SizedBox(
          height: kToolbarHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomAppBarItem(
                index: 0,
                icon: R.ASSETS_IMAGES_HOME_FILL_PNG,
                title: AppLocalizations.of(context)!.homeViewTitle,
                isSelect: currentPageIndex == 0,
                onTap: onTabbarTap,
              ),
              BottomAppBarItem(
                index: 1,
                icon: R.ASSETS_IMAGES_STOCK_LINE_PNG,
                title: AppLocalizations.of(context)!.marketViewTitle,
                isSelect: currentPageIndex == 1,
                onTap: onTabbarTap,
              ),
              BottomAppBarItem(
                index: 2,
                icon: R.ASSETS_IMAGES_TRANSFER_VERTICAL_LINE_PNG,
                title: AppLocalizations.of(context)!.coinCoinTitle,
                isSelect: currentPageIndex == 2,
                onTap: onTabbarTap,
              ),
              BottomAppBarItem(
                index: 3,
                icon: R.ASSETS_IMAGES_COUPON_LINE_PNG,
                title: AppLocalizations.of(context)!.assetsTitle,
                isSelect: currentPageIndex == 3,
                onTap: onTabbarTap,
              ),
              BottomAppBarItem(
                index: 4,
                icon: R.ASSETS_IMAGES_WALLET_LINE_PNG,
                title: AppLocalizations.of(context)!.mineViewTitle,
                isSelect: currentPageIndex == 4,
                onTap: onTabbarTap,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTabbarTap(int index) {
    // 资产/我的需要判断登录
    if (index == 3) {
      if (!UserInfoManager.shared.isLogin) {
        Navigator.push(
          context,
          LoginViewPage.route(
            didLogin: () {
              if (UserInfoManager.shared.isLogin) {
                Navigator.popUntil(
                  context,
                  (route) => route.settings.name == RootTabBar.path,
                );
              }
            },
          ),
        );
        return;
      }
    }
    _pageController.jumpToPage(index);
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  void didChangeDependencies() {
    appTheme = context.read<AppconfCubit>().state.appTheme;
    super.didChangeDependencies();
  }
}

class BottomAppBarItem extends StatelessWidget {
  final int index;
  final String icon;
  final String title;
  final bool isSelect;
  final void Function(int) onTap;
  const BottomAppBarItem({
    required this.index,
    required this.icon,
    required this.title,
    required this.isSelect,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Container(
        padding: EdgeInsets.only(top: 6),
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              icon,
              color: isSelect
                  ? appTheme.colorSet.textBlack
                  : appTheme.colorSet.textGrey3,
            ),
            Text(
              title,
              style: isSelect
                  ? appTheme.colorSet.textBlack.style()
                  : appTheme.colorSet.textGrey3.style(),
            ),
          ],
        ),
      ),
    );
  }
}
