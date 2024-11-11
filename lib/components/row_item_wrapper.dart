import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// 横向超出最大宽度可滑动的一排按钮
class RowItemWrapper extends StatelessWidget {
  final Size size;
  /// 超过scrollLimit才会开启滚动
  final int scrollLimit;
  final List<Widget> items;
  const RowItemWrapper({
    required this.size,
    required this.scrollLimit,
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      child: items.length > scrollLimit
          ? ListView(
              itemExtent: 75,
              scrollDirection: Axis.horizontal,
              children: items,
            )
          : Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: items,
            ),
    );
  }
}

class RowItem extends StatelessWidget {
  final Image image;
  final String title;
  final VoidCallback onTap;
  const RowItem({
    required this.image,
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.read<AppconfCubit>().state.appTheme;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: appTheme.colorSet.colorLight,
                width: 1.0,
              ),
            ),
            alignment: Alignment.center,
            child: image,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            title,
            style: appTheme.colorSet.textBlack.style(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
