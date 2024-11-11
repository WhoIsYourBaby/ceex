import 'dart:async';

import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/components/empty_widget.dart';
import 'package:ceex_flutter/components/search_style_button.dart';
import 'package:ceex_flutter/components/symbol_market2_cell.dart';
import 'package:ceex_flutter/components/symbol_market_cell.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/basic/basic_config_cubit.dart';
import 'package:ceex_flutter/cubit/market_view/market_view_cubit.dart';
import 'package:ceex_flutter/model/model.dart';
import 'package:ceex_flutter/repository/repository.dart';
import 'package:ceex_flutter/utils/app_router_observer.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:ceex_flutter/views/kline/kline_view.dart';
import 'package:ceex_flutter/views/market/favorite_edit_view.dart';
import 'package:ceex_flutter/views/search/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:oktoast/oktoast.dart';

class MarketView extends StatefulWidget {
  const MarketView({super.key});

  static Route route() =>
      MaterialPageRoute(builder: (context) => const MarketView());

  @override
  State<MarketView> createState() => _MarketViewState();
}

class _MarketViewState extends State<MarketView> with RouteAware {
  late AppTheme appTheme;

  final marketCubit = MarketViewCubit();

  @override
  void initState() {
    super.initState();

    marketCubit.selectType(MarketTabType.coinPair);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWrapper(
        height: kToolbarHeight + 60,
        statusBarColor: appTheme.colorSet.colorWhite,
        child: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: SearchStyleButton(
                      onTap: () {
                        Navigator.push(context, SearchView.route())
                            .then((value) {
                          setupCubit();
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<MarketViewCubit, MarketViewState>(
                bloc: marketCubit,
                builder: (context, state) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () => marketCubit.selectType(MarketTabType.star),
                        child: Text(
                          "自选",
                          style: state.type == MarketTabType.star
                              ? appTheme.colorSet.textBlack.style(
                                  fontSize: 16, fontWeight: FontWeight.w600)
                              : appTheme.colorSet.textGrey.style(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      GestureDetector(
                        onTap: () =>
                            marketCubit.selectType(MarketTabType.coinPair),
                        child: Text(
                          "币币",
                          style: state.type == MarketTabType.coinPair
                              ? appTheme.colorSet.textBlack.style(
                                  fontSize: 16, fontWeight: FontWeight.w600)
                              : appTheme.colorSet.textGrey.style(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: onEditTap,
                        child: Image.asset(
                          R.ASSETS_IMAGES_EDIT_3_LINE_PNG,
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ],
                  );
                },
              ),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "名称/成交量",
                      style: appTheme.colorSet.textGrey.style(fontSize: 12),
                    ),
                    flex: 6,
                  ),
                  Expanded(
                    child: Text(
                      "24H涨跌",
                      style: appTheme.colorSet.textGrey.style(fontSize: 12),
                    ),
                    flex: 4,
                  ),
                  Expanded(
                    child: Text(
                      "最新价/涨跌幅",
                      textAlign: TextAlign.end,
                      style: appTheme.colorSet.textGrey.style(fontSize: 12),
                    ),
                    flex: 4,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<MarketViewCubit, MarketViewState>(
        bloc: marketCubit,
        builder: (context, state) {
          final marketList = state.currentList();
          if (state.type == MarketTabType.star &&
                  !UserInfoManager.shared.isLogin ||
              marketList.length == 0) {
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 120),
              child: EmptyWidget(),
            );
          }
          return Padding(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: ListView.builder(
              itemCount: marketList.length,
              itemBuilder: (context, index) {
                final model = marketList[index];
                marketCubit.requestHistory(model);
                return SymbolMarket2Cell(
                  size: Size(screenSize.width - 30, 54),
                  model: model,
                  onTap: () {
                    pushToKlineView(model);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }

  onEditTap() {
    Navigator.push(
      context,
      ModalBottomSheetRoute(
        builder: (context) {
          return FavoriteEditView(
            cubit: marketCubit,
          );
        },
        isScrollControlled: false,
      ),
    );
  }

  pushToKlineView(SymbolMarketCellModel model) {
    final symboldId = model.symbol;
    final configModel = context.read<BasicConfigCubit>().state.configModel;
    final symbols = configModel?.symbol ?? [];
    final symbolModel =
        symbols.firstWhere((element) => element.symbolId == symboldId);
    final params = KlineViewParams(
      exchangeId: symbolModel.exchangeId ?? "",
      symbolId: symbolModel.symbolId ?? "",
      baseTokenId: symbolModel.baseTokenId ?? "",
      quoteTokenId: symbolModel.quoteTokenId ?? "",
      realtimeInterval: configModel?.realtimeInterval ?? "15m",
    );
    Navigator.push(context, KlineView.route(params));
  }

  setupCubit() async {
    showLoading(duration: Duration(seconds: 666));
    try {
      final repo = GetIt.I.get<UserRepository>();
      final resp = await repo.favoriteList();
      final bcState = context.read<BasicConfigCubit>().state;
      final data = resp.data;
      final allSymbols = bcState.configModel?.symbol ?? [];
      final starSymbols = data.map((e) {
        final sb =
            allSymbols.firstWhere((element) => element.symbolId == e.symbolId);
        return sb;
      }).toList();
      final recommendSymbols =
          (bcState.configModel?.symbol ?? []).sublist(0, 100);
      marketCubit.setup(starSymbols, recommendSymbols);
    } catch (e) {
      print(e.toString());
      final bcState = context.read<BasicConfigCubit>().state;
      final recommendSymbols =
          (bcState.configModel?.symbol ?? []).sublist(0, 100);
      marketCubit.setup([], recommendSymbols);
    } finally {
      dismissAllToast();
    }
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
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
    setupCubit();
    super.didPush();
  }

  @override
  void didPopNext() {
    setupCubit();
    super.didPopNext();
  }

  @override
  void didPushNext() {
    marketCubit.cancelSubscriptions();
    super.didPushNext();
  }

  @override
  void didPop() {
    marketCubit.cancelSubscriptions();
    super.didPop();
  }
}
