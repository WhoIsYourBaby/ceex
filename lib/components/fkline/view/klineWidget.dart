/*
 * @Description: 
 * @Author: zhaojijin
 * @LastEditors: zhaojijin
 * @Date: 2019-04-18 13:54:54
 * @LastEditTime: 2019-04-25 11:44:32
 */
import 'package:ceex_flutter/components/fkline/fkline.dart';
import 'package:ceex_flutter/components/fkline/view/kline/klineTypeSelectorWidget.dart';
import 'package:flutter/material.dart';
import './grid/klinePriceGridWidget.dart';
import './grid/klineVolumeGridWidget.dart';
import './kline/klineCandleCrossWidget.dart';
import './kline/klineCandleInfoWidget.dart';
import './kline/klineCandleWidget.dart';
import './kline/klineLoadingWidget.dart';
import './kline/klineMaLineWidget.dart';
import './kline/klinePeriodSwitch.dart';
import './kline/klineVolumeWidget.dart';

class KlineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    KlineBloc bloc = KlineBlocProvider.of<KlineBloc>(context);
    return AspectRatio(
      aspectRatio: _getTotalAspectRatio(
        context,
        kcandleAspectRatio,
        kVolumeAspectRatio,
        kPeriodAspectRatio,
        kLineTypeAspectRatio,
      ),
      child: Container(
        color: kBackgroundColor,
        child: StreamBuilder<List<YKLineType>>(
            stream: bloc.lineTypesStream,
            builder: (context, snapshot) {
              final lineTypes = snapshot.data ?? [];
              return Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      AspectRatio(
                        child: KlinePeriodSwitchWidget(),
                        aspectRatio: kPeriodAspectRatio,
                      ),
                      AspectRatio(
                        aspectRatio: kcandleAspectRatio,
                        child: Stack(
                          children: <Widget>[
                            KlinePriceGridWidget(),
                            KlineCandleWidget(),
                            if (lineTypes.contains(YKLineType.MA5))
                              KlineMaLineWidget(YKLineType.MA5),
                            if (lineTypes.contains(YKLineType.MA10))
                              KlineMaLineWidget(YKLineType.MA10),
                            if (lineTypes.contains(YKLineType.MA30))
                              KlineMaLineWidget(YKLineType.MA30),
                            if (lineTypes.contains(YKLineType.EMA12))
                              KlineMaLineWidget(YKLineType.EMA12),
                            if (lineTypes.contains(YKLineType.EMA26))
                              KlineMaLineWidget(YKLineType.EMA26),
                          ],
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: kVolumeAspectRatio,
                        child: Stack(
                          children: <Widget>[
                            KlineVolumeGridWidget(),
                            KlineVolumeWidget(),
                          ],
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: kLineTypeAspectRatio,
                        child: KlineTypeSelectorWidget(
                          lineTypes: lineTypes,
                        ),
                      ),
                    ],
                  ),
                  KlineCandleCrossWidget(),
                  KlineCandleInfoWidget(),
                  KlineLoadingWidget(),
                ],
              );
            }),
      ),
    );
  }
}

double _getTotalAspectRatio(
  BuildContext context,
  double aspectRatio1,
  aspectRatio2,
  aspectRatio3,
  aspectRatio4,
) {
  if (aspectRatio1 == 0 ||
      aspectRatio2 == 0 ||
      aspectRatio3 == 0 ||
      aspectRatio4 == 0) {
    return 1;
  }
  double width = MediaQuery.of(context).size.width;
  // width/height1 = aspectRatio1; height1 = width/aspectRatio1;
  double height1 = width / aspectRatio1;
  double height2 = width / aspectRatio2;
  double heitht3 = width / aspectRatio3;
  double heitht4 = width / aspectRatio4;
  return width / (height1 + height2 + heitht3 + heitht4);
}
