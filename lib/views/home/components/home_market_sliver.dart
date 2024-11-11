import 'package:ceex_flutter/components/empty_widget.dart';
import 'package:ceex_flutter/components/symbol_market2_cell.dart';
import 'package:ceex_flutter/components/symbol_market_cell.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/basic/basic_config_cubit.dart';
import 'package:ceex_flutter/cubit/home/home_market_cubit.dart';
import 'package:ceex_flutter/model/model.dart';
import 'package:ceex_flutter/repository/repository.dart';
import 'package:ceex_flutter/utils/enums.dart';
import 'package:ceex_flutter/views/kline/kline_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';
import 'package:get_it/get_it.dart';

class HomeMarketSliver extends StatefulWidget {
  const HomeMarketSliver({super.key});

  @override
  State<HomeMarketSliver> createState() => _HomeMarketSliverState();
}

class _HomeMarketSliverState extends State<HomeMarketSliver> {
  late AppTheme appTheme;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeMarketCubit, HomeMarketState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            children: [
              // 顶部切换
              Row(
                children: [
                  TabLabel(
                    size: Size(32, 32),
                    borderColor: appTheme.colorSet.textGrey2,
                    onTap: () {
                      onTypeChanged(HomeTabType.star);
                    },
                    child: Image.asset(state.type == HomeTabType.star
                        ? R.ASSETS_IMAGES_STAR_SELECTED_PNG
                        : R.ASSETS_IMAGES_STAR_DEFAULT_PNG),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TabLabel(
                    size: Size(74, 32),
                    borderColor: state.type == HomeTabType.hot
                        ? appTheme.colorSet.textBlack
                        : appTheme.colorSet.textGrey2,
                    onTap: () {
                      onTypeChanged(HomeTabType.hot);
                    },
                    child: Text(
                      "热门榜",
                      style: state.type == HomeTabType.hot
                          ? appTheme.colorSet.textBlack.style()
                          : appTheme.colorSet.textGrey2.style(),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TabLabel(
                    size: Size(74, 32),
                    borderColor: state.type == HomeTabType.top
                        ? appTheme.colorSet.textBlack
                        : appTheme.colorSet.textGrey2,
                    onTap: () {
                      onTypeChanged(HomeTabType.top);
                    },
                    child: Text(
                      "涨幅榜",
                      style: state.type == HomeTabType.top
                          ? appTheme.colorSet.textBlack.style()
                          : appTheme.colorSet.textGrey2.style(),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TabLabel(
                    size: Size(74, 32),
                    borderColor: state.type == HomeTabType.newc
                        ? appTheme.colorSet.textBlack
                        : appTheme.colorSet.textGrey2,
                    onTap: () {
                      onTypeChanged(HomeTabType.newc);
                    },
                    child: Text(
                      "新币榜",
                      style: state.type == HomeTabType.newc
                          ? appTheme.colorSet.textBlack.style()
                          : appTheme.colorSet.textGrey2.style(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              _buildMarketList(context, state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMarketList(BuildContext context, HomeMarketState state) {
    final screenSize = MediaQuery.of(context).size;
    final flexValues = [5, 4, 3];
    final klineList = state.currentCellList();
    if (klineList?.isEmpty ?? true) {
      return Container(
        padding: EdgeInsets.all(40),
        alignment: Alignment.center,
        child: EmptyWidget(),
      );
    }
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: flexValues[0],
              child: Text(
                AppLocalizations.of(context)!.homeTabName,
                style: appTheme.colorSet.textGrey.style(fontSize: 12),
              ),
            ),
            Expanded(
              flex: flexValues[1],
              child: Text(
                AppLocalizations.of(context)!.homeTabNewPrice,
                style: appTheme.colorSet.textGrey.style(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: flexValues[2],
              child: Text(
                AppLocalizations.of(context)!.homeTab24H,
                style: appTheme.colorSet.textGrey.style(fontSize: 12),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        ...(klineList ?? []).map(
          (e) {
            context.read<HomeMarketCubit>().requestHistory(e);
            return SymbolMarket2Cell(
              size: Size(screenSize.width - 30, 54),
              model: e,
              flexValues: flexValues,
              onTap: () {
                if (e.klineModel != null) {
                  pushToKlineView(e.klineModel!);
                }
              },
            );
          },
        ).toList(),
      ],
    );
  }

  pushToKlineView(KlineModel model) {
    final symbolId = model.s;
    final configModel = context.read<BasicConfigCubit>().state.configModel;
    final symbols = configModel?.symbol ?? [];
    final symbolModel =
        symbols.firstWhere((element) => element.symbolId == symbolId);
    final params = KlineViewParams(
      symbolId: symbolModel.symbolId ?? "",
      exchangeId: symbolModel.exchangeId ?? "",
      baseTokenId: symbolModel.baseTokenId ?? "",
      quoteTokenId: symbolModel.quoteTokenId ?? "",
      realtimeInterval: configModel?.realtimeInterval ?? "15m",
    );
    Navigator.push(context, KlineView.route(params));
  }

  onTypeChanged(HomeTabType type) {
    final cubit = context.read<HomeMarketCubit>();
    cubit.changeType(type);
    cubit.subscribe();
  }

  @override
  void didChangeDependencies() {
    appTheme = context.read<AppconfCubit>().state.appTheme;
    super.didChangeDependencies();
  }
}

class TabLabel extends StatelessWidget {
  final Size size;
  final Color borderColor;
  final VoidCallback onTap;
  final Widget child;
  const TabLabel({
    required this.size,
    required this.borderColor,
    required this.onTap,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.height / 2),
          border: Border.all(color: borderColor, width: 1.0),
        ),
        child: child,
      ),
    );
  }
}
