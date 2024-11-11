import 'dart:math';

import 'package:ceex_flutter/announcement/announcement_view.dart';
import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/components/common_webview.dart';
import 'package:ceex_flutter/components/icon_widget.dart';
import 'package:ceex_flutter/components/news_cell.dart';
import 'package:ceex_flutter/components/primary_button.dart';
import 'package:ceex_flutter/components/row_item_wrapper.dart';
import 'package:ceex_flutter/components/search_style_button.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/auth/auth_cubit.dart';
import 'package:ceex_flutter/cubit/basic/basic_config_cubit.dart';
import 'package:ceex_flutter/cubit/home/announcement_cubit.dart';
import 'package:ceex_flutter/cubit/home/home_assets_cubit.dart';
import 'package:ceex_flutter/cubit/home/home_market_cubit.dart';
import 'package:ceex_flutter/cubit/search_tokens/search_tokens_cubit.dart';
import 'package:ceex_flutter/model/appconfig/symbol_model.dart';
import 'package:ceex_flutter/model/user/user_base_info_model.dart';
import 'package:ceex_flutter/utils/app_router_observer.dart';
import 'package:ceex_flutter/utils/config.dart';
import 'package:ceex_flutter/utils/enums.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:ceex_flutter/views/assets/components/net_select_view.dart';
import 'package:ceex_flutter/views/assets/recharge/recharge_view.dart';
import 'package:ceex_flutter/views/assets/search_tokens/show_can_tran_tokens_view.dart';
import 'package:ceex_flutter/views/assets/withdraw/withdraw_view.dart';
import 'package:ceex_flutter/views/home/components/home_assets_sliver.dart';
import 'package:ceex_flutter/views/home/components/home_market_sliver.dart';
import 'package:ceex_flutter/views/home/components/home_welcome_sliver.dart';
import 'package:ceex_flutter/views/home/components/up_version_dialog.dart';
import 'package:ceex_flutter/views/login/login_view_page.dart';
import 'package:ceex_flutter/views/mine/mine_page_view.dart';
import 'package:ceex_flutter/views/mine/my_invitation_view.dart';
import 'package:ceex_flutter/views/root_tabbar.dart';
import 'package:ceex_flutter/views/search/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zendesk_helpcenter/zendesk_helpcenter.dart';

class HomeView extends StatefulWidget {
  final TabbarControlCallback? tabbarControl;
  const HomeView({this.tabbarControl, super.key});

  static Route route() => MaterialPageRoute(
        builder: (context) => const HomeView(),
        settings: RouteSettings(name: HomeView.path),
      );

