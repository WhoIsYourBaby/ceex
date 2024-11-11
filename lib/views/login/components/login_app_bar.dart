import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/views/login/sign_in_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';

class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String type;
  final bool needLoginSign;
  const LoginAppBar({
    required this.type,
    this.needLoginSign = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return SafeArea(
        top: true,
        bottom: true,
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset(R.ASSETS_IMAGES_WIDGET_BACK_LEFT_PNG),
                ),
              ),
              needLoginSign ? GestureDetector(
                      onTap: () {
                        if (type == AppLocalizations.of(context)!.loginViewTitle) {
                          Navigator.pop(context);
                        } else {
                          Navigator.push(context, SignInViewPage.route());
                        }
                      },
                      child: Text(
                        type,
                        style: appTheme.colorSet.colorPrimary.style(fontSize: 16, fontWeight: FontWeight.w600),
                      ))
                  : const SizedBox(),
            ],
          ),
        ));
  }

  @override
  Size get preferredSize => Size(100, 800);
}
