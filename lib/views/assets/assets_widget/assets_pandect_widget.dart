import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/assets/assets_cubit.dart';
import 'package:ceex_flutter/cubit/search_tokens/search_tokens_cubit.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';
import 'package:ceex_flutter/utils/number_utils.dart';
import 'package:ceex_flutter/utils/piechat/e_chart_bean.dart';
import 'package:ceex_flutter/utils/piechat/pie_chart.dart';
import 'package:ceex_flutter/utils/piechat/pie_enum.dart';
import 'package:ceex_flutter/views/assets/components/assets_dialog.dart';
import 'package:ceex_flutter/views/assets/orderlist/order_list_view.dart';
import 'package:ceex_flutter/views/assets/transfer_view.dart';
import 'package:ceex_flutter/views/assets/withdraw/withdraw_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 资产总览
class AssetsPandectWidget extends StatefulWidget {
  final AssetsCubit cubit;
  const AssetsPandectWidget({required this.cubit, super.key});

  @override
  State<AssetsPandectWidget> createState() => _AssetsPandectWidgetState();
}

class _AssetsPandectWidgetState extends State<AssetsPandectWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late AppTheme appTheme;
  late AssetsCubit cubit;

  List<EChartPieBean> _dataList1 = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appTheme = context.watch<AppconfCubit>().state.appTheme;
    cubit = widget.cubit;
    // cubit.getSubAccountQuery(appTheme);
    _dataList1 = [
      EChartPieBean(
          title: AppLocalizations.of(context)!.other,
          number: 100,
          color: appTheme.colorSet.colorLight),
    ];
    cubit.initEChartList(appTheme);
    cubit.getAssets();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
          child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          Text(
            "${AppLocalizations.of(context)!.totalAssetValuation}(${cubit.state.totalType == TotalType.btcValue ? "BTC" : "USDT"})",
            style: appTheme.colorSet.textBlack
                .style(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            width: 7,
          ),
          GestureDetector(
              onTap: () => cubit.changeShowAssets(),
              child: Image.asset(cubit.state.showAssets ?? false
                  ? R.ASSETS_IMAGES_EYE_OPEN_LINE_PNG
                  : R.ASSETS_IMAGES_EYE_CLOSE_LINE_PNG))
        ],
      )),
      const SliverToBoxAdapter(
        child: SizedBox(
          height: 8,
        ),
      ),
      SliverToBoxAdapter(
          child: GestureDetector(
              onTap: () => cubit.changeAssetstype(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    cubit.state.showAssets ?? false
                        ? "${cubit.state.totalType == TotalType.btcValue ? cubit.state.btcValue : cubit.state.usdtValue}"
                        : "******",
                    style: appTheme.colorSet.textBlack
                        .style(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Text(
                        cubit.state.totalType == TotalType.btcValue
                            ? "BTC"
                            : "USDT",
                        style: appTheme.colorSet.textBlack
                            .style(fontSize: 12, fontWeight: FontWeight.w600),
                      )),
                  // Image.asset(R.ASSETS_IMAGES_DOWN_SMALL_LINE_PNG)
                ],
              ))),
      const SliverToBoxAdapter(
        child: SizedBox(
          height: 8,
        ),
      ),
      SliverToBoxAdapter(
          child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          Text(
            cubit.state.showAssets ?? false
                ? ("≈¥ ${NumberUtils.mulString((cubit.state.rates ?? 0).toString(), (cubit.state.usdtValue ?? 0).toString())}")
                : "***",
            style: appTheme.colorSet.textBlack
                .style(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      )),
      SliverToBoxAdapter(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: foreRow(context)),
      )),
      SliverToBoxAdapter(
          child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 32),
              child: Text(
                AppLocalizations.of(context)!.assetDistribution,
                style: appTheme.colorSet.textBlack.style(fontSize: 18),
              ))),
      const SliverToBoxAdapter(
        child: SizedBox(
          height: 32,
        ),
      ),
      SliverToBoxAdapter(
        child: Container(
            child: Row(
          children: [
            const SizedBox(
              width: 40,
            ),
            Container(
                color: Colors.amber,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    buildPieChatView(),
                    Container(
                      width: 90,
                      height: 89,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
                    )
                  ],
                )),
            const Spacer(),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: appTheme.colorSet.colorPrimary,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      AppLocalizations.of(context)!.wallet,
                      style: appTheme.colorSet.textGrey.style(fontSize: 12),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: appTheme.colorSet.colorAuxiliary1,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      AppLocalizations.of(context)!.contract,
                      style: appTheme.colorSet.textGrey.style(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: appTheme.colorSet.colorPrimary1,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      "杠杆",
                      style: appTheme.colorSet.textGrey.style(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: appTheme.colorSet.colorPrimary3,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      "财富",
                      style: appTheme.colorSet.textGrey.style(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 43,
            ),
          ],
        )),
      ),
      const SliverToBoxAdapter(
        child: SizedBox(
          height: 32,
        ),
      ),
      SliverToBoxAdapter(
          child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cubit.state.eChartList?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Text(
                              cubit.state.eChartList?[index] == null
                                  ? "--"
                                  : "${cubit.state.eChartList?[index].title}账户",
                              style: appTheme.colorSet.textBlack.style(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            const Spacer(),
                            Text(
                              "${(((cubit.state.eChartList?[index].number ?? 0.00) / getPer() * 100).round().toInt())}%",
                              style: appTheme.colorSet.textBlack
                                  .style(fontSize: 16),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Image.asset(R.ASSETS_IMAGES_RIGHT_SMALL_LINE_PNG)
                          ],
                        ));
                  }))),
      const SliverToBoxAdapter(
        child: SizedBox(
          height: 32,
        ),
      ),
      // SliverToBoxAdapter(
      //     child: Padding(
      //         padding: const EdgeInsets.only(left: 15),
      //         child: GestureDetector(
      //             onTap: () {
      //               // cubit.getAssetsPandectList();
      //             },
      //             child: Text(
      //               AppLocalizations.of(context)!.assetDynamics,
      //               style: appTheme.colorSet.textBlack
      //                   .style(fontSize: 18, fontWeight: FontWeight.w600),
      //             )))),
    ]);
  }

  List<Widget> foreRow(BuildContext buildContext) {
    return [
      foreItem(
          image: Image.asset(R.ASSETS_IMAGES_GROUP_44_PNG),
          title: AppLocalizations.of(context)!.recharge,
          onTap: () {
            rechargeDialog(
                context: buildContext,
                appTheme: appTheme,
                showCanTranTokensType: ShowCanTranTokensType.recharge);
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => PieChart()));
          }),
      foreItem(
          image: Image.asset(R.ASSETS_IMAGES_GROUP_48_PNG),
          title: AppLocalizations.of(context)!.withdrawal,
          onTap: () {
            Navigator.push(context, WithdrawView.route());
          }),
      foreItem(
          image: Image.asset(R.ASSETS_IMAGES_GROUP_43_PNG),
          title: AppLocalizations.of(context)!.transfer,
          onTap: () {
            Navigator.push(context, TransferView.route());
          }),
      foreItem(
          image: Image.asset(R.ASSETS_IMAGES_GROUP_47_PNG),
          title: AppLocalizations.of(context)!.bill,
          onTap: () {
            Navigator.push(context, OrderListView.route("USDT"));
          }),
    ];
  }

  // 计算百分比
  double getPer() {
    // String total = "0";
    // (cubit.state.eChartList ?? []) .forEach((element) {
    //      total = NumberUtils.addString(total, num.toString());
    //   });
    double total = 0.0;
    (cubit.state.eChartList ?? []).forEach((element) {
      total += element.number;
    });

    return total;
  }

  Widget foreItem({
    required Image image,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            child: image,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            title,
            style: appTheme.colorSet.textBlack.style(fontSize: 12),
          ),
        ],
      ),
    );
  }

  PieChatView buildPieChatView() {
    return PieChatView(
      width: 200,
      height: 200,
      dataList: cubit.state.eChartList ?? _dataList1,
      //是否输出日志
      isLog: false,
      //是否需要背景
      isBackground: false,
      //是否画直线
      isLineText: true,
      //背景
      bgColor: Colors.white,
      //是否显示最前面的内容
      isFrontgText: false,
      //默认选择放大的块
      initSelect: 4,
      //初次显示以动画方式展开
      openType: OpenType.ANI,
      //旋转类型
      loopType: LoopType.NON,
      //点击回调
      clickCallBack: (int value) {
        // print("当前点击显示 $value");
      },
    );
  }
}
