import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/assets/transfer_cubit.dart';
import 'package:ceex_flutter/cubit/search_tokens/search_tokens_cubit.dart';
import 'package:ceex_flutter/model/appconfig/symbol_model.dart';
import 'package:ceex_flutter/model/assets/sub_account_query_model.dart';
import 'package:ceex_flutter/views/assets/components/net_select_view.dart';
import 'package:ceex_flutter/views/assets/recharge/recharge_view.dart';
import 'package:ceex_flutter/views/assets/search_tokens/show_can_tran_tokens_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

assetsDialog({
  required BuildContext context,
  required String title,
}) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final appTheme = context.watch<AppconfCubit>().state.appTheme;
        return Container(
            height: 338,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Image.asset(R.ASSETS_IMAGES_CLOSE_LINE_PNG)),
                    Center(
                      child: Text(
                        title,
                        style: appTheme.colorSet.colorDark.style(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: ((context, index) => GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 15),
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            width: 1,
                                            color:
                                                appTheme.colorSet.colorLight))),
                                child: Text(
                                  "USDT",
                                  style: appTheme.colorSet.textBlack.style(),
                                ),
                              ),
                            ))))
              ],
            ));
      });
}

chooseAssetsType({
  required BuildContext context,
  required String title,
  required List<SubAccountQueryModel> list,
  required SubAccountQueryModel subAccountQueryModel,
  required TransferCubit cubit,
}) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final appTheme = context.watch<AppconfCubit>().state.appTheme;
        return Container(
            height: 338,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Image.asset(R.ASSETS_IMAGES_CLOSE_LINE_PNG)),
                    ),
                    Center(
                      child: Text(
                        title,
                        style: appTheme.colorSet.colorDark.style(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: ((context, index) => GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                cubit.setSelectAssetType(
                                    s: list[index],
                                    isFromAsset: subAccountQueryModel ==
                                        cubit.state.sourceAssetType);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 15),
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            width: 1,
                                            color:
                                                appTheme.colorSet.colorLight))),
                                child: Text(
                                  list[index].accountName!,
                                  style: appTheme.colorSet.textBlack.style(),
                                ),
                              ),
                            ))))
              ],
            ));
      });
}

