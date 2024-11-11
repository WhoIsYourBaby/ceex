import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

authenticationChoosePicType({
  required BuildContext context,
}) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        final appTheme = context.watch<AppconfCubit>().state.appTheme;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: appTheme.colorSet.textWhite),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context, 1);
                      },
                      child: Container(
                          color: appTheme.colorSet.textWhite,
                          alignment: Alignment.center,
                          height: 45,
                          child: Text(
                            "拍照",
                            style: appTheme.colorSet.textBlack.style(),
                          ))),
                  Container(
                    color: appTheme.colorSet.textGrey2,
                    height: 1,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context, 2);
                      },
                      child: Container(
                          color: appTheme.colorSet.textWhite,
                          alignment: Alignment.center,
                          height: 45,
                          child: Text(
                            "相册",
                            style: appTheme.colorSet.textBlack.style(),
                          )))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: appTheme.colorSet.textWhite),
                    height: 45,
                    child: Text(
                      "取消",
                      style: appTheme.colorSet.textBlack.style(),
                    ))),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      });
}

documentTypeChoosePicType({
  required BuildContext context,
}) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        final appTheme = context.watch<AppconfCubit>().state.appTheme;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: appTheme.colorSet.textWhite),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context, 1);
                      },
                      child: Container(
                          color: appTheme.colorSet.textWhite,
                          alignment: Alignment.center,
                          height: 45,
                          child: Text(
                            "身份证",
                            style: appTheme.colorSet.textBlack.style(),
                          ))),
                  Container(
                    color: appTheme.colorSet.textGrey2,
                    height: 1,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context, 2);
                      },
                      child: Container(
                          color: appTheme.colorSet.textWhite,
                          alignment: Alignment.center,
                          height: 45,
                          child: Text(
                            "驾照",
                            style: appTheme.colorSet.textBlack.style(),
                          ))),
                  Container(
                    color: appTheme.colorSet.textGrey2,
                    height: 1,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context, 3);
                      },
                      child: Container(
                          color: appTheme.colorSet.textWhite,
                          alignment: Alignment.center,
                          height: 45,
                          child: Text(
                            "护照",
                            style: appTheme.colorSet.textBlack.style(),
                          ))),
                  Container(
                    color: appTheme.colorSet.textGrey2,
                    height: 1,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context, 5);
                      },
                      child: Container(
                          color: appTheme.colorSet.textWhite,
                          alignment: Alignment.center,
                          height: 45,
                          child: Text(
                            "其他",
                            style: appTheme.colorSet.textBlack.style(),
                          )))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: appTheme.colorSet.textWhite),
                    height: 45,
                    child: Text(
                      "取消",
                      style: appTheme.colorSet.textBlack.style(),
                    ))),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      });
}
