import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/kline/kline_trade_cubit.dart';
import 'package:ceex_flutter/utils/ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// 币对成交界面
class KlineTradedView extends StatefulWidget {
  const KlineTradedView({super.key});

  @override
  State<KlineTradedView> createState() => _KlineTradedViewState();
}

class _KlineTradedViewState extends State<KlineTradedView> {
  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return BlocBuilder<KlineTradeCubit, KlineTradeState>(
      builder: (context, state) {
        final tradeList = (state.tradeList ?? []).reversed.toList();
        return ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            // title
            KlineTradedViewCell(spaces: [
              4,
              3,
              5,
              4
            ], children: [
              _buildTitle(appTheme, "时间"),
              _buildTitle(appTheme, "方向"),
              _buildTitle(appTheme, "价格(USDT)"),
              _buildTitle(appTheme, "数量(BTC)", TextAlign.end),
            ]),
            // 交易cell
            ...tradeList
                .map(
                  (e) => KlineTradedViewCell(spaces: [
                    4,
                    3,
                    5,
                    4
                  ], children: [
                    _buildNormal(
                      appTheme,
                      DateTime.fromMillisecondsSinceEpoch(e.t?.toInt() ?? 0)
                          .formatHHMMnnSS(),
                    ),
                    _buildSpecial(
                      appTheme,
                      (e.m ?? false) ? "买入" : "卖出",
                      isRed: !(e.m ?? false),
                    ),
                    _buildSpecial(appTheme, e.p ?? "", isRed: false),
                    _buildNormal(appTheme, e.q ?? "", TextAlign.end),
                  ]),
                )
                .toList(),
          ],
        );
      },
    );
  }

  Widget _buildTitle(AppTheme appTheme, String title,
      [TextAlign align = TextAlign.start]) {
    return Text(
      title,
      style: appTheme.colorSet.textGrey.style(fontSize: 12),
      textAlign: align,
    );
  }

  Widget _buildNormal(AppTheme appTheme, String text,
      [TextAlign align = TextAlign.start]) {
    return Text(
      text,
      style: appTheme.colorSet.textBlack.style(),
      textAlign: align,
    );
  }

  Widget _buildSpecial(AppTheme appTheme, String text,
      {TextAlign align = TextAlign.start, bool isRed = true}) {
    return Text(
      text,
      style: isRed
          ? appTheme.colorSet.colorAuxiliary2.style(fontSize: 14)
          : appTheme.colorSet.colorPrimary.style(fontSize: 14),
      textAlign: align,
    );
  }
}

class KlineTradedViewCell extends StatelessWidget {
  final List<Widget> children;
  final List<int> spaces;
  const KlineTradedViewCell({
    required this.spaces,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    assert(children.length == spaces.length);
    List<Widget> flexs = [];
    for (var i = 0; i < children.length; i++) {
      flexs.add(
        Expanded(
          flex: spaces[i],
          child: children[i],
        ),
      );
    }
    return Container(
      height: 32,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: flexs,
      ),
    );
  }
}
