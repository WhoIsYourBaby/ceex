import 'package:flutter/material.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// primary按钮builder
Widget buildPrimaryButton(
  BuildContext context,
  String text, [
  VoidCallback? onPressed,
]) {
  final ssize = MediaQuery.of(context).size;
  final appconf = context.read<AppconfCubit>();
  final appTheme = appconf.state.appTheme;
  return MaterialButton(
    onPressed: onPressed,
    minWidth: ssize.width * 0.8,
    height: 45,
    color: appTheme.colorSet.colorWhite,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    child: Text(
      text,
      style: TextStyle(
        color: appTheme.colorSet.colorWhite,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
