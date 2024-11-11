import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/components/icon_widget.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/auth/auth_cubit.dart';
import 'package:ceex_flutter/cubit/contract/contract_state.dart';
import 'package:ceex_flutter/cubit/kline/kline_diffdepth_cubit.dart';
import 'package:ceex_flutter/cubit/kline/kline_graph_cubit.dart';
import 'package:ceex_flutter/cubit/kline/kline_trade_cubit.dart';
import 'package:ceex_flutter/cubit/kline/symbol_favorite_cubit.dart';
import 'package:ceex_flutter/cubit/kline/token_info_cubit.dart';
import 'package:ceex_flutter/cubit/symbol_ticker/symbol_ticker_cubit.dart';
import 'package:ceex_flutter/utils/app_router_observer.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:ceex_flutter/views/contract/contract_view.dart';
import 'package:ceex_flutter/views/kline/components/kline_header_portrait.dart';
import 'package:ceex_flutter/views/kline/components/kline_tab_list_view.dart';
import 'package:ceex_flutter/views/kline/components/kline_container.dart';
import 'package:ceex_flutter/views/login/login_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KlineViewParams {
  final String exchangeId;
  final String symbolId;
  final String baseTokenId;
  final String quoteTokenId;
  final String realtimeInterval;

  KlineViewParams({
    required this.exchangeId,
    required this.symbolId,
    required this.baseTokenId,
    required this.quoteTokenId,
    required this.realtimeInterval,
  });
}

class KlineView extends StatefulWidget {
  final KlineViewParams params;
  const KlineView({
    required this.params,
    super.key,
  });

  static Route route(KlineViewParams params) => MaterialPageRoute(
        builder: (ctx) => KlineView(
          params: params,
        ),
      );

  @override
  State<KlineView> createState() => _KlineViewState();
}