rechargeDialog({
  required BuildContext context,
  required AppTheme appTheme,
  required ShowCanTranTokensType showCanTranTokensType,
}) {
  Navigator.push(
      context,
      ShowCanTranTokensView.route((model) {
        if ((model.chainTypes ?? []).isEmpty) {
          // 可充值的币种下没有网络可供选择
          Navigator.push(
              context,
              RechargeView.route(
                  tokenId: model.tokenId ?? "",
                  chainType: const ChainTypesModel(),
                  chainTypes: model.chainTypes ?? []));
        } else {
          Navigator.push(context, NetSelectView.route(model.chainTypes!))
              .then((value) {
            if (value != null) {
              Navigator.push(
                  context,
                  RechargeView.route(
                      tokenId: model.tokenId ?? "",
                      chainType: value,
                      chainTypes: model.chainTypes ?? []));
            }
          });
        }
      }, showCanTranTokensType: showCanTranTokensType));
  // showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     isScrollControlled: true,
  //     builder: (context) {
  //       final appTheme = context.watch<AppconfCubit>().state.appTheme;
  //       return Container(
  //           decoration: const BoxDecoration(
  //               borderRadius: BorderRadius.only(
  //                   topLeft: Radius.circular(10),
  //                   topRight: Radius.circular(10)),
  //               color: Colors.white),
  //           child: Column(mainAxisSize: MainAxisSize.min, children: [
  //             const SizedBox(
  //               height: 32,
  //             ),
  //             GestureDetector(
  //                 onTap: () {
  //                   Navigator.push(
  //                       context,
  //                       ShowCanTranTokensView.route((model) {
  //                         if ((model.chainTypes ?? []).isEmpty) {
  //                           // 可充值的币种下没有网络可供选择
  //                           Navigator.push(
  //                               context,
  //                               RechargeView.route(
  //                                   tokenId: model.tokenId ?? "",
  //                                   chainType: const ChainTypesModel(),
  //                                   chainTypes: model.chainTypes ?? []));
  //                         } else {
  //                           Navigator.push(context,
  //                                   NetSelectView.route(model.chainTypes!))
  //                               .then((value) {
  //                             if (value != null) {
  //                               Navigator.push(
  //                                   context,
  //                                   RechargeView.route(
  //                                       tokenId: model.tokenId ?? "",
  //                                       chainType: value,
  //                                       chainTypes: model.chainTypes ?? []));
  //                             }
  //                           });
  //                         }
  //                       },
  //                           showCanTranTokensType:
  //                               ShowCanTranTokensType.withdraw));
  //                 },
  //                 child: Container(
  //                   padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
  //                   margin: const EdgeInsets.symmetric(
  //                     horizontal: 15,
  //                   ),
  //                   decoration: BoxDecoration(
  //                       border: Border.all(
  //                           width: 1, color: appTheme.colorSet.colorLight)),
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(
  //                         "我有加密货币",
  //                         style: appTheme.colorSet.textBlack.style(),
  //                       ),
  //                       const SizedBox(
  //                         height: 23,
  //                       ),
  //                       Row(
  //                         children: [
  //                           Image.asset(R.ASSETS_IMAGES_GROUP_44_PNG),
  //                           Text(
  //                             "充值",
  //                             style: appTheme.colorSet.textBlack
  //                                 .style(fontSize: 16),
  //                           )
  //                         ],
  //                       ),
  //                       const SizedBox(
  //                         height: 10,
  //                       ),
  //                       Padding(
  //                           padding: const EdgeInsets.only(left: 41),
  //                           child: Text(
  //                             "将加密资产添加到您的CEEX账户",
  //                             style: appTheme.colorSet.textGrey
  //                                 .style(fontSize: 12),
  //                           )),
  //                     ],
  //                   ),
  //                 )),
  //             const SizedBox(
  //               height: 24,
  //             ),
  //             // GestureDetector(
  //             //     onTap: () {
  //             //       showMsg("暂缓开通");
  //             //     },
  //             //     child: Container(
  //             //       padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
  //             //       margin: const EdgeInsets.symmetric(horizontal: 15),
  //             //       decoration: BoxDecoration(
  //             //           border: Border.all(
  //             //               width: 1, color: appTheme.colorSet.colorLight)),
  //             //       child: Column(
  //             //         crossAxisAlignment: CrossAxisAlignment.start,
  //             //         children: [
  //             //           Text(
  //             //             "我没有加密货币",
  //             //             style: appTheme.colorSet.textBlack.style(),
  //             //           ),
  //             //           const SizedBox(
  //             //             height: 23,
  //             //           ),
  //             //           Row(
  //             //             children: [
  //             //               Image.asset(R.ASSETS_IMAGES_GROUP_44_PNG),
  //             //               const SizedBox(
  //             //                 width: 15,
  //             //               ),
  //             //               Text(
  //             //                 "现金余额",
  //             //                 style: appTheme.colorSet.textBlack
  //             //                     .style(fontSize: 16),
  //             //               )
  //             //             ],
  //             //           ),
  //             //           const SizedBox(
  //             //             height: 10,
  //             //           ),
  //             //           Padding(
  //             //               padding: const EdgeInsets.only(left: 41),
  //             //               child: Text(
  //             //                 "使用您的法币余额购买加密货币",
  //             //                 style: appTheme.colorSet.textGrey
  //             //                     .style(fontSize: 12),
  //             //               )),
  //             //         ],
  //             //       ),
  //             //     )),
  //             const SizedBox(
  //               height: 40,
  //             ),
  //           ]));
  // });
}

upDataMegeDigitDataDialog(
    {required BuildContext context,
    required String title,
    required List<String> list,
    required void Function(int)? onTap}) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final appTheme = context.watch<AppconfCubit>().state.appTheme;
        return Container(
            height: 338,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Padding(
                            padding: EdgeInsets.only(right: 15),
                            child:
                                Image.asset(R.ASSETS_IMAGES_CLOSE_LINE_PNG))),
                    Center(
                      child: Text(
                        title,
                        style: appTheme.colorSet.colorDark.style(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: ((context, index) => GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                onTap?.call(index);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 15),
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            width: 1,
                                            color:
                                                appTheme.colorSet.colorLight))),
                                child: Text(
                                  list[index],
                                  style: appTheme.colorSet.textBlack.style(),
                                ),
                              ),
                            ))))
              ],
            ));
      });
}
