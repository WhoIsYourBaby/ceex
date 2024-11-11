import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/views/contract/common/network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LevelViewItem extends StatelessWidget {
  final String tokenName;
  final String total;
  final bool? showAssets;
  final double rates;
  final String? iconUrl;
  final String balanceUpdatedAt;
  final VoidCallback? onTap;
  final String? free;
  final bool? showFree;
  final bool? isLevel;

  const LevelViewItem(
      {required this.tokenName,
      required this.total,
      this.showAssets,
      this.iconUrl,
      required this.balanceUpdatedAt,
      this.onTap,
      required this.rates,
      this.free,
      this.showFree = false,
      this.isLevel = true,
      super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return GestureDetector(
        onTap: onTap,
        child: Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: 1, color: appTheme.colorSet.colorLight))),
            child: Column(
              children: [
                Row(
                  children: [
                    NetworkImageWidget(
                        url: iconUrl ?? "", width: 24, height: 24),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      tokenName,
                      style: appTheme.colorSet.textBlack
                          .style(fontSize: 14, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (isLevel ?? true)? "可用" : "权益",
                          style: appTheme.colorSet.textBlack
                              .style(fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          (showAssets ?? true) ? balanceUpdatedAt : "***",
                          style: appTheme.colorSet.textBlack
                              .style(fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                    showFree ?? false
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                (isLevel ?? true)? "已借":"可用",
                                style: appTheme.colorSet.textBlack.style(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                showAssets ?? true ? (free ?? "0") : "***",
                                style: appTheme.colorSet.textBlack.style(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        : const SizedBox(),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          (isLevel ?? true)? "冻结":"占用",
                          style: appTheme.colorSet.textBlack
                              .style(fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          (showAssets ?? true) ? total : "***",
                          style: appTheme.colorSet.textBlack.style(fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ))
                  ],
                ),
              ],
            )));
  }
}
