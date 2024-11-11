import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/utils/number_utils.dart';
import 'package:ceex_flutter/views/contract/common/network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetsViewItem extends StatelessWidget {
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
  final String? quotePrecision;
  const AssetsViewItem(
      {required this.tokenName,
      required this.total,
      this.showAssets,
      this.iconUrl,
      required this.balanceUpdatedAt,
      this.onTap,
      required this.rates,
      this.free,
      this.showFree = false,
      this.isLevel = false,
      required this.quotePrecision,
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
          child: Row(
            children: [
              NetworkImageWidget(url: iconUrl ?? "", width: 32, height: 32),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tokenName,
                    style: appTheme.colorSet.textBlack
                        .style(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    balanceUpdatedAt,
                    style: appTheme.colorSet.textGrey.style(fontSize: 12),
                  ),
                ],
              )),
              showFree ?? false
                  ? Column(
                      children: [
                        Text(
                          (isLevel ?? false) ? "已借" : "冻结",
                          style: appTheme.colorSet.textBlack
                              .style(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          showAssets ?? true ? (free ?? "0") : "***",
                          style: appTheme.colorSet.textBlack
                              .style(fontSize: 12, fontWeight: FontWeight.w400),
                        )
                      ],
                    )
                  : const SizedBox(),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    (isLevel ?? false)
                        ? "冻结"
                        : (quotePrecision == "-1" ? total : NumberUtils.getCountConn(
                            total,NumberUtils.getDecimalCount(quotePrecision ?? "0") 
                          )),
                    style: (isLevel ?? false)
                        ? appTheme.colorSet.textBlack.style()
                        : appTheme.colorSet.textBlack
                            .style(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    (showAssets ?? true) ? getPrice() : "***",
                    style: appTheme.colorSet.textGrey.style(fontSize: 12),
                  ),
                ],
              ))
            ],
          ),
        ));
  }

  String getPrice() {
    String text = "0";
    if (isLevel ?? false) {
      text = total;
    } else {
      text =
          "≈¥${NumberUtils.mul(rates, double.parse(total)).toStringAsFixed(2)}";
    }
    return text;
  }
}
