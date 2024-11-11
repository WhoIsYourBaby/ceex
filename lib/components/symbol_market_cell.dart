import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/basic/basic_config_cubit.dart';
import 'package:ceex_flutter/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ceex_flutter/utils/ext.dart';

/// 公共组件目录，增加项目一致性和代码复用
/// 小至按钮、输入框、大到列表都应该优先写入公共组件库中

class SymbolMarketCell extends StatelessWidget {
  final Size size;
  final List<int> flexValues;
  final KlineModel model;
  final VoidCallback? onTap;
  const SymbolMarketCell({
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
    final symbolPair = separateSymbol(model.s ?? "");
    final mValue = model.m?.toNum() ?? 0;
    assert(flexValues.length == 3);
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    final symbolIconMap =
        context.watch<BasicConfigCubit>().state.symbolIconMap ?? {};
    final iconUrl = symbolIconMap[model.s ?? ""] ?? "";
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                          width: 32,
                          height: 32,
                        )
                      : Image.network(
                          iconUrl,
                          width: 32,
                          height: 32,
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
                              width: 32,
                              height: 32,
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
                          text: symbolPair[0],
                          style: appTheme.colorSet.colorDark
                              .style(fontWeight: FontWeight.w600),
                          children: [
                            TextSpan(
                              text: "/${symbolPair[1]}",
                              style: appTheme.colorSet.textGrey
                                  .style(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "\$${model.v}",
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
              child: Image.asset(
                R.ASSETS_IMAGES_GROUP_7_PNG,
                fit: BoxFit.scaleDown,
              ),
            ),
            Expanded(
              flex: flexValues[2],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${model.c}",
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
