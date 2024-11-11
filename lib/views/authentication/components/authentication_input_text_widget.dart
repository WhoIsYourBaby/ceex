import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:flutter/material.dart';

class AuthenticationInputTextWidget {
  AppTheme appTheme;
  BuildContext buildContext;
  AuthenticationInputTextWidget({required this.buildContext, required this.appTheme});

  /// 输入框
  Widget inputTextField(
    TextEditingController textEditingController,
    FocusNode focusNode, {
    String hintText = "",
    bool isPassowrd = false,
    bool showPassword = false,
    bool enable = true,
    bool showRight = false,
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
          showRight ? Image.asset(R.ASSETS_IMAGES_RIGHT_SMALL_LINE_PNG) : SizedBox()
        ],
      ),
    );
  }
}
