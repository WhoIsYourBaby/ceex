import 'package:ceex_flutter/components/empty_widget.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/basic/basic_config_cubit.dart';
import 'package:ceex_flutter/cubit/contract/contract_state.dart';
import 'package:ceex_flutter/cubit/contract/contract_view_cubit.dart';
import 'package:ceex_flutter/cubit/search_tokens/search_tokens_cubit.dart';
import 'package:ceex_flutter/model/appconfig/symbol_model.dart';
import 'package:ceex_flutter/views/assets/components/assets_dialog.dart';
import 'package:ceex_flutter/views/assets/transfer_view.dart';
import 'package:ceex_flutter/views/contract/assets_view_item.dart';
import 'package:ceex_flutter/views/contract/bb_entrust_view.dart';
import 'package:ceex_flutter/views/contract/bb_history_entrust_view.dart';
import 'package:ceex_flutter/views/contract/contract_left_view.dart';
import 'package:ceex_flutter/views/contract/contract_right_widget.dart';
import 'package:ceex_flutter/views/contract/symbol_contract_view.dart';
import 'package:ceex_flutter/views/kline/kline_view.dart';
import 'package:ceex_flutter/views/order/order_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 币币
class ContractViewBbiew extends StatefulWidget {
  final KlineViewParams? klineViewParams;
  final BbChooseType contractViewType;
  final String symbolId;
  const ContractViewBbiew(
      {this.klineViewParams,
      required this.contractViewType,
      required this.symbolId,
      super.key});

  @override
  State<ContractViewBbiew> createState() => _ContractViewBbiewState();
}

