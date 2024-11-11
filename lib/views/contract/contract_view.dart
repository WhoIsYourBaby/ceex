import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/contract/contract_state.dart';
import 'package:ceex_flutter/views/contract/contract_view_bb_view.dart';
import 'package:flutter/material.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContractView extends StatefulWidget {
  final BbChooseType viewType; // 外部页面指定买入卖出
  final String? symbolId; // 外部页面symbolId
  const ContractView(
      {this.viewType = BbChooseType.buy, this.symbolId, super.key});

  static Route route(
          {BbChooseType viewType = BbChooseType.buy,
          required String? symbolId}) =>
      MaterialPageRoute(
          builder: (context) => ContractView(
                viewType: viewType,
                symbolId: symbolId,
              ));

  @override
  State<ContractView> createState() => _ContractViewState();
}

class _ContractViewState extends State<ContractView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<Widget> tabView = [];
  @override
  void initState() {
    super.initState();
    tabView.add(ContractViewBbiew(
      contractViewType: widget.viewType,
      symbolId: widget.symbolId ?? "",
    ));
    // if (widget.klineViewParams != null) {

    // }else{
    //   tabView.add(ContractViewBbiew(
    //     contractViewType: widget.viewType, symbolId: '',
    //   ));
    // }
    _tabController = TabController(vsync: this, length: tabView.length);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return Scaffold(
        body: SafeArea(
            top: true,
            bottom: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 19,
                ),
                TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    labelPadding: const EdgeInsets.only(right: 32, bottom: 0),
                    indicator: const BoxDecoration(),
                    labelColor: appTheme.colorSet.textBlack,
                    unselectedLabelColor: appTheme.colorSet.textGrey,
                    controller: _tabController,
                    padding: const EdgeInsets.only(left: 15),
                    unselectedLabelStyle: appTheme.colorSet.textBlack
                        .style(fontSize: 16, fontWeight: FontWeight.w600),
                    labelStyle: appTheme.colorSet.textGrey2
                        .style(fontSize: 16, fontWeight: FontWeight.w600),
                    tabs: [
                      Text(AppLocalizations.of(context)!.contractViewBB),
                      // Text(AppLocalizations.of(context)!.contractViewLT)
                      // InkWell(child:  Text(AppLocalizations.of(context)!.loginSignViewEmail), onTap: () {},),
                      // InkWell(child:  Text(AppLocalizations.of(context)!.loginSignViewPhone), onTap: () {},),
                    ]),
                const SizedBox(
                  height: 9,
                ),
                Container(
                  height: 1,
                  color: appTheme.colorSet.colorLight,
                ),
                Expanded(
                    child: TabBarView(
                  controller: _tabController,
                  children: tabView,
                ))
              ],
            )));
  }
}
