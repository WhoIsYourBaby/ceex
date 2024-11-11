import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/assets/assets_cubit.dart';
import 'package:ceex_flutter/cubit/basic/basic_config_cubit.dart';
import 'package:ceex_flutter/cubit/search_tokens/search_tokens_cubit.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';
import 'package:ceex_flutter/utils/number_utils.dart';
import 'package:ceex_flutter/views/assets/components/assets_dialog.dart';
import 'package:ceex_flutter/views/assets/orderlist/order_list_view.dart';
import 'package:ceex_flutter/views/assets/search_tokens/search_tokens_view.dart';
import 'package:ceex_flutter/views/assets/token_detail/token_detail_view.dart';
import 'package:ceex_flutter/views/assets/transfer_view.dart';
import 'package:ceex_flutter/views/assets/withdraw/withdraw_view.dart';
import 'package:ceex_flutter/views/contract/assets_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 资产钱包
class AssetsSpotGoodsWidget extends StatefulWidget {
  final AssetsCubit cubit;
  const AssetsSpotGoodsWidget({required this.cubit, super.key});

  @override
  State<AssetsSpotGoodsWidget> createState() => _AssetsSpotGoodsWidgetState();
}

class _AssetsSpotGoodsWidgetState extends State<AssetsSpotGoodsWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late AppTheme appTheme;
  late AssetsCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = widget.cubit;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appTheme = context.watch<AppconfCubit>().state.appTheme;
    var value = context.read<BasicConfigCubit>().state.configModel?.token ?? [];
    cubit.getAssetsList(value);
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
          GestureDetector(
              onTap: () => cubit.changeShowAssets(),
              child: Image.asset(cubit.state.showAssets ?? false
                  ? R.ASSETS_IMAGES_EYE_OPEN_LINE_PNG
                  : R.ASSETS_IMAGES_EYE_CLOSE_LINE_PNG)),
          const Spacer(),
          // Image.asset(R.ASSETS_IMAGES_TASK_2_LINE_PNG),
          const SizedBox(
            width: 15,
          )
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
                        ? "${cubit.state.totalType == TotalType.btcValue ? cubit.state.btcValue : (cubit.state.walletMoney ?? "0")}"
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
                ? ("≈¥ ${NumberUtils.getCountConn(NumberUtils.mulString((cubit.state.rates ?? 0).toString(), (cubit.state.walletMoney ?? 0).toString()), 2)}")
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
      const SliverToBoxAdapter(
        child: SizedBox(
          height: 32,
        ),
      ),
      SliverToBoxAdapter(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          GestureDetector(
              onTap: () {
                cubit.showZeroassets();
              },
              child: cubit.state.showZero ?? true
                  ? Image.asset(R.ASSETS_IMAGES_VECTORCIRCLE_PNG,
                      width: 20, height: 20)
                  : Image.asset(
                      R.ASSETS_IMAGES_CHECK_CIRCLE_ICON_PNG,
                      width: 20,
                      height: 20,
                    )),
          const SizedBox(
            width: 6,
          ),
          Text(
            AppLocalizations.of(context)!.hide,
            style: appTheme.colorSet.textGrey
                .style(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          Text(
            AppLocalizations.of(context)!.zeroBalance,
            style: appTheme.colorSet.colorPrimary
                .style(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          Text(AppLocalizations.of(context)!.token,
              style: appTheme.colorSet.textGrey
                  .style(fontSize: 12, fontWeight: FontWeight.w500)),
          const Spacer(),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context, SearchTokensView.route((tokenSelect) {
                      Navigator.push(context, TokenDetailView.route(tokenSelect.tokenId ?? ""));
                    }));
              },
              child: Image.asset(
                R.ASSETS_IMAGES_SEARCH_LINE_PNG,
                width: 24,
                height: 24,
              ))
        ]),
      )),
      const SliverToBoxAdapter(
        child: SizedBox(
          height: 32,
        ),
      ),
      SliverToBoxAdapter(
          child: ListView.builder(
        shrinkWrap: true,
        itemCount: (cubit.state.zichanList ?? []).length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => itemWidget(context, index),
      )),
    ]);
  }

  List<Widget> foreRow(BuildContext buildContext) {
    return [
      foreItem(
          image: Image.asset(R.ASSETS_IMAGES_GROUP_44_PNG),
          title: AppLocalizations.of(context)!.recharge,
          onTap: () {
            rechargeDialog(context: buildContext, appTheme: appTheme, showCanTranTokensType: ShowCanTranTokensType.recharge);
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
          onTap: () async {
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

  Widget itemWidget(context, index) {
    final token = cubit.state.zichanList![index];
    if (!(cubit.state.showZero ?? true) &&
        !(double.parse(token.total ?? "0") > 0)) {
      return const SizedBox();
    } else {
      return AssetsViewItem(
        tokenName: token.tokenName ?? "--",
        total: cubit.state.showAssets ?? false ? (token.total ?? "--") : "***",
        showAssets: cubit.state.showAssets ?? false,
        balanceUpdatedAt: token.tokenFullName ?? "--",
        iconUrl: token.iconUrl,
        rates: cubit.state.rates ?? 0,
        free: token.locked,
        showFree: true,
        quotePrecision: token.quotePrecision ?? "0",
        onTap: () {
          Navigator.push(context, TokenDetailView.route(token.tokenId ?? ""));
        },
      );
    }
  }
}
