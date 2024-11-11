import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/assets/assets_cubit.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';
import 'package:ceex_flutter/views/assets/assets_widget/assets_contract_widget.dart';
import 'package:ceex_flutter/views/assets/assets_widget/assets_lever_widget.dart';
import 'package:ceex_flutter/views/assets/assets_widget/assets_manage_money_widget.dart';
import 'package:ceex_flutter/views/assets/assets_widget/assets_pandect_widget.dart';
import 'package:ceex_flutter/views/assets/assets_widget/assets_spot_goods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetsView extends StatefulWidget {
  const AssetsView({super.key});

  static Route route(RouteSettings routeSettings) =>
      MaterialPageRoute(builder: (context) => const AssetsView());

  @override
  State<AssetsView> createState() => _AssetsViewState();
}

class _AssetsViewState extends State<AssetsView> with TickerProviderStateMixin {
  late TabController _tabController;
  late AppTheme appTheme;
  final cubit = AssetsCubit();

  @override
  void initState() {
    super.initState();
    cubit.getRates();
    _tabController = TabController(vsync: this, length: 5);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appTheme = context.watch<AppconfCubit>().state.appTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWrapper(
          height: kToolbarHeight + 16,
          statusBarColor: appTheme.colorSet.colorWhite,
          child: tab(),
        ),
        body: BlocBuilder<AssetsCubit, AssetsState>(
            bloc: cubit,
            builder: (context, state) {
              return TabBarView(
                controller: _tabController,
                children: [
                  AssetsPandectWidget(
                    cubit: cubit,
                  ),
                  AssetsSpotGoodsWidget(
                    cubit: cubit,
                  ),
                  AssetsContractWidget(
                    cubit: cubit,
                  ),
                  AssetsLeverWidget(
                    cubit: cubit,
                  ),
                  AssetsManageMoneyWidget(
                    cubit: cubit,
                  ),
                ],
              );
            }));
  }

  Widget tab() {
    return TabBar(
        isScrollable: true,
        indicator: const BoxDecoration(),
        tabAlignment: TabAlignment.start,
        labelPadding: const EdgeInsets.only(right: 32, bottom: 10),
        labelColor:
            context.read<AppconfCubit>().state.appTheme.colorSet.textBlack,
        unselectedLabelColor:
            context.read<AppconfCubit>().state.appTheme.colorSet.textGrey,
        controller: _tabController,
        padding: const EdgeInsets.only(left: 15),
        unselectedLabelStyle: appTheme.colorSet.textBlack
            .style(fontSize: 16, fontWeight: FontWeight.w600),
        labelStyle: appTheme.colorSet.textGrey2
            .style(fontSize: 16, fontWeight: FontWeight.w600),
        tabs: [
          Text(AppLocalizations.of(context)!.overview),
          Text(AppLocalizations.of(context)!.wallet),
          Text("合约"),
          Text("杠杆"),
          Text("财富"),
        ]);
  }
}
