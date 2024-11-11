import 'package:ceex_flutter/components/icon_widget.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// 点击搜索的样式
/// 看起来像是输入框
/// 其实是一个按钮，点击跳转到专门搜索页面
class SearchStyleButton extends StatelessWidget {
  final VoidCallback onTap;
  const SearchStyleButton({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: appTheme.colorSet.colorLight,
        ),
        height: 32,
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "BTC/USDT",
              style: appTheme.colorSet.textGrey.style(),
            ),
            IconWidget(
              icon: Image.asset(R.ASSETS_IMAGES_SEARCH_LINE_PNG),
              size: const Size(16, 16),
            ),
          ],
        ),
      ),
    );
  }
}
