import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrimaryButton extends StatelessWidget {
  final Size size;

  /// 默认是黑色，可自定义背景颜色
  final Color? bkgColor;
  final VoidCallback onTap;
  final Widget child;
  const PrimaryButton({
    required this.size,
    required this.onTap,
    this.bkgColor,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.read<AppconfCubit>().state.appTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: size.width,
          maxHeight: size.height,
        ),
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bkgColor ?? appTheme.colorSet.colorDark,
          borderRadius: BorderRadius.circular(size.height / 2),
        ),
        child: child,
      ),
    );
  }
}
