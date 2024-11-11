import 'package:ceex_flutter/components/kline_wave_painter.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/basic/basic_config_cubit.dart';
import 'package:ceex_flutter/cubit/market_view/market_view_cubit.dart';
import 'package:ceex_flutter/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ceex_flutter/utils/ext.dart';

/// 公共组件目录，增加项目一致性和代码复用
/// 小至按钮、输入框、大到列表都应该优先写入公共组件库中

class SymbolMarket2Cell extends StatelessWidget {
  final Size size;
  final List<int> flexValues;
  final SymbolMarketCellModel model;
  final VoidCallback? onTap;
  const SymbolMarket2Cell({
    required this.size,
    required this.model,
    this.flexValues = const [5, 4, 3],
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // flexValues长度必须为3
    // 将cell分为3部分
    final mValue = model.margin?.toNum() ?? 0;
    assert(flexValues.length == 3);
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    final iconMap = context.read<BasicConfigCubit>().state.symbolIconMap ?? {};
    final iconUrl = iconMap[model.symbol ?? ""] ?? "";
    final klineCloseNumbers =
        model.history?.map((e) => (e.c?.toNum() ?? 0)).toList();
    final iconSize = 26.0;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        width: size.width,
        height: size.height,
        child: Row(
          children: [
            Expanded(
              flex: flexValues[0],
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  iconUrl.length == 0
                      ? Image.asset(
                          R.ASSETS_IMAGES_GROUP_16_PNG,
                          width: iconSize,
                          height: iconSize,
                        )
                      : Image.network(
                          iconUrl,
                          width: iconSize,
                          height: iconSize,
                          // loadingBuilder: (context, child, loadingProgress) {
                          //   return Image.asset(
                          //     R.ASSETS_IMAGES_GROUP_16_PNG,
                          //     width: 32,
                          //     height: 32,
                          //   );
                          // },
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              R.ASSETS_IMAGES_GROUP_16_PNG,
                              width: iconSize,
                              height: iconSize,
                            );
                          },
                        ),
                  SizedBox(
                    width: 6,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: model.baseTokenId,
                          style: appTheme.colorSet.colorDark
                              .style(fontWeight: FontWeight.w600),
                          children: [
                            TextSpan(
                              text: "/${model.quoteTokenId}",
                              style: appTheme.colorSet.textGrey
                                  .style(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "${model.volume?.toNum()?.toStringAsFixed(1) ?? "0"}",
                        style: appTheme.colorSet.textGrey
                            .style(fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: flexValues[1],
              child: CustomPaint(
                size: Size(120, size.height * 0.5),
                painter: KlineWavePainter(klineCloseNumbers),
              ),
            ),
            Expanded(
              flex: flexValues[2],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$${model.closePrice ?? "0"}",
                    style: appTheme.colorSet.textBlack
                        .style(fontWeight: FontWeight.w600),
                  ),
                  RichText(
                      text: TextSpan(children: [
                    WidgetSpan(
                      child: Image.asset(
                        mValue >= 0
                            ? R.ASSETS_IMAGES_GREEN_SMALL_FILL_PNG
                            : R.ASSETS_IMAGES_RED_SMALL_FILL_PNG,
                        width: 16,
                        height: 16,
                      ),
                    ),
                    TextSpan(
                      text: "${(mValue * 100).toStringAsFixed(2)}%",
                      style: mValue >= 0
                          ? appTheme.colorSet.colorDark
                              .style(fontSize: 12, fontWeight: FontWeight.w600)
                          : appTheme.colorSet.colorDark
                              .style(fontSize: 12, fontWeight: FontWeight.w600)
                              .copyWith(
                                color: appTheme.colorSet.colorAuxiliary2,
                              ),
                    ),
                  ])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> separateSymbol(String symbol) {
    if (symbol.endsWith("USDT")) {
      return [symbol.replaceAll("USDT", ""), "USDT"];
    } else {
      return [symbol, symbol];
    }
  }
}

class SymbolMarketCellModel {
  KlineModel? klineModel;
  SymbolModel? symbolModel;
  List<KlineModel>? history;

  SymbolMarketCellModel({
    this.klineModel,
    this.symbolModel,
    this.history,
  });

  SymbolMarketCellModel copyWith({
    KlineModel? klineModel,
    SymbolModel? symbolModel,
    List<KlineModel>? history,
  }) {
    return SymbolMarketCellModel(
      klineModel: klineModel ?? this.klineModel,
      symbolModel: symbolModel ?? this.symbolModel,
      history: history ?? this.history,
    );
  }

  String? get baseTokenId => symbolModel?.baseTokenId;
  String? get quoteTokenId => symbolModel?.quoteTokenId;
  String? get volume => klineModel?.v;
  String? get closePrice => klineModel?.c;
  String? get margin => klineModel?.m;
  String? get symbol => symbolModel?.symbolId;
  String? get exchangeId => symbolModel?.exchangeId;
}
