import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class KlineWavePainter extends CustomPainter {
  final List<num>? numbers;
  Paint _painter = Paint()
    ..color = Color(0xFF18B49F)
    ..style = PaintingStyle.stroke
    // ..strokeCap = StrokeCap.round
    ..strokeWidth = 1;
  KlineWavePainter(this.numbers);

  @override
  void paint(Canvas canvas, Size size) {
    if (numbers == null) {
      canvas.drawLine(
        Offset(0, size.height / 2),
        Offset(size.width, size.height / 2),
        _painter,
      );
      return;
    }
    num maxValue = 0;
    num minValue = 999999999;
    numbers!.forEach((element) {
      maxValue = max(maxValue, element);
      minValue = min(minValue, element);
    });
    final maxToMin = maxValue - minValue;
    final stepX = size.width / numbers!.length;
    final stepY = size.height / maxToMin;
    Path path = Path();
    // List<Offset> points = [];
    for (var i = 0; i < numbers!.length; i++) {
      final dx = i * stepX;
      final dy = size.height - (numbers![i] - minValue) * stepY;
      // points.add(Offset(dx, dy));
      if (i == 0) {
        path.moveTo(dx, dy);
      } else {
        path.lineTo(dx, dy);
      }
    }
    // path.lineTo(size.width, 0);
    // path.lineTo(0, 0);

    canvas.drawPath(path, _painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return numbers != (oldDelegate as KlineWavePainter).numbers;
  }
}
