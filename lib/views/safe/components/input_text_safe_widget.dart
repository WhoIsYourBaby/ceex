import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/safe/safe_ver_view_cubit.dart';
import 'package:ceex_flutter/model/publish/countries_model.dart';
import 'package:ceex_flutter/views/login/area_choose.dart';
import 'package:flutter/material.dart';

class InputTextSafeWidget {
  AppTheme appTheme;
  BuildContext buildContext;
  SafeVerViewCubit cubit;
  InputTextSafeWidget(
      {required this.buildContext,
      required this.appTheme,
      required this.cubit});

  /// 输入框
  Widget inputTextField(
    TextEditingController textEditingController,
    FocusNode focusNode, {
    String hintText = "",
    Widget leftChild = const SizedBox(),
    Widget rightChild = const SizedBox(),
    bool isPassowrd = false,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      margin: const EdgeInsets.only(left: 15, right: 15),
      height: 44,
      decoration: BoxDecoration(
          color: appTheme.colorSet.colorLight,
          borderRadius: BorderRadius.circular(4)),
      alignment: Alignment.center,
      child: Row(
        children: [
          leftChild,
          Expanded(
            child: TextField(
              onTap: () => cubit.focusChanged(true),
              controller: textEditingController,
              onChanged: (value) {},
              onEditingComplete: () => cubit.focusChanged(false),
              focusNode: focusNode,
              scrollPadding: EdgeInsets.zero,
              enableInteractiveSelection: true,
              obscureText: isPassowrd && !(cubit.state.showPassword ?? false),
              style: appTheme.colorSet.textBlack.style(),
              decoration: InputDecoration(
                  hintText: hintText,
                  isDense: true,
                  hintStyle: appTheme.colorSet.textGrey2.style(),
                  border: InputBorder.none),
            ),
          ),
          rightChild
        ],
      ),
    );
  }

  /// 发送验证码
  // Widget emailSendVer(
  //     {required String text,
  //     String account = "",
  //     required VoidCallback? sendVer}) {
  //   return GestureDetector(
  //     onTap: sendVer,
  //     child: Container(
  //         height: 44,
  //         padding: EdgeInsets.only(left: 10, right: 10),
  //         alignment: Alignment.center,
  //         child: Text(
  //           cubit.state.isVerSent ?? false ? "${cubit.state.countdown}s" : text,
  //           style: appTheme.colorSet.colorDark.style(fontSize: 16, fontWeight: FontWeight.w600),
  //         )),
  //   );
  // }

  /// 区号选择
  Widget areaCodeChoose() {
    return GestureDetector(
      onTap: () async {
        var result = await Navigator.push(buildContext, AreaChoose.route());
        if (result != null) {
          CountriesModel countriesModel = result as CountriesModel;
          cubit.upDataAreaCode(countriesModel.nationalCode!);
        }
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
            border: Border(
          right: BorderSide(width: 1, color: appTheme.colorSet.textGrey2),
        )),
        height: 24,
        child: Row(
          children: [
            Text(
              "+${cubit.state.areaCode!}",
              style: appTheme.colorSet.textBlack.style(fontSize: 16),
            ),
            SizedBox(
              width: 6,
            ),
            Image.asset(
              R.ASSETS_IMAGES_AREA_CODE_CHOOSE_PNG,
              width: 16,
              height: 16,
            ),
            SizedBox(
              width: 12,
            ),
          ],
        ),
      ),
    );
  }

  /// 登录注册按钮
  Widget loginSignButton({required String text, required VoidCallback? onTap}) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              color: appTheme.colorSet.colorDark),
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 14, bottom: 14),
          child: Text(
            text,
            style: appTheme.colorSet.textBlack
                .style(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ));
  }
}
