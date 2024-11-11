import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:flutter/material.dart';

class SafeInputTextWidget {
  AppTheme appTheme;
  BuildContext buildContext;
  SafeInputTextWidget({required this.buildContext, required this.appTheme});

  /// 输入框
  Widget inputTextField(
    TextEditingController textEditingController,
    FocusNode focusNode, {
    String hintText = "",
    Widget leftChild = const SizedBox(),
    Widget rightChild = const SizedBox(),
    bool isPassowrd = false,
    bool showPassword = false,
    bool enable = true,
    Function(String)? onChanged,
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
              controller: textEditingController,
              enabled: enable,
              onChanged: onChanged,
              obscureText: isPassowrd && !showPassword,
              focusNode: focusNode,
              scrollPadding: EdgeInsets.zero,
              enableInteractiveSelection: true,
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
  Widget emailSendVer(
      {required String text,
      String account = "",
      required VoidCallback sendVer}) {
    return GestureDetector(
      onTap: sendVer,
      child: Container(
          height: 44,
          padding: const EdgeInsets.only(left: 10, right: 10),
          alignment: Alignment.center,
          child: Text(text, style: appTheme.colorSet.colorPrimary.style())),
    );
  }

    /// 发送验证码
  Widget pasteGoogleVer(
      {required VoidCallback paste}) {
    return GestureDetector(
      onTap: paste,
      child: Container(
          height: 44,
          padding: const EdgeInsets.only(left: 10, right: 10),
          alignment: Alignment.center,
          child: Text("粘贴", style: appTheme.colorSet.colorPrimary.style())),
    );
  }

  /// 区号选择
  Widget areaCodeChoose({
    required VoidCallback areaChoose,
    required String areaCode,
  }) {
    return GestureDetector(
      onTap: areaChoose,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
            border: Border(
          right: BorderSide(width: 1, color: appTheme.colorSet.textGrey2),
        )),
        height: 24,
        child: Row(
          children: [
            Text(
              "+$areaCode",
              style: appTheme.colorSet.textBlack.style(fontSize: 16),
            ),
            const SizedBox(
              width: 6,
            ),
            Image.asset(
              R.ASSETS_IMAGES_AREA_CODE_CHOOSE_PNG,
              width: 16,
              height: 16,
            ),
            const SizedBox(
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
            style: appTheme.colorSet.textWhite
                .style(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ));
  }

  /// 密码小眼睛
  Widget passwordEyesOpen(
      {required VoidCallback onTap, required bool showPassword}) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 44,
        width: 44,
        child: Image.asset(
          showPassword
              ? R.ASSETS_IMAGES_EYE_OPEN_LINE_PNG
              : R.ASSETS_IMAGES_EYE_CLOSE_LINE_PNG,
          height: 16,
          width: 16,
        ),
      ),
    );
  }
}
