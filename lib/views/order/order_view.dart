import 'package:ceex_flutter/components/app_bar_center_text.dart';
import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/order/order_cubit.dart';
import 'package:ceex_flutter/views/order/order_child.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  static Route route() =>
      MaterialPageRoute(builder: (context) => const OrderView());

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AppTheme appTheme;
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    appTheme = context.watch<AppconfCubit>().state.appTheme;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return Scaffold(
      appBar: AppBarWrapper(
        statusBarColor: appTheme.colorSet.colorWhite,
        child: const AppBarCenterText(
          title: "币币订单",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [tabbar(), Expanded(child: tabbarView())],
      ),
    );
  }

  Widget tabbar() {
    return TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        labelPadding: const EdgeInsets.only(right: 32, bottom: 10),
        indicatorColor: appTheme.colorSet.colorDark,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor:
            context.read<AppconfCubit>().state.appTheme.colorSet.textBlack,
        unselectedLabelColor:
            context.read<AppconfCubit>().state.appTheme.colorSet.textGrey,
        controller: _tabController,
        padding: EdgeInsets.only(left: 15),
        unselectedLabelStyle: appTheme.colorSet.textBlack.style(fontSize: 16, fontWeight: FontWeight.w600),
        labelStyle: appTheme.colorSet.textGrey2.style(fontSize: 16, fontWeight: FontWeight.w600),
        tabs: [
          Text("当前委托"),
          Text("历史委托"),
          Text("历史成交"),
        ]);
  }

  Widget tabbarView() {
    return TabBarView(
      controller: _tabController,
      children: [
          OrderChild(orderType: OrderType.now,),
          OrderChild(orderType: OrderType.history,),
          OrderChild(orderType: OrderType.transaction,),
      ],
    );
  }
}
