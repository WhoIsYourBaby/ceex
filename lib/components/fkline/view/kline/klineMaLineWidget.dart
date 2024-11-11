/*
 * @Description: 
 * @Author: zhaojijin
 * @LastEditors: zhaojijin
 * @Date: 2019-04-18 16:48:38
 * @LastEditTime: 2019-04-25 11:47:15
 */
import 'package:flutter/material.dart';
import '../../bloc/klineBloc.dart';
import '../../bloc/klineBlocProvider.dart';
import '../../model/klineConstrants.dart';
import '../../model/klineModel.dart';

class KlineMaLineWidget extends StatelessWidget {
  final YKLineType maType;
  KlineMaLineWidget(this.maType);
  @override
  Widget build(BuildContext context) {
    KlineBloc bloc = KlineBlocProvider.of<KlineBloc>(context);
    return StreamBuilder(
      stream: bloc.currentKlineListStream,
      builder: (BuildContext context, AsyncSnapshot<List<Market>> snapshot) {
        List<Market>? listData;
        if (snapshot.data != null) {
          listData = snapshot.data;
        }
        return CustomPaint(
          size: Size(bloc.screenWidth, bloc.screenWidth / kcandleAspectRatio),
          painter: _KlineMaLinePainter(
            listData,
            maType,
            bloc.priceMax,
            bloc.priceMin,
            bloc.candlestickWidth,
          ),
        );
      },
    );
  }
}

class _KlineMaLinePainter extends CustomPainter {
  _KlineMaLinePainter(this.listData, this.maType, this.priceMax, this.priceMin,
      this.candlestickWidth);
  final List<Market>? listData;
  final YKLineType? maType;
  final double? priceMax;
  final double? priceMin;
  final double? candlestickWidth;
  final double? lineWidth = kMaLineWidth;
  final double? topMargin = kMaTopMargin;
  final double? candlestickGap = kCandlestickGap;
  Color? get lineColor {
    switch (maType) {
      case YKLineType.MA5:
        return kMa5LineColor;
      case YKLineType.MA10:
        return kMa10LineColor;
      case YKLineType.MA30:
        return kMa30LineColor;
      default:
        return Colors.black;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (listData == null ||
        priceMax == null ||
        priceMin == null ||
        maType == null) {
      return;
    }

    double height = size.height - (topMargin ?? 0);
    double heightPriceOffset = 0;
    if ((priceMax ?? 0) - (priceMin ?? 0) != 0) {
      heightPriceOffset = height / ((priceMax ?? 0) - (priceMin ?? 0));
    }

    for (int i = 0; i < (listData?.length ?? 0); i++) {
      if (i == (listData?.length ?? 0) - 1) {
        break;
      }

      Market? market = listData?[i];
      Market? nextMarket = listData?[i + 1];
      // print(
      // '============ market.priceMa5 : ${market.priceMa5}  market.priceMa10 : ${market.priceMa10}  market.priceMa30 : ${market.priceMa30} index: $i count : ${listData.length}');
      final specValue = market?.getValueForType(maType!);
      if (specValue == null) {
        continue;
      }
      double? currentMaPrice = market?.getValueForType(maType!);
      double? currentNextMaPrice = nextMarket?.getValueForType(maType!);

      Paint maPainter = Paint()
        ..color = lineColor!
        ..isAntiAlias = true
        ..filterQuality = FilterQuality.high
        // ..strokeCap = StrokeCap.round
        ..strokeWidth = (lineWidth ?? 0);

      double startX, startY, endX, endY;
      int j = (listData?.length ?? 0) - 1 - i;

      double startRectLeft =
          j * ((candlestickWidth ?? 0) + (candlestickGap ?? 0)) +
              (candlestickGap ?? 0);
      double endRectLeft =
          (j - 1) * ((candlestickWidth ?? 0) + (candlestickGap ?? 0)) +
              (candlestickGap ?? 0);
      startX = startRectLeft + (candlestickWidth ?? 0) / 2;
      endX = endRectLeft + (candlestickWidth ?? 0) / 2;

      // print('startX: $startX ==== endX: $endX     === ${i}');
      if (currentMaPrice != null && currentNextMaPrice != null) {
        startY = height -
            (currentMaPrice - (priceMin ?? 0)) * heightPriceOffset +
            (topMargin ?? 0);
        endY = height -
            (currentNextMaPrice - (priceMin ?? 0)) * heightPriceOffset +
            (topMargin ?? 0);

        canvas.drawLine(Offset(startX, startY), Offset(endX, endY), maPainter);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return listData != null;
  }
}
