import 'package:ceex_flutter/components/empty_widget.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/order_list/order_list_cubit.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderListView extends StatefulWidget {
  final String tokenId;
  const OrderListView({required this.tokenId, super.key});

  static Route route(String tokenId) => MaterialPageRoute(
        builder: (context) => OrderListView(tokenId: tokenId),
      );

  @override
  State<OrderListView> createState() => _OrderListViewState();
}

class _OrderListViewState extends State<OrderListView>
    with SingleTickerProviderStateMixin {
  late OrderListCubit cubit = OrderListCubit(tokenId: widget.tokenId);
  late AppTheme appTheme;
  late TabController _tabController = TabController(length: 3, vsync: this);

  late EasyRefreshController _withdrawController = EasyRefreshController();
  late EasyRefreshController _depositController = EasyRefreshController();
  late EasyRefreshController _otherController = EasyRefreshController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 17)).then((value) {
      _depositController.callRefresh();
      _withdrawController.callRefresh();
      _otherController.callRefresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: appTheme.colorSet.textBlack,
        ),
        title: Text(
          "${widget.tokenId} 历史记录",
          style: appTheme.colorSet.textBlack.style(fontSize: 18),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12,
          ),
          SizedBox(
            width: 210,
            child: TabBar(
              onTap: onTabTap,
              tabs: tabs(),
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: appTheme.colorSet.textBlack,
              labelPadding: EdgeInsets.only(bottom: 6),
            ),
          ),
          Expanded(
            child: BlocBuilder<OrderListCubit, OrderListState>(
              bloc: cubit,
              builder: (context, state) {
                return TabBarView(
                  controller: _tabController,
                  children: [
                    _buildDepositList(state),
                    _buildWithdrawList(state),
                    _buildOtherList(state),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> tabs() {
    return [
      Text(
        "充币",
        style: appTheme.colorSet.textBlack.style(fontSize: 16),
      ),
      Text(
        "提币",
        style: appTheme.colorSet.textBlack.style(fontSize: 16),
      ),
      Text(
        "其他",
        style: appTheme.colorSet.textBlack.style(fontSize: 16),
      ),
    ];
  }

  Widget _buildWithdrawList(OrderListState state) {
    final withdrawList = state.withdrawList ?? [];
    return EasyRefresh(
      controller: _withdrawController,
      onRefresh: cubit.refresh,
      onLoad: cubit.loadMore,
      child: withdrawList.isEmpty
          ? ListView(children: [_buildEmpty()])
          : ListView.builder(
              itemCount: withdrawList.length,
              itemBuilder: (context, index) {
                final item = withdrawList[index];
                return OrderListCell(
                  tokenId: item.tokenId,
                  time: item.time,
                  quantity: item.quantity,
                  statusCode: item.statusCode,
                  statusDesc: item.statusDesc,
                );
              },
            ),
    );
  }

  Widget _buildDepositList(OrderListState state) {
    final depositList = state.depositList ?? [];
    return EasyRefresh(
      controller: _depositController,
      onRefresh: cubit.refresh,
      onLoad: cubit.loadMore,
      child: depositList.isEmpty
          ? ListView(
              children: [_buildEmpty()],
            )
          : ListView.builder(
              itemCount: depositList.length,
              itemBuilder: (context, index) {
                final item = depositList[index];
                return OrderListCell(
                  tokenId: item.tokenId,
                  time: item.time,
                  quantity: item.quantity,
                  statusCode: item.statusCode,
                  statusDesc: item.statusDesc,
                );
              },
            ),
    );
  }

  Widget _buildOtherList(OrderListState state) {
    final otherList = state.otherList ?? [];
    return EasyRefresh(
      controller: _otherController,
      onRefresh: cubit.refresh,
      onLoad: cubit.loadMore,
      child: otherList.isEmpty
          ? ListView(children: [_buildEmpty()])
          : ListView.builder(
              itemCount: otherList.length,
              itemBuilder: (context, index) {
                final item = otherList[index];
                return OrderListCell(
                  tokenId: item.tokenId,
                  time: "--",
                  quantity: "0",
                  // statusCode: item.statusCode,
                  // statusDesc: item.statusDesc,
                );
              },
            ),
    );
  }

  Widget _buildEmpty() {
    return Container(
      padding: EdgeInsets.only(top: 120),
      alignment: Alignment.center,
      child: EmptyWidget(
        onTap: () {
          _depositController.callRefresh();
        },
      ),
    );
  }

  void onTabTap(int index) {
    cubit.selectTab(OrderListViewType.values[index]);
  }

  @override
  void didChangeDependencies() {
    appTheme = context.read<AppconfCubit>().state.appTheme;
    super.didChangeDependencies();
  }
}

class OrderListCell extends StatelessWidget {
  final String? statusCode;
  final String? statusDesc;
  final String? tokenId;
  final String? time;
  final String? quantity;
  const OrderListCell({
    this.tokenId,
    this.time,
    this.quantity,
    this.statusCode,
    this.statusDesc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.read<AppconfCubit>().state.appTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      height: 70,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color:
                context.read<AppconfCubit>().state.appTheme.colorSet.colorLight,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                tokenId ?? "--",
                style: appTheme.colorSet.textBlack.style(),
              ),
              Spacer(),
              Text(
                quantity ?? "0",
                style: appTheme.colorSet.textBlack.style(fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Text(
                time ?? "",
                style: appTheme.colorSet.textGrey.style(fontSize: 12),
              ),
              Spacer(),
              Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: appTheme.colorSet.colorPrimary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                statusDesc ?? "",
                style: appTheme.colorSet.textGrey.style(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