  static String path = "/home";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with RouteAware {
  final announcementCubit = AnnouncementCubit();
  late HomeMarketCubit marketCubit;
  final assetsCubit = HomeAssetsCubit();
  bool isShowForceUpdateDialog = false;
  @override
  void initState() {
    super.initState();
    marketCubit = HomeMarketCubit(
      type: HomeTabType.hot,
    );
    announcementCubit.requestAnnouncement();

    assetsCubit.requestAssets();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWrapper(
        statusBarColor: appTheme.colorSet.colorWhite,
        child: _buildAppBar(context, appTheme),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: BlocConsumer<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state.isLogin()) {
                  return BlocProvider(
                    create: (context) => assetsCubit,
                    child: HomeAssetsSliver(),
                  );
                } else {
                  return HomeWelcomeSliver(
                    onLoginTap: onLoginTap,
                  );
                }
              },
              listener: (BuildContext context, AuthState state) {
                if ((state.needForceUpdate ?? false) &&
                    !isShowForceUpdateDialog) {
                  upVersionDialog(context);
                  setState(() {
                    isShowForceUpdateDialog = true;
                  });
                }
              },
            ),
          ),
          // SliverToBoxAdapter(
          //   child: HomeStepsSliver(),
          // ),
          // 一排按钮
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 15,
                right: 15,
              ),
              child: RowItemWrapper(
                size: Size(screenSize.width, 80),
                scrollLimit: 4,
                items: _buildItems1(context),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: _buildTradeEntry(context),
          ),
          SliverToBoxAdapter(
            child: BlocConsumer<BasicConfigCubit, BasicConfigState>(
              builder: (context, state) {
                return BlocProvider(
                  create: (context) {
                    return marketCubit;
                  },
                  child: HomeMarketSliver(),
                );
              },
              listener: (context, state) {
                configMarketCubit();
              },
            ),
          ),
          SliverToBoxAdapter(
            child: _buildNewsSliver(context, appTheme),
          ),
          SliverToBoxAdapter(
            child: _buildContactUS(context, appTheme),
          ),
        ],
      ),
    );
  }

  /// 构建顶部导航
  Widget _buildAppBar(BuildContext context, AppTheme appTheme) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: [
          // 左侧用户图标
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return IconWidget(
                onTap: onLoginTap,
                // onTap: ()=> Navigator.pushNamed(context, MinePageView.path),
                icon: Image.asset(state.isLogin()
                    ? R.ASSETS_IMAGES_AVATAR_LOGIN_PNG
                    : R.ASSETS_IMAGES_AVATAR_NOT_LOGGED_IN_PNG),
              );
            },
          ),
          SizedBox(width: 16),
          // 中间输入框样式，点击后跳转到搜索页面
          Flexible(
            child: SearchStyleButton(
              onTap: () {
                Navigator.push(context, SearchView.route());
              },
            ),
          ),
          SizedBox(width: 20),
          // 扫描二维码
          // IconWidget(
          //   icon: Image.asset(R.ASSETS_IMAGES_FULLSCREEN_LINE_PNG),
          //   onTap: () {
          //     showMsg("暂缓开通");
          //   },
          // ),
          // SizedBox(width: 20),
          // // 消息提醒
          // IconWidget(
          //   icon: Image.asset(R.ASSETS_IMAGES_NOTIFICATION_LINE_PNG),
          //   onTap: () {
          //     showMsg("暂缓开通");
          //   },
          // ),
        ],
      ),
    );
  }

  /// 经理人/理财/邀请/客服
  List<Widget> _buildItems1(BuildContext context) {
    return <Widget>[
      RowItem(
        image: Image.asset(R.ASSETS_IMAGES_USER_LINE_PNG),
        title: AppLocalizations.of(context)!.rechargeCoin,
        onTap: () {
          if (!UserInfoManager.shared.isLogin) {
            goToLogin();
            return;
          }
          Navigator.push(
            context,
            ShowCanTranTokensView.route((model) {
              if ((model.chainTypes ?? []).isEmpty) {
                // 可充值的币种下没有网络可供选择
                Navigator.push(
                    context,
                    RechargeView.route(
                        tokenId: model.tokenId ?? "",
                        chainType: const ChainTypesModel(),
                        chainTypes: model.chainTypes ?? []));
              } else {
                Navigator.push(context, NetSelectView.route(model.chainTypes!))
                    .then((value) {
                  if (value != null) {
                    Navigator.push(
                        context,
                        RechargeView.route(
                            tokenId: model.tokenId ?? "",
                            chainType: value,
                            chainTypes: model.chainTypes ?? []));
                  }
                });
              }
            }, showCanTranTokensType: ShowCanTranTokensType.withdraw),
          );
        },
      ),
      RowItem(
        image: Image.asset(R.ASSETS_IMAGES_PIG_MONEY_LINE_PNG),
        title: AppLocalizations.of(context)!.withdrawalCoin,
        onTap: () {
          if (!UserInfoManager.shared.isLogin) {
            goToLogin();
            return;
          }
          Navigator.push(context, WithdrawView.route());
        },
      ),
      RowItem(
        image: Image.asset(R.ASSETS_IMAGES_GIFT_LINE_PNG),
        title: AppLocalizations.of(context)!.homeInvite,
        onTap: goToInvite,
      ),
      RowItem(
        image: Image.asset(R.ASSETS_IMAGES_SERVICE_LINE_PNG),
        title: AppLocalizations.of(context)!.homeService,
        onTap: () async {
          if (!UserInfoManager.shared.isLogin) {
            goToLogin();
            return;
          }
          ZendeskHelpcenter.initialize(
            appId: kZendeskAppId,
            clientId: kZendeskClientId,
            urlString: kZendeskUrl,
            name: UserInfoManager.shared.userBaseInfoModel?.userId,
            email: UserInfoManager.shared.userBaseInfoModel?.email,
          );
          ZendeskHelpcenter.showRequestList();
        },
      ),
    ];
  }

  /// 聚合交易/挖矿中心/理财
  Widget _buildTradeEntry(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TODO: 添加tap事件
          GestureDetector(
            onTap: onTradeTap,
            child: Image.asset(
              R.ASSETS_IMAGES_GROUP_40964_PNG,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: goToInvite,
                child: Image.asset(R.ASSETS_IMAGES_LAUNCHPAD_PNG),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: goToAnnouncement,
                child: Image.asset(R.ASSETS_IMAGES_LICHAI_PNG),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactUS(BuildContext context, AppTheme appTheme) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.homeContactUS,
            style: appTheme.colorSet.textBlack.style(fontSize: 18),
          ),
          Row(
            // size: Size(screenSize.width - 15 * 2, 80),
            // scrollLimit: 4,
            children: [
              RowItem(
                image: Image.asset(R.ASSETS_IMAGES_TELEGRAM_LINE_PNG),
                title: AppLocalizations.of(context)!.homeTelegram,
                onTap: () async {
                  await launchUrl(Uri.parse("https://t.me/CEEX_EN"));
                },
              ),
              SizedBox(width: 32),
              RowItem(
                image: Image.asset(R.ASSETS_IMAGES_SOCIAL_X_LINE_PNG),
                title: AppLocalizations.of(context)!.homeTwitter,
                onTap: () async {
                  await launchUrl(Uri.parse("https://twitter.com/ceexglobal"));
                },
              ),
              SizedBox(width: 32),
              RowItem(
                image: Image.asset(R.ASSETS_IMAGES_DISCORD_LINE_PNG),
                title: AppLocalizations.of(context)!.homeDC,
                onTap: () async {
                  await launchUrl(
                      Uri.parse("https://discord.com/invite/3559JyWc8c"));
                },
              ),
              // RowItem(
              //   image: Image.asset(R.ASSETS_IMAGES_FACEBOOK_LINE_PNG),
              //   title: AppLocalizations.of(context)!.homeFacebook,
              //   onTap: () {
              //     showMsg("暂缓开通");
              //   },
              // ),
              // RowItem(
              //   image: Image.asset(R.ASSETS_IMAGES_YOUTUBE_LINE_PNG),
              //   title: AppLocalizations.of(context)!.homeYoutube,
              //   onTap: () {
              //     showMsg("暂缓开通");
              //   },
              // ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNewsSliver(BuildContext context, AppTheme appTheme) {
    return BlocBuilder<AnnouncementCubit, AnnouncementState>(
      bloc: announcementCubit,
      builder: (context, state) {
        final annoList = state.announcementList ?? [];
        return Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "公告",
                style: appTheme.colorSet.textBlack.style(fontSize: 18),
              ),
              ...(annoList.sublist(0, min(annoList.length, 3)))
                  .map(
                    (e) => NewsCell(
                      onTap: () {
                        if (e.directUrl != null) {
                          Navigator.push(
                            context,
                            CommonWebvView.route(
                              e.directUrl!,
                              e.title,
                            ),
                          );
                        }
                      },
                      title: e.title ?? "",
                      time: DateTime.fromMillisecondsSinceEpoch(
                          int.tryParse(e.publishTime ?? "") ?? 0),
                    ),
                  )
                  .toList(),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryButton(
                    size: Size(280, 44),
                    onTap: goToAnnouncement,
                    bkgColor: appTheme.colorSet.colorGrey1,
                    child: Text(
                      AppLocalizations.of(context)!.homeAllNotify,
                      style: appTheme.colorSet.textBlack.style(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void onTradeTap() {
    if (widget.tabbarControl != null) {
      widget.tabbarControl!(2);
    }
  }

  void onLoginTap() {
    if (UserInfoManager.shared.isLogin) {
      Navigator.push(context, MinePageView.route(true));
    } else {
      goToLogin();
    }
  }

  void goToLogin() {
    Navigator.push(
      context,
      LoginViewPage.route(
        didLogin: () async {
          if (UserInfoManager.shared.isLogin) {
            Navigator.popUntil(context, (route) {
              return route.settings.name == RootTabBar.path;
            });
            assetsCubit.requestAssets();
          }
        },
      ),
    );
  }

  void goToInvite() {
    if (!UserInfoManager.shared.isLogin) {
      goToLogin();
      return;
    }
    Navigator.push(context, MyInvitationView.route());
  }

  void goToAnnouncement() {
    Navigator.push(
      context,
      AnnouncementView.route(announcementCubit),
    );
  }

  @override
  void didChangeDependencies() {
    AppRouteObserver().routeObserver.subscribe(this, ModalRoute.of(context)!);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    AppRouteObserver().routeObserver.unsubscribe(this);
    super.dispose();
  }

  /// push到本页面
  @override
  void didPush() {
    assetsCubit.requestAssets();
    configMarketCubit();
    super.didPush();
  }

  /// 从下个页面返回
  @override
  void didPopNext() {
    assetsCubit.requestAssets();
    configMarketCubit();
    super.didPopNext();
  }

  /// push到下个页面
  @override
  void didPushNext() {
    marketCubit.cancelSubscriptions();
    super.didPushNext();
  }

  /// 本页面pop
  @override
  void didPop() {
    marketCubit.cancelSubscriptions();
    super.didPop();
  }

  configMarketCubit() {
    final allSymbols =
        context.read<BasicConfigCubit>().state.configModel?.symbol;
    final hotSymbols =
        context.read<BasicConfigCubit>().state.configModel?.recommendSymbols;
    final newSymbols = context
        .read<BasicConfigCubit>()
        .state
        .configModel
        ?.customQuoteToken
        ?.firstWhere((element) => element.tokenName == "新币")
        .quoteTokenSymbols;
    marketCubit.setupSymbols(
      allSymbols: allSymbols,
      hotSymbols: hotSymbols,
      newSymbols: newSymbols,
    );
  }
}
