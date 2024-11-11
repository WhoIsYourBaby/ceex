import 'dart:math';

import 'package:ceex_flutter/components/order_status_cell.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/kline/kline_diffdepth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 深度图小数位数
enum KlineDigitCount {
  zero,
  one,
  two,
}

extension KlineDigitCountExt on KlineDigitCount {
  String get title {
    switch (this) {
      case KlineDigitCount.zero:
        return "个位数";
      case KlineDigitCount.one:
        return "1位小数";
      case KlineDigitCount.two:
        return "2位小数";
    }
  }

  int get digit {
    switch (this) {
      case KlineDigitCount.zero:
        return 0;
      case KlineDigitCount.one:
        return 1;
      case KlineDigitCount.two:
        return 2;
    }
  }
}

class KlineOrderView extends StatefulWidget {
  const KlineOrderView({super.key});

  @override
  State<KlineOrderView> createState() => _KlineOrderViewState();
}

class _KlineOrderViewState extends State<KlineOrderView> {
  KlineDigitCount digitCount = KlineDigitCount.two;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((sp) {
      final value = sp.getInt(digitCount.runtimeType.toString());
      setState(() {
        digitCount =
            value == null ? KlineDigitCount.two : KlineDigitCount.values[value];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return BlocBuilder<KlineDiffDepthCubit, KlineDiffDepthState>(
      builder: (context, state) {
        return ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            _buildTitleCell(context, appTheme),
            ...depthCells(state),
          ],
        );
      },
    );
  }

  List<Widget> depthCells(KlineDiffDepthState state) {
    final aList = state.a ?? [];
    final bList = state.b ?? [];
    final cellList = <Widget>[];
    final maxLength = max(aList.length, bList.length);
    for (var i = 0; i < maxLength; i++) {
      final List<String>? a = i < aList.length ? aList[i] : null;
      final List<String>? b = i < bList.length ? bList[i] : null;
      final percentA = a == null
          ? 0
          : ((double.tryParse(a[1]) ?? 0.0) / (state.aMax ?? 1) * 100).toInt();
      final percentB = b == null
          ? 0
          : ((double.tryParse(b[1]) ?? 0.0) / (state.bMax ?? 1) * 100).toInt();
      final cell = KlineOrderViewCell(
        a: a,
        percentA: percentA,
        b: b,
        percentB: percentB,
        digitCount: digitCount,
      );
      cellList.add(cell);
    }
    return cellList;
  }

  Widget _buildTitleCell(BuildContext context, AppTheme appTheme) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: Text(
              "买入",
              style: appTheme.colorSet.textGrey.style(),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              "卖出",
              style: appTheme.colorSet.textGrey.style(),
            ),
          ),
          Expanded(
            flex: 5,
            child: DropdownButton(
              style: appTheme.colorSet.textBlack.style(),
              value: digitCount,
              items: [
                DropdownMenuItem<KlineDigitCount>(
                  child: Text(
                    KlineDigitCount.zero.title,
                    style: appTheme.colorSet.textBlack.style(),
                  ),
                  value: KlineDigitCount.zero,
                ),
                DropdownMenuItem<KlineDigitCount>(
                  child: Text(
                    KlineDigitCount.one.title,
                    style: appTheme.colorSet.textBlack.style(),
                  ),
                  value: KlineDigitCount.one,
                ),
                DropdownMenuItem<KlineDigitCount>(
                  child: Text(
                    KlineDigitCount.two.title,
                    style: appTheme.colorSet.textBlack.style(),
                  ),
                  value: KlineDigitCount.two,
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    digitCount = value;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class KlineOrderViewCell extends StatelessWidget {
  final List<String>? a;
  final int? percentA;
  final List<String>? b;
  final int? percentB;
  final KlineDigitCount digitCount;
  const KlineOrderViewCell({
    this.a,
    this.percentA,
    this.b,
    this.percentB,
    required this.digitCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return SizedBox(
      height: 34,
      child: Row(
        children: [
          Expanded(
            child: OrderStatusCell(
              color: appTheme.colorSet.colorPrimary.withOpacity(0.15),
              direction: ColorDirection.rightToLeft,
              percent: percentB ?? 0,
              left: Text(
                safeNull(b)[1],
                style: appTheme.colorSet.textBlack.style(),
              ),
              right: Text(
                digitConvert(safeNull(b)[0]),
                style: appTheme.colorSet.colorPrimary.style(fontSize: 14),
              ),
            ),
          ),
          Expanded(
            child: OrderStatusCell(
              color: appTheme.colorSet.colorAuxiliary2.withOpacity(0.15),
              direction: ColorDirection.leftToRight,
              percent: percentA ?? 0,
              left: Text(
                digitConvert(safeNull(a)[0]),
                style: appTheme.colorSet.colorAuxiliary2.style(fontSize: 14),
              ),
              right: Text(
                safeNull(a)[1],
                style: appTheme.colorSet.textBlack.style(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> safeNull(List<String>? v) {
    if (v == null) {
      return ["", ""];
    } else {
      return v;
    }
  }

  String digitConvert(String value) {
    if (value == "") {
      return value;
    } else {
      final numValue = num.tryParse(value) ?? 0.0;
      final str = numValue.toStringAsFixed(digitCount.digit);
      return str;
    }
  }
}
