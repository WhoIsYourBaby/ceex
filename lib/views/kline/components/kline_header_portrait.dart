import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/symbol_ticker/symbol_ticker_cubit.dart';
import 'package:ceex_flutter/utils/ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KlineHeaderPortrait extends StatelessWidget {
  final String symbolId;
  const KlineHeaderPortrait({
    required this.symbolId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.read<AppconfCubit>().state.appTheme;
    return BlocBuilder<SymbolTickerCubit, SymbolTickerState>(
      builder: (context, state) {
        if (state.model == null) {
          return Container();
        }
        final model = state.model!;
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  model.c?.toNum()?.toStringAsFixed(2) ?? "0.00",
                  style: appTheme.colorSet.colorAuxiliary2.style(fontSize: 12)
                      .copyWith(fontSize: 26),
                ),
                Spacer(),
                // Image.asset(
                //   R.ASSETS_IMAGES_RED_SMALL_FILL_PNG,
                //   width: 16,
                //   height: 16,
                // ),
                // Text(
                //   "2.92%",
                //   style: appTheme.colorSet.colorAuxiliary2.style(fontSize: 12),
                // ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  width: 80,
                  height: 28,
                  decoration: BoxDecoration(
                    color: appTheme.colorSet.colorAuxiliary2,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "${((model.m?.toNum() ?? 0) * 100).toStringAsFixed(2)}%",
                    style: appTheme.colorSet.textWhite.style(fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "成交量 ${model.v}",
              style: appTheme.colorSet.textGrey.style(fontSize: 12).copyWith(
                fontSize: 10,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    text: "24小时最低  ",
                    style: appTheme.colorSet.textGrey.style(fontSize: 12).copyWith(
                      fontSize: 10,
                    ),
                    children: [
                      TextSpan(
                        text: model.h,
                        style: appTheme.colorSet.textBlack.style(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 60,
                ),
                RichText(
                  text: TextSpan(
                    text: "24小时最高  ",
                    style: appTheme.colorSet.textGrey.style(fontSize: 12).copyWith(
                      fontSize: 10,
                    ),
                    children: [
                      TextSpan(
                        text: model.l,
                        style: appTheme.colorSet.textBlack.style(fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
