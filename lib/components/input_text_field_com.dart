import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/input_text_field/input_text_field_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 各种输入框
class InputTextFieldCom {
  AppTheme appTheme;
  BuildContext buildContext;
  InputTextFieldCubit cubit;
  InputTextFieldCom(
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
    return BlocBuilder<InputTextFieldCubit, InputTextFieldState>(
        bloc: cubit,
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            margin: const EdgeInsets.only(top: 12, bottom: 12),
            height: 44,
            decoration: BoxDecoration(
                color: appTheme.colorSet.colorLight,
                border: Border.all(
                    color: focusNode.hasFocus
                        ? appTheme.colorSet.colorDark
                        : appTheme.colorSet.colorLight),
                borderRadius: BorderRadius.circular(4)),
            alignment: Alignment.center,
            child: Row(
              children: [
                leftChild,
                Expanded(
                  child: TextField(
                    onTap: () => buildContext
                        .read<InputTextFieldCubit>()
                        .focusChanged(true),
                    controller: textEditingController,
                    onChanged: (value) {
                    },
                    onEditingComplete: () => buildContext
                        .read<InputTextFieldCubit>()
                        .focusChanged(false),
                    focusNode: focusNode,
                    scrollPadding: EdgeInsets.zero,
                    enableInteractiveSelection: true,
                    obscureText:
                        isPassowrd && !(cubit.state.showPassword ?? false),
                    style: appTheme.colorSet.textBlack.style(),
                    keyboardType: isPassowrd ? TextInputType.visiblePassword : TextInputType.text,
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
        });
  }
}
