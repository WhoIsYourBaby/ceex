import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/views/kline/components/kline_info_view.dart';
import 'package:ceex_flutter/views/kline/components/kline_order_view.dart';
import 'package:ceex_flutter/views/kline/components/kline_traded_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KlineTabListView extends StatefulWidget {
  const KlineTabListView({super.key});

  @override
  State<KlineTabListView> createState() => _KlineTabListViewState();
}

class _KlineTabListViewState extends State<KlineTabListView>
    with SingleTickerProviderStateMixin {
  late AppTheme appTheme;
  late TabController tabController = TabController(
    initialIndex: 0,
    length: 3,
    vsync: this,
  );
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 180,
          child: TabBar(
            controller: tabController,
            tabs: [
              _wrapTabText(
                Text(
                  "订单",
                  style: tabController.index == 0
                      ? appTheme.colorSet.textBlack.style()
                      : appTheme.colorSet.textGrey.style(),
                ),
              ),
              _wrapTabText(
                Text(
                  "成交",
                  style: tabController.index == 1
                      ? appTheme.colorSet.textBlack.style()
                      : appTheme.colorSet.textGrey.style(),
                ),
              ),
              _wrapTabText(
                Text(
                  "简介",
                  style: tabController.index == 2
                      ? appTheme.colorSet.textBlack.style()
                      : appTheme.colorSet.textGrey.style(),
                ),
              ),
            ],
            indicatorColor: Colors.transparent,
            onTap: (value) {
              setState(() {
                tabController.animateTo(value);
                setState(() {
                  tabIndex = value;
                });
              });
            },
          ),
        ),
        if (tabIndex == 0) KlineOrderView(),
        if (tabIndex == 1) KlineTradedView(),
        if (tabIndex == 2) KlineInfoView(),
      ],
    );
  }

  Widget _wrapTabText(Widget widget) {
    return Container(
      width: 60,
      height: 36,
      alignment: Alignment.center,
      child: widget,
    );
  }

  @override
  void didChangeDependencies() {
    appTheme = context.read<AppconfCubit>().state.appTheme;
    super.didChangeDependencies();
  }
}
