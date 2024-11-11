import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingAppBar extends StatelessWidget {
  final Widget rightChild;
  final String title;
  const SettingAppBar({
    this.rightChild = const SizedBox(),
    required this.title, 
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
            child: Text(
          title,
          style: appTheme.colorSet.textBlack.style(fontSize: 18),
        )),
        Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(R.ASSETS_IMAGES_WIDGET_BACK_LEFT_PNG),
              ),
            ),
            const Expanded(child: SizedBox()),
            rightChild,
            const SizedBox(width: 15,),
          ],
        ),
      ],
    );
  }
}