class _KlineViewState extends State<KlineView> with RouteAware {
  late AppTheme appTheme;
  late KlineGraphCubit graphCubit = KlineGraphCubit(
    exchangeId: widget.params.exchangeId,
    symbol: widget.params.symbolId,
  );
  late KlineTradeCubit klineTradeCubit = KlineTradeCubit(
    exchangeId: widget.params.exchangeId,
    symbolId: widget.params.symbolId,
  );
  late KlineDiffDepthCubit diffDepthCubit = KlineDiffDepthCubit(
    exchangeId: widget.params.exchangeId,
    symbolId: widget.params.symbolId,
  );
  late SymbolTickerCubit symbolTickerCubit = SymbolTickerCubit(
    exchangeId: widget.params.exchangeId,
    symbol: widget.params.symbolId,
  );
  late SymbolFavoriteCubit favoriteCubit = SymbolFavoriteCubit(
    symbolId: widget.params.symbolId,
    exchangeId: widget.params.exchangeId,
  );
  void initState() {
    super.initState();
    if (context.read<AuthCubit>().state.isLogin()) {
      favoriteCubit.refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets;
    return Scaffold(
      appBar: AppBarWrapper(
        statusBarColor: appTheme.colorSet.colorWhite,
        child: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            IconWidget(
              icon: Image.asset(
                R.ASSETS_IMAGES_AKAR_ICONS_CHEVRON_LEFT_PNG,
                width: 24,
                height: 24,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Text(
              "${widget.params.baseTokenId}/${widget.params.quoteTokenId}",
              style: appTheme.colorSet.textBlack.style(fontSize: 18),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildFooter(context),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (context) => symbolTickerCubit,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: KlineHeaderPortrait(
                  symbolId: widget.params.symbolId,
                ),
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding:
          //         EdgeInsets.only(left: 15, right: 15, top: 16, bottom: 16),
          //     child: Row(
          //       children: [
          //         IconWidget(
          //           icon: Image.asset(
          //             R.ASSETS_IMAGES_CHART_LINE_LINE_PNG,
          //             width: 24,
          //             height: 24,
          //           ),
          //         ),
          //         SizedBox(
          //           width: 12,
          //         ),
          //         IconWidget(
          //           icon: Image.asset(
          //             R.ASSETS_IMAGES_FULLSCREEN_2_LINE_PNG,
          //             width: 24,
          //             height: 24,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          SliverToBoxAdapter(
            child: KlineContainer(
              cubit: graphCubit,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    lazy: false,
                    create: (context) {
                      final cubit =
                          TokenInfoCubit(tokenId: widget.params.baseTokenId);
                      cubit.requestTokenInfo();
                      return cubit;
                    },
                  ),
                  BlocProvider(
                    lazy: false,
                    create: (context) => klineTradeCubit,
                  ),
                  BlocProvider(
                    lazy: false,
                    create: (context) => diffDepthCubit,
                  ),
                ],
                child: KlineTabListView(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: viewInsets.bottom,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    final pb = MediaQuery.of(context).viewPadding.bottom;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: pb, top: 12, left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<SymbolFavoriteCubit, SymbolFavoriteState>(
            bloc: favoriteCubit,
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  if (context.read<AuthCubit>().state.isLogin()) {
                    if (state.isFavorite ?? false) {
                      favoriteCubit.unfavorite();
                    } else {
                      favoriteCubit.favorite();
                    }
                  }
                },
                child: Image.asset(
                  (state.isFavorite ?? false)
                      ? R.ASSETS_IMAGES_STAR_SELECTED_PNG
                      : R.ASSETS_IMAGES_STAR_DEFAULT_PNG,
                  fit: BoxFit.fill,
                  width: 28,
                  height: 28,
                ),
              );
            },
          ),
          Spacer(),
          GestureDetector(
            onTap: onBuyTap,
            child: Container(
              width: 114,
              height: 44,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(R.ASSETS_IMAGES_BUY_PNG))),
              alignment: Alignment.center,
              child: Text(
                "买入",
                style: appTheme.colorSet.textWhite.style(fontSize: 16),
              ),
            ),
          ),
          GestureDetector(
            onTap: onSellTap,
            child: Container(
              width: 114,
              height: 44,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(R.ASSETS_IMAGES_SELL_PNG))),
              alignment: Alignment.center,
              child: Text(
                "卖出",
                style: appTheme.colorSet.textWhite.style(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  onBuyTap() {
    if (UserInfoManager.shared.isLogin) {
      Navigator.push(
        context,
        ContractView.route(
          viewType: BbChooseType.buy,
          symbolId: widget.params.symbolId,
        ),
      );
    } else {
      Navigator.push(context, LoginViewPage.route());
    }
  }

  onSellTap() {
    if (UserInfoManager.shared.isLogin) {
      Navigator.push(
        context,
        ContractView.route(
          viewType: BbChooseType.sell,
          symbolId: widget.params.symbolId,
          
        ),
      );
    } else {
      Navigator.push(context, LoginViewPage.route());
    }
  }

  /// cubit很多涉及WS
  /// 启动页面的cubit
  startCubit() {
    symbolTickerCubit.startTickerTimer();
    graphCubit.subscribe();
    klineTradeCubit.subscribe();
    diffDepthCubit.subscribe();
  }

  stopCubit() {
    symbolTickerCubit.stopTickerTimer();
    graphCubit.cancelSubscriptions();
    klineTradeCubit.cancelSubscriptions();
    diffDepthCubit.cancelSubscriptions();
  }

  @override
  void didChangeDependencies() {
    appTheme = context.read<AppconfCubit>().state.appTheme;
    AppRouteObserver().routeObserver.subscribe(this, ModalRoute.of(context)!);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    AppRouteObserver().routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    startCubit();
    super.didPush();
  }

  @override
  void didPopNext() {
    startCubit();
    super.didPopNext();
  }

  @override
  void didPushNext() {
    stopCubit();
    super.didPushNext();
  }

  @override
  void didPop() {
    stopCubit();
    super.didPop();
  }
}
