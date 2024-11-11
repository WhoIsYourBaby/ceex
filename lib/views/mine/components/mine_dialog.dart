import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/model/invitation/invitation_temp_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// 更改语言
changeLanguage({
  required BuildContext context,
}) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.white),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const SizedBox(
                height: 15,
              ),
              MaterialButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await context
                      .read<AppconfCubit>()
                      .updateLocale(const Locale("zh"));
                },
                child: const Text("中文"),
              ),
              MaterialButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await context
                      .read<AppconfCubit>()
                      .updateLocale(const Locale("en"));
                },
                child: const Text("English"),
              ),
              const SizedBox(
                height: 15,
              ),
            ]));
      });
}

/// 海报分享
shareTemp(BuildContext context, InvitationTempModel invitationTempModel) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        final screenSize = MediaQuery.of(context).size;
        final mediaQuery = MediaQuery.of(context);
        final appTheme = context.watch<AppconfCubit>().state.appTheme;
        return SafeArea(
            child: Column(children: [
          SizedBox(
            height: 15,
          ),
          Container(
              height: screenSize.height - 215 - mediaQuery.viewPadding.bottom,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (invitationTempModel.posterUrls ?? []).length,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) => Container(
                        width: screenSize.width - 32,
                        margin: const EdgeInsets.only(right: 8, left: 8),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.network(
                                invitationTempModel.posterUrls?[index] ?? ""),
                          ],
                        ),
                      )))),
          const SizedBox(
            height: 100,
          ),
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: appTheme.colorSet.textWhite,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          color: appTheme.colorSet.textWhite,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text(
                            "取消",
                          ),
                        ))),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: mediaQuery.viewPadding.bottom,
          )
        ]));
      });
}
