import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// 包含左右title部分
class FocusSection extends StatelessWidget {
  final Size cellSize;
  final Widget? leading;
  final Widget? trailing;
  final Widget? titleLeft;
  final Widget? titleRight;
  final Widget? bottom;
  final VoidCallback? onTap;
  const FocusSection({
    required this.cellSize,
    this.titleLeft,
    this.titleRight,
    this.leading,
    this.trailing,
    this.bottom,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              titleLeft ?? const SizedBox(),
              Spacer(),
              titleRight ?? const SizedBox(),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          FocusCell(
            onTap: onTap,
            size: cellSize,
            leading: leading ?? const SizedBox(),
            trailing: trailing ?? const SizedBox(),
          ),
          bottom ?? const SizedBox(),
        ],
      ),
    );
  }
}

/// 资产中那些灰底圆角cell，包含左右内容区
class FocusCell extends StatelessWidget {
  final Size size;
  final Widget leading;
  final Widget trailing;
  final VoidCallback? onTap;
  const FocusCell({
    required this.size,
    required this.leading,
    required this.trailing,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 12, right: 12),
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: appTheme.colorSet.colorLight,
        ),
        child: Row(
          children: [
            leading,
            Spacer(),
            trailing,
          ],
        ),
      ),
    );
  }
}
