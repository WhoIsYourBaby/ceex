import 'package:flutter/material.dart';

class EChartPieBean {
  dynamic id;
  String title;
  double number;
  Color color;
  bool isClick;

  EChartPieBean(
      {this.id,
      this.title = '',
      this.number = 100,
      this.color = Colors.blue,
      this.isClick = false});
}
