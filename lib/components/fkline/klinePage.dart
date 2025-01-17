/*
 * @Description: 
 * @Author: zhaojijin
 * @LastEditors: zhaojijin
 * @Date: 2019-04-16 11:08:20
 * @LastEditTime: 2019-06-03 10:45:24
 */
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './bloc/klineBloc.dart';
import './bloc/klineBlocProvider.dart';
import './model/klineConstrants.dart';
import './model/klineModel.dart';
import './view/klineWidget.dart';

class KlinePageWidget extends StatelessWidget {
  final KlineBloc bloc;
  KlinePageWidget(this.bloc);
  @override
  Widget build(BuildContext context) {
    Offset? lastPoint;
    bool isScale = false;
    bool isLongPress = false;
    bool isHorizontalDrag = false;
    double screenWidth = MediaQuery.of(context).size.width;
    _showCrossWidget(Offset offset) {
      if (isScale || isHorizontalDrag) {
        return;
      }
      isLongPress = true;
      int singleScreenCandleCount =
          bloc.getSingleScreenCandleCount(screenWidth);
      int offsetCount =
          ((offset.dx / screenWidth) * singleScreenCandleCount).toInt();
      // print('offsetCount :$offsetCount length: ${bloc.klineCurrentList.length}');
      if (offsetCount > bloc.klineCurrentList.length - 1) {
        return;
      }
      int index = bloc.klineCurrentList.length - 1 - offsetCount;

      if (index < bloc.klineCurrentList.length) {
        Market market = bloc.klineCurrentList[index];
        market.isShowCandleInfo = true;
        RenderBox candleWidgetRenderBox = bloc.candleWidgetKey.currentContext
            ?.findRenderObject() as RenderBox;
        Offset candleWidgetOriginOffset =
            candleWidgetRenderBox.localToGlobal(Offset.zero);

        RenderBox currentWidgetRenderBox =
            context.findRenderObject() as RenderBox;
        Offset currentWidgetOriginOffset =
            currentWidgetRenderBox.localToGlobal(Offset.zero);

        RenderBox volumeWidgetRenderBox = bloc.volumeWidgetKey.currentContext
            ?.findRenderObject() as RenderBox;

        market.candleWidgetOriginY =
            candleWidgetOriginOffset.dy - currentWidgetOriginOffset.dy;
        market.gridTotalHeight = candleWidgetRenderBox.size.height +
            volumeWidgetRenderBox.size.height;
        // print('${candleWidgetRenderBox.size} ${volumeWidgetRenderBox.size}');
        bloc.marketSinkAdd(market);
      }
    }

    _hiddenCrossWidget() {
      isLongPress = false;
      bloc.marketSinkAdd(
          Market(null, null, null, null, null, null, isShowCandleInfo: false));
    }

    _horizontalDrag(Offset offset) {
      if (isScale || isLongPress) {
        return;
      }
      isHorizontalDrag = true;
      double offsetX = offset.dx - (lastPoint?.dx ?? 0);
      int singleScreenCandleCount =
          bloc.getSingleScreenCandleCount(screenWidth);
      // 当前偏移的个数
      int offsetCount =
          ((offsetX / screenWidth) * singleScreenCandleCount).toInt();
      if (offsetCount == 0) {
        return;
      }
      int firstScreenNum =
          (singleScreenCandleCount * bloc.getFirstScreenScale()).toInt();
      if (bloc.klineTotalList.length > firstScreenNum) {
        // 当前总的偏移个数
        int currentOffsetCount = (bloc.toIndex ?? 0) + offsetCount;
        int totalListLength = bloc.klineTotalList.length;
        currentOffsetCount = min(currentOffsetCount, totalListLength);
        if (currentOffsetCount < firstScreenNum) {
          return;
        }
        int fromIndex = 0;
        // print('fromIndex: $fromIndex');

        // 如果当前偏移的个数 没有达到一屏所展示的个数则从0开始取数据
        if (currentOffsetCount > singleScreenCandleCount) {
          fromIndex = (currentOffsetCount - singleScreenCandleCount);
        }
        lastPoint = offset;
        bloc.resetCurrentKlineList(fromIndex, currentOffsetCount);
        // print('fromIndex: $fromIndex  currentOffsetCount: $currentOffsetCount');
      }
    }

    _scaleUpdate(double scale) {
      if (isHorizontalDrag || isLongPress) {
        return;
      }
      isScale = true;
      if (scale > 1 && (scale - 1) > 0.03) {
        scale = 1.03;
      } else if (scale < 1 && (1 - scale) > 0.03) {
        scale = 0.97;
      }
      double candlestickWidth = scale * (bloc.candlestickWidth ?? 0);
      bloc.setCandlestickWidth(candlestickWidth);
      // print('bloc.candlestickWidth : ${bloc.candlestickWidth}');
      double count = (screenWidth - (bloc.candlestickWidth ?? 0)) /
          (kCandlestickGap + (bloc.candlestickWidth ?? 0));
      int currentScreenCountNum = count.toInt();

      int toIndex = (bloc.toIndex ?? 0);
      int fromIndex = toIndex - currentScreenCountNum;
      fromIndex = max(0, fromIndex);

      // print('from: $fromIndex   to: $toIndex  currentScreenCountNum: $currentScreenCountNum');
      bloc.resetCurrentKlineList(fromIndex, toIndex);
    }

    bloc.klineListStream.listen((listData) {
      if (listData.isNotEmpty) {
        if (bloc.toIndex == null) {
          bloc.setScreenWidth(screenWidth);
        } else {
          bloc.resetCurrentKlineList(bloc.fromIndex ?? 0, bloc.toIndex ?? 0);
        }
      }
    });

    return KlineBlocProvider<KlineBloc>(
      bloc: bloc,
      child: GestureDetector(
        onTap: () {
          if (isLongPress) {
            _hiddenCrossWidget();
          }
        },
        /// 长按
        onLongPressStart: (longPressDragStartDetail) {
          _showCrossWidget(longPressDragStartDetail.globalPosition);
          // print('onLongPressDragStart');
        },
        onLongPressMoveUpdate: (longPressDragUpdateDetail) {
          _showCrossWidget(longPressDragUpdateDetail.globalPosition);
          // print('onLongPressDragUpdate');
        },

        /// 水平拖拽
        onHorizontalDragDown: (horizontalDragDown) {
          if (isLongPress) {
            _hiddenCrossWidget();
          }
          lastPoint = horizontalDragDown.globalPosition;
        },
        onHorizontalDragUpdate: (details) {
          _horizontalDrag(details.globalPosition);
        },
        onHorizontalDragEnd: (_) {
          isHorizontalDrag = false;
        },
        onHorizontalDragCancel: () {
          isHorizontalDrag = false;
        },
        onScaleStart: (_) {
          isScale = true;
        },

        /// 缩放
        onScaleUpdate: (details) {
          if (isLongPress) {
            _hiddenCrossWidget();
          }
          _scaleUpdate(details.scale);
        },
        onScaleEnd: (_) {
          isScale = false;
        },
        child: KlineWidget(),
        // child: StreamBuilder(
        //   stream: bloc.klineListStream,
        //   builder:
        //       (BuildContext context, AsyncSnapshot<List<Market>> snapshot) {
        //     List<Market>? listData = snapshot.data;
        //     if (listData != null) {
        //       bloc.setScreenWidth(screenWidth);
        //     }
        //     return KlineWidget();
        //   },
        // ),
      ),
    );
  }
}
