import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyRateView extends StatefulWidget {
  const MyRateView({super.key});

  static Route route() => MaterialPageRoute(
        builder: (context) => const MyRateView(),
      );

  @override
  State<MyRateView> createState() => _MyRateViewState();
}

class _MyRateViewState extends State<MyRateView>
    with SingleTickerProviderStateMixin {
  late AppTheme appTheme;
  late TabController tabController = TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "我的费率",
          style: appTheme.colorSet.textBlack.style(fontSize: 18),
        ),
        iconTheme: IconThemeData(
          color: appTheme.colorSet.textBlack,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _buildRateHeader(),
          ),
          SliverToBoxAdapter(
            child: _buildTabBar(),
          ),
          SliverToBoxAdapter(
            child: _buildTabList(),
          ),
        ],
      ),
    );
  }

  Widget _buildRateHeader() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      height: 148,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: appTheme.colorSet.colorLight,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 26,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: appTheme.colorSet.colorAuxiliary1,
            ),
            alignment: Alignment.center,
            child: Text(
              "近30天交易量(截止到昨天)",
              style: appTheme.colorSet.textBlack.style(fontSize: 12),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 大图标
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      R.ASSETS_IMAGES_GROUP_41411_PNG,
                      width: 44,
                      height: 44,
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Lv.0",
                      style: appTheme.colorSet.textBlack.style(fontSize: 16),
                    ),
                  ],
                ),
                // 币币交易
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "币币交易",
                      style: appTheme.colorSet.textGrey.style(fontSize: 12),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "0 BTC",
                      style: appTheme.colorSet.textBlack.style(fontSize: 16),
                    ),
                  ],
                ),
                // 永续合约
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "永续合约",
                      style: appTheme.colorSet.textGrey.style(fontSize: 12),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "0 BTC",
                      style: appTheme.colorSet.textBlack.style(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: TabBar(
        controller: tabController,
        indicatorColor: appTheme.colorSet.colorAuxiliary1,
        indicatorPadding: EdgeInsets.only(bottom: -4),
        indicatorSize: TabBarIndicatorSize.label,
        tabs: [
          Text(
            "币币交易",
            style: appTheme.colorSet.colorAuxiliary1.style(fontSize: 14),
          ),
          Text(
            "永续合约",
            style: appTheme.colorSet.colorAuxiliary1.style(fontSize: 14),
          ),
          Text(
            "杠杆借贷",
            style: appTheme.colorSet.colorAuxiliary1.style(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildTabList() {
    Widget wgt = ListView(
      shrinkWrap: true,
      children: [
        _buildListCell(
          Text(
            "等级名称",
            style: appTheme.colorSet.colorGrey.style(fontSize: 14),
          ),
          Text(
            "V0",
            style: appTheme.colorSet.textBlack.style(fontSize: 14),
          ),
          BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        _buildListCell(
          Text(
            "满足条件",
            style: appTheme.colorSet.colorGrey.style(fontSize: 14),
          ),
          RichText(
            text: TextSpan(
              text: "持币量200\n",
              style: appTheme.colorSet.textBlack.style(fontSize: 14),
              children: [
                TextSpan(text: "30日交易额5000"),
              ],
            ),
          ),
        ),
        _buildListCell(
          Text(
            "满足条件",
            style: appTheme.colorSet.colorGrey.style(fontSize: 14),
          ),
          RichText(
            text: TextSpan(
              text: "持币量200\n",
              style: appTheme.colorSet.textBlack.style(fontSize: 14),
              children: [
                TextSpan(text: "30日交易额5000"),
              ],
            ),
          ),
        ),
        _buildListCell(
          Text(
            "币币折扣",
            style: appTheme.colorSet.colorGrey.style(fontSize: 14),
          ),
          RichText(
            text: TextSpan(
              text: "持币量200\n",
              style: appTheme.colorSet.textBlack.style(fontSize: 14),
              children: [
                TextSpan(text: "30日交易额5000"),
              ],
            ),
          ),
        ),
        _buildListCell(
          Text(
            "邀请返佣",
            style: appTheme.colorSet.colorGrey.style(fontSize: 14),
          ),
          RichText(
            text: TextSpan(
              text: "持币量200\n",
              style: appTheme.colorSet.textBlack.style(fontSize: 14),
              children: [
                TextSpan(text: "30日交易额5000"),
              ],
            ),
          ),
          BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ],
    );
    wgt = Container(
      margin: EdgeInsets.all(16),
      child: wgt,
    );
    return wgt;
  }

  Widget _buildListCell(Widget left, Widget right, [BorderRadius? radius]) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: appTheme.colorSet.colorLight),
        borderRadius: radius,
      ),
      // padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: appTheme.colorSet.colorLight),
                ),
              ),
              child: left,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: right,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    appTheme = context.read<AppconfCubit>().state.appTheme;
    super.didChangeDependencies();
  }
}
