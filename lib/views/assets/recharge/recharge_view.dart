import 'dart:convert';

import 'package:ceex_flutter/components/app_bar_center_text.dart';
import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/recharge/recharge_cubit.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';
import 'package:ceex_flutter/model/appconfig/symbol_model.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/views/assets/components/net_select_view.dart';
import 'package:ceex_flutter/views/assets/orderlist/order_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 充值
class RechargeView extends StatefulWidget {
  final String tokenId;
  final ChainTypesModel chainType;
  final List<ChainTypesModel> chainTypes;

  const RechargeView(
      {super.key,
      required this.tokenId,
      required this.chainType,
      required this.chainTypes});

  static Route route(
          {required String tokenId,
          required ChainTypesModel chainType,
          required List<ChainTypesModel> chainTypes}) =>
      MaterialPageRoute(
          builder: (context) => RechargeView(
                tokenId: tokenId,
                chainType: chainType,
                chainTypes: chainTypes,
              ));

  @override
  State<RechargeView> createState() => _RechargeViewState();
}

class _RechargeViewState extends State<RechargeView> {
  late AppTheme appTheme;
  late ChainTypesModel chainType;
  final cubit = RechargeCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chainType = widget.chainType;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appTheme = context.read<AppconfCubit>().state.appTheme;
    cubit.getDepositAddress(
        tokenId: widget.tokenId, chainType: chainType.chainType ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWrapper(
            statusBarColor: appTheme.colorSet.colorWhite,
            child: AppBarCenterText(
              title: AppLocalizations.of(context)!.rechargeOnChainCoin,
              rigetWidget: _buildAppBarRight(),
            )),
        body: SafeArea(
          bottom: true,
          child: BlocBuilder<RechargeCubit, RechargeState>(
              bloc: cubit,
              builder: (context, state) {
                return CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 28,
                      ),
                    ),
                    SliverToBoxAdapter(
                        child: state.model == null
                            ? const SizedBox()
                            : Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.memory(
                                    base64.decode(state.model?.qrcode ?? ""),
                                    height: 174,
                                    width: 174,
                                    fit: BoxFit.cover,
                                  ),
                                  Image.asset(R.ASSETS_IMAGES_ELLIPSE_2250_PNG)
                                ],
                              )),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 56,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: centerNet(state),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 32,
                      ),
                    ),
                    SliverToBoxAdapter(
                        child: Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              AppLocalizations.of(context)!.rechargeInformation,
                              style: appTheme.colorSet.textBlack.style(),
                            ))),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 16,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: rowInformation(
                          key: AppLocalizations.of(context)!.rechargeMinMoney,
                          value:
                              "${state.model?.minQuantity ?? "--"} ${widget.tokenId}"),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 16,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: rowInformation(
                        key:
                            AppLocalizations.of(context)!.rechargeMineyReceived,
                        value:
                            "${state.model?.requiredConfirmNum ?? "0"}${AppLocalizations.of(context)!.networkConfirmations}",
                        dialogTap: () {},
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 16,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: rowInformation(
                          key:
                              AppLocalizations.of(context)!.withdrawalUnlocking,
                          value:
                              "${state.model?.canWithdrawConfirmNum ?? "0"}${AppLocalizations.of(context)!.networkConfirmations}",
                          dialogTap: () {}),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 16,
                      ),
                    ),
                    // SliverToBoxAdapter(
                    //   child: rowInformation(
                    //       key: "合约信息", value: "尾号为eaaf85", jumpTap: () {}),
                    // ),
                  ],
                );
              }),
        ));
  }

  Widget _buildAppBarRight() {
    return Row(
      children: [
        // Image.asset(R.ASSETS_IMAGES_QUESTION_LINE_PNG),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, OrderListView.route(widget.tokenId));
          },
          child: Image.asset(R.ASSETS_IMAGES_TASK_2_LINE_PNG),
        ),
      ],
    );
  }

  Widget centerNet(RechargeState state) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 32),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: appTheme.colorSet.colorLight),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Text(
                  AppLocalizations.of(context)!.rechargeCoinAddress,
                  style: appTheme.colorSet.textGrey.style(fontSize: 12),
                ),
                Image.asset(R.ASSETS_IMAGES_RIGHT_SMALL_LINE_PNG)
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: Text(
                  state.model?.address ?? "--",
                  style: appTheme.colorSet.textBlack.style(fontSize: 18),
                )),
                const SizedBox(
                  width: 37,
                ),
                GestureDetector(
                    onTap: () {
                      Clipboard.setData(
                          ClipboardData(text: state.model?.address ?? "123"));
                      showMsg(
                        AppLocalizations.of(context)!.copySuccess,
                      );
                    },
                    child: Image.asset(R.ASSETS_IMAGES_COPY_3_LINE_PNG)),
                const SizedBox(
                  width: 15,
                )
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Text(
                  AppLocalizations.of(context)!.rechargeCoinNet,
                  style: appTheme.colorSet.textGrey.style(fontSize: 12),
                ),
                const SizedBox(
                  width: 5,
                ),
                // Image.asset(R.ASSETS_IMAGES_VECTOR_PNG)
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            GestureDetector(
                onTap: () {
                  // final chainTypes = tokenModel?.chainTypes ?? [];
                  if (widget.chainTypes.isEmpty) {
                    showMsg("无网络可选择");
                  } else {
                    Navigator.push(
                            context, NetSelectView.route(widget.chainTypes))
                        .then((value) {
                      if (value != null) {
                        setState(() {
                          chainType = value;
                        });
                        cubit.upDateAddress(
                            tokenId: widget.tokenId,
                            chainType: value.chainType ?? "");
                      }
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: appTheme.colorSet.colorLight),
                  height: 44,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        chainType.chainType ?? "--",
                        style: appTheme.colorSet.textBlack.style(),
                      ),
                      const Spacer(),
                      Image.asset(R.ASSETS_IMAGES_DOWN_SMALL_LINE_PNG),
                    ],
                  ),
                )),
            const SizedBox(
              height: 32,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Text(
                  AppLocalizations.of(context)!.rechargeCoinTo,
                  style: appTheme.colorSet.textGrey.style(fontSize: 12),
                ),
                const SizedBox(
                  width: 5,
                ),
                // Image.asset(R.ASSETS_IMAGES_VECTOR_PNG)
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: appTheme.colorSet.colorLight),
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.walletAccount,
                    style: appTheme.colorSet.textBlack.style(),
                  ),
                  const Spacer(),
                  // Image.asset(R.ASSETS_IMAGES_DOWN_SMALL_LINE_PNG),
                ],
              ),
            )
          ],
        ));
  }

  Widget rowInformation({
    final VoidCallback? dialogTap,
    final VoidCallback? jumpTap,
    required String key,
    required String value,
  }) {
    return Row(
      children: [
        const SizedBox(
          width: 15,
        ),
        GestureDetector(
            onTap: dialogTap,
            child: Row(
              children: [
                Text(
                  key,
                  style: appTheme.colorSet.textGrey.style(),
                ),
                const SizedBox(
                  width: 5,
                ),
                // dialogTap == null
                //     ? const SizedBox()
                //     : Image.asset(R.ASSETS_IMAGES_VECTOR_PNG)
              ],
            )),
        const Spacer(),
        GestureDetector(
            onTap: jumpTap,
            child: Row(
              children: [
                Text(
                  value,
                  style: appTheme.colorSet.textBlack.style(),
                ),
                jumpTap == null
                    ? const SizedBox()
                    : Image.asset(R.ASSETS_IMAGES_RIGHT_SMALL_LINE_PNG)
              ],
            )),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
