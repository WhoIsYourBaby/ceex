import 'package:ceex_flutter/components/primary_button.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';

class HomeWelcomeSliver extends StatelessWidget {
  final VoidCallback onLoginTap;
  const HomeWelcomeSliver({
    required this.onLoginTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.read<AppconfCubit>().state.appTheme;
    final size = MediaQuery.of(context).size;
    final bgSize = scaleSizeFromWidth(Size(345, 231), size.width - 15 * 2);
    final picSize = scaleSizeFromWidth(Size(166, 151), size.width - 206);
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      height: bgSize.height + 22,
      width: bgSize.width,
      // 345*231
      child: Stack(
        children: [
          Image.asset(
            R.ASSETS_IMAGES_BG_PNG,
            fit: BoxFit.fitWidth,
            width: bgSize.width,
            height: bgSize.height,
          ),
          Positioned(
            right: 12,
            top: (bgSize.height - picSize.height) / 2,
            child: Image.asset(
              R.ASSETS_IMAGES_PIC_PNG,
              width: picSize.width,
              height: picSize.height,
            ),
          ),
          // 登录注册按钮
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButton(
                  size: Size(280, 44),
                  onTap: onLoginTap,
                  child: Text(
                    AppLocalizations.of(context)!.homeLoginReg,
                    style: appTheme.colorSet.textWhite.style(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          // 欢迎来到
          Positioned(
            left: 20,
            top: 68,
            child: Text(
              AppLocalizations.of(context)!.homeWelcome,
              style: appTheme.colorSet.textBlack.style(fontSize: 26, fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            left: 20,
            top: 106,
            child: Text(
              AppLocalizations.of(context)!.homeWelcomeCEEX,
              style: appTheme.colorSet.textBlack.style(fontSize: 28, fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            left: 22,
            top: 146,
            child: Text(
              // AppLocalizations.of(context)!.homeWelcomeCEEX,
              "让交易更简单",
              style: appTheme.colorSet.textGrey.style(),
            ),
          ),
        ],
      ),
    );
  }
}
