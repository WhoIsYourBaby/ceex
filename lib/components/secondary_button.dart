import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondaryButton extends StatelessWidget {
  final Size size;

  /// 默认是黑色，可自定义背景颜色
  final Color? borderColor;
  final VoidCallback onTap;
  final Widget child;
  const SecondaryButton({
    required this.size,
    required this.onTap,
    this.borderColor,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.read<AppconfCubit>().state.appTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: appTheme.colorSet.colorWhite,
          borderRadius: BorderRadius.circular(size.height / 2),
          border: Border.all(
            color: borderColor ?? appTheme.colorSet.textGrey3,
          ),
        ),
        child: child,
      ),
    );
  }
}
