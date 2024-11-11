import 'package:flutter/material.dart';

enum ColorDirection {
  leftToRight,
  rightToLeft,
}

class OrderStatusCell extends StatelessWidget {
  final Color color;

  /// 0: toRight, 1: toLeft
  final ColorDirection direction;

  /// 百分比1~100
  final int percent;
  final Widget left;
  final Widget right;
  final int _percentMax = 100;
  const OrderStatusCell({
    required this.color,
    required this.direction,
    required this.percent,
    required this.left,
    required this.right,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: direction == ColorDirection.leftToRight
              // 颜色从左开始
              ? Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        color: color,
                      ),
                      flex: percent,
                    ),
                    Expanded(
                      child: Container(height: double.infinity,),
                      flex: _percentMax - percent,
                    ),
                  ],
                )
              :
              // 从右开始
              Row(
                  children: [
                    Expanded(
                      child: Container(height: double.infinity,),
                      flex: _percentMax - percent,
                    ),
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        color: color,
                      ),
                      flex: percent,
                    ),
                  ],
                ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            left,
            Spacer(),
            right,
          ],
        ),
      ],
    );
  }
}
