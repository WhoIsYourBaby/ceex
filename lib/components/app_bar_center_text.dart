import 'package:ceex_flutter/components/icon_widget.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarCenterText extends StatelessWidget {
  final String title;
  final Widget rigetWidget;
  const AppBarCenterText(
      {required this.title, this.rigetWidget = const SizedBox(), super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
            child: Text(title,
            style: appTheme.colorSet.textBlack.style(fontSize: 18),
        )),
        Padding(padding: EdgeInsets.only(left: 15,right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconWidget(
              icon: Image.asset(
                R.ASSETS_IMAGES_AKAR_ICONS_CHEVRON_LEFT_PNG,
                width: 24,
                height: 24,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            rigetWidget,
          ],
        )),
      ],
    );
  }
}
