import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmptyWidget extends StatelessWidget {
  String? title;
  VoidCallback? onTap;
  EmptyWidget({
    this.title,
    this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    Widget wgt = Column(
      children: [
        Image.asset(
          R.ASSETS_IMAGES_NO_RECORD_PNG,
          width: 60,
          height: 60,
        ),
        SizedBox(height: 8,),
        Text(
          title ?? "暂无记录",
          style: context
              .read<AppconfCubit>()
              .state
              .appTheme
              .colorSet
              .textGrey
              .style(),
        ),
      ],
    );
    if (onTap != null) {
      wgt = GestureDetector(
        onTap: onTap,
        child: wgt,
      );
    }
    return wgt;
  }
}