class _ContractViewBbiewState extends State<ContractViewBbiew>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final cubit = ContractViewCubit();
  late AppTheme appTheme;
  late BuildContext buildContext;

  late TabController _tabController;

  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    buildContext = context;
    cubit.initView(
      context.read<BasicConfigCubit>().state.configModel?.symbol ?? [],
      widget.symbolId,
      contractViewType: widget.contractViewType,
      tokenModel:
          context.read<BasicConfigCubit>().state.configModel?.token ?? [],
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    appTheme = context.watch<AppconfCubit>().state.appTheme;
    return BlocConsumer<ContractViewCubit, ContractViewState>(
      bloc: cubit,
      builder: (ctx, state) {
        return CustomScrollView(
          shrinkWrap: true,
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 22)),
            SliverToBoxAdapter(
              child: bbType(),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: bottomConn(state),
            )),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 33,
            )),
            SliverToBoxAdapter(
                child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      children: [
                        Expanded(child: entrustView()),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, OrderView.route());
                          },
                          child: Image.asset(R.ASSETS_IMAGES_TASK_2_LINE_PNG),
                        )
                      ],
                    ))),
            if (tabIndex == 0) SliverToBoxAdapter(child: buildListView()),
            if (tabIndex == 1) SliverToBoxAdapter(child: buildAssetsView()),
            if (tabIndex == 2)
              SliverToBoxAdapter(child: buildListViewHistory()),
          ],
        );
      },
      listener: (BuildContext context, ContractViewState state) {},
    );
  }

  // 委托
  Widget buildListView() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          height: 1,
          color: appTheme.colorSet.colorLight,
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            GestureDetector(
                onTap: () {
                  if (cubit.state.isShowOnly ?? false) {
                    cubit.orderTradeOrders();
                  } else {
                    cubit.onlyShowNew();
                  }
                },
                child: Image.asset((cubit.state.isShowOnly ?? false)
                    ? R.ASSETS_IMAGES_CHECK_CIRCLE_ICON_PNG
                    : R.ASSETS_IMAGES_VECTORCIRCLE_PNG)),
            const SizedBox(
              width: 6,
            ),
            Text(
              "只看当前",
              style: appTheme.colorSet.textGrey.style(fontSize: 12),
            ),
            const Expanded(child: SizedBox()),
            GestureDetector(
                onTap: () => cancelOrderAllAlert(),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                  decoration: BoxDecoration(
                      color: appTheme.colorSet.colorLight,
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    "撤销全部",
                    style: appTheme.colorSet.colorDark.style(fontSize: 12),
                  ),
                )),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          height: 1,
          padding: const EdgeInsets.only(left: 15, right: 15),
          color: appTheme.colorSet.colorLight,
        ),
        (cubit.state.orderList ?? []).isEmpty
            ? Padding(
                padding: EdgeInsets.only(top: 20),
                child: EmptyWidget(),
              )
            : ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: (cubit.state.orderList ?? [])
                    .map((e) => BbEntrust(
                          orderModel: e,
                          cancelOrder: ((p0) => cubit.cancelOrder(p0)),
                        ))
                    .toList(),
              )
      ],
    );
  }

  // 历史委托
  Widget buildListViewHistory() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          height: 1,
          color: appTheme.colorSet.colorLight,
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            GestureDetector(
                onTap: () {
                  if (cubit.state.isShowHistoryOnly ?? false) {
                    cubit.orderHistoryTradeOrders();
                  } else {
                    cubit.onlyShowHistoryNew();
                  }
                },
                child: Image.asset((cubit.state.isShowHistoryOnly ?? false)
                    ? R.ASSETS_IMAGES_CHECK_CIRCLE_ICON_PNG
                    : R.ASSETS_IMAGES_VECTORCIRCLE_PNG)),
            const SizedBox(
              width: 6,
            ),
            Text(
              "只看当前",
              style: appTheme.colorSet.textGrey.style(fontSize: 12),
            ),
            const Expanded(child: SizedBox()),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          height: 1,
          padding: const EdgeInsets.only(left: 15, right: 15),
          color: appTheme.colorSet.colorLight,
        ),
        (cubit.state.historyOrderList ?? []).isEmpty
            ? Padding(
                padding: EdgeInsets.only(top: 20),
                child: EmptyWidget(),
              )
            : ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: (cubit.state.historyOrderList ?? [])
                    .map((e) => BbHistoryEntrust(
                          orderModel: e,
                        ))
                    .toList(),
              )
      ],
    );
  }

  cancelOrderAllAlert() async {
// cubit.orderBatchCancel();
    var result = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.spaceAround,
            title: const Text(
              '确定要撤销全部委托吗',
              textAlign: TextAlign.center,
            ),
            titleTextStyle: appTheme.colorSet.colorDark
                .style(fontSize: 16, fontWeight: FontWeight.w600),
            actions: <Widget>[
              TextButton(
                  child: Text(
                    '取消',
                    style: appTheme.colorSet.colorDark.style(
                      fontSize: 14,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context, false);
                  }),
              TextButton(
                child: Text(
                  '确定',
                  style: appTheme.colorSet.colorDark.style(
                    fontSize: 14,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        });
    if (result) {
      cubit.orderBatchCancel();
    }
  }

  // 资产
  Widget buildAssetsView() {
    return (cubit.state.assetsList ?? []).isEmpty
        ? noAssets()
        : ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: (cubit.state.assetsList ?? [])
                .map((e) => AssetsViewItem(
                      tokenName: e.tokenName ?? "",
                      iconUrl: e.iconUrl ?? "",
                      total: e.total ?? "",
                      rates: cubit.state.rates ?? 0,
                      balanceUpdatedAt: e.tokenFullName ?? "",
                      quotePrecision: e.quotePrecision,
                    ))
                .toList(),
          );
  }

  // 币币种类
  Widget bbType() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () async {
                  var result =
                      await Navigator.push(context, SymbolContractView.route());
                  if (result != null) {
                    cubit.needRefreshData(true);
                    SymbolModel symbolModel = result as SymbolModel;
                    cubit.updateSymbol(
                      symbolName:
                          "${symbolModel.baseTokenName}/${symbolModel.quoteTokenName}",
                      symbolId: "${symbolModel.symbolId}",
                      baseTokenId: "${symbolModel.baseTokenId}",
                      digitMerge: "${symbolModel.digitMerge}",
                      exchangeId: "${symbolModel.exchangeId}",
                      minPricePrecision: "${symbolModel.minPricePrecision}",
                      quotePrecision: "${symbolModel.quotePrecision}",
                      minTradeQuantity: "${symbolModel.minTradeQuantity}",
                      minTradeAmount: "${symbolModel.minTradeAmount}",
                      basePrecision: "${symbolModel.basePrecision}",
                    );
                  }
                },
                child: Row(
                  children: [
                    Text(
                      cubit.state.symbolName ?? "",
                      style: appTheme.colorSet.textBlack
                          .style(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Image.asset(R.ASSETS_IMAGES_LEFT_SMALL_FILL_PNG),
                  ],
                )),
            const SizedBox(
              height: 2,
            ),
            Text(
              cubit.state.ticker!.contains("-")
                  ? cubit.state.ticker!
                  : "+${cubit.state.ticker!}",
              style: cubit.state.ticker!.contains("-")
                  ? appTheme.colorSet.colorAuxiliary5
                      .style(fontSize: 12, fontWeight: FontWeight.w600)
                  : appTheme.colorSet.colorPrimary2
                      .style(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
            onTap: () {
              final configModel =
                  context.read<BasicConfigCubit>().state.configModel;
              final params = KlineViewParams(
                exchangeId: cubit.state.exchangeId ?? "",
                symbolId: cubit.state.symbolId ?? "",
                baseTokenId: cubit.state.baseTokenId ?? "",
                quoteTokenId: "USDT",
                realtimeInterval: configModel?.realtimeInterval ?? "15m",
              );
              Navigator.push(context, KlineView.route(params));
            },
            child: Image.asset(R.ASSETS_IMAGES_FRAME_PNG)),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
            onTap: () async {
              var result =
                  await Navigator.push(context, SymbolContractView.route());
              if (result != null) {
                SymbolModel symbolModel = result as SymbolModel;
                cubit.updateSymbol(
                  symbolName:
                      "${symbolModel.baseTokenName}/${symbolModel.quoteTokenName}",
                  symbolId: "${symbolModel.symbolId}",
                  baseTokenId: "${symbolModel.baseTokenId}",
                  digitMerge: "${symbolModel.digitMerge}",
                  exchangeId: "${symbolModel.exchangeId}",
                  minPricePrecision: "${symbolModel.minPricePrecision}",
                  quotePrecision: "${symbolModel.quotePrecision}",
                  minTradeQuantity: "${symbolModel.minTradeQuantity}",
                  minTradeAmount: "${symbolModel.minTradeAmount}",
                  basePrecision: "${symbolModel.minTradeAmount}",
                );
              }
            },
            child: Image.asset(R.ASSETS_IMAGES_MORE_1_FILL_PNG)),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }

  // 买卖 深度
  Widget bottomConn(ContractViewState state) {
    return SizedBox(
        height: 404,
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
                flex: 216,
                child: ContractLeftView(
                  cubit,
                  state,
                )),
            const SizedBox(
              width: 12,
            ),
            Expanded(
                flex: 129,
                child: ContrachRightView(
                  contractCubit: cubit,
                ))
          ],
        ));
  }

  // tab
  Widget entrustView() {
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
        unselectedLabelStyle: appTheme.colorSet.textBlack
            .style(fontSize: 16, fontWeight: FontWeight.w600),
        labelStyle: appTheme.colorSet.textGrey2
            .style(fontSize: 16, fontWeight: FontWeight.w600),
        controller: _tabController,
        onTap: (value) {
          setState(() {
            tabIndex = value;
          });
        },
        tabs: const [
          Text("当前委托"),
          Text("资产"),
          Text("历史"),
        ]);
  }

  // 此账户暂无资产
  Widget noAssets() {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 16,
          ),
          Text(
            "您在此账户没有资产",
            style: appTheme.colorSet.textBlack.style(fontSize: 15),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "充值或划转加密货币",
            style: appTheme.colorSet.textGrey.style(fontSize: 13),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () =>
                      rechargeDialog(context: buildContext, appTheme: appTheme, showCanTranTokensType: ShowCanTranTokensType.recharge),
                  child: Column(
                    children: [
                      Image.asset(R.ASSETS_IMAGES_GROUP_44_PNG),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "充值",
                        style: appTheme.colorSet.colorDark.style(fontSize: 12),
                      )
                    ],
                  )),
              const SizedBox(
                width: 49,
              ),
              GestureDetector(
                  onTap: () =>
                      Navigator.push(buildContext, TransferView.route()),
                  child: Column(
                    children: [
                      Image.asset(R.ASSETS_IMAGES_GROUP_43_PNG),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "划转",
                        style: appTheme.colorSet.colorDark.style(fontSize: 12),
                      )
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
