import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

showSafeChangeDialog({
  required BuildContext context,
  required List<String> data,
}) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        final appTheme = context.watch<AppconfCubit>().state.appTheme;
        return Container(
          decoration: BoxDecoration(
              color: appTheme.colorSet.textWhite,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      "请在两种认证方式中选择一种",
                      textAlign: TextAlign.center,
                      style: appTheme.colorSet.textBlack.style(fontSize: 16),
                    ),
                    Positioned(
                        right: 15,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Image.asset(R.ASSETS_IMAGES_CLOSE_LINE_PNG),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: ((context, index) => GestureDetector(
                    onTap: ()=> Navigator.pop(context,data[index]),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            data[index],
                            textAlign: TextAlign.center,
                            style: appTheme.colorSet.textBlack.style(),
                          ),
                        ),
                      ))),
            const SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      });
}
