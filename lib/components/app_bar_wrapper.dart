import 'package:flutter/material.dart';

class AppBarWrapper extends StatelessWidget implements PreferredSizeWidget {
  final Widget child; //从外部指定内容
  final Color statusBarColor; //设置statusbar的颜色
  final double height;

  AppBarWrapper({
    required this.statusBarColor,
    this.height = kToolbarHeight,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final navHeight = height + MediaQuery.of(context).padding.top;
    return Container(
      height: navHeight, //自动设置为系统appbar高度
      width: MediaQuery.of(context).size.width,
      color: statusBarColor,
      child: SafeArea(
        top: true,
        bottom: false,
        child: child,
      ),
    );
  }
}
