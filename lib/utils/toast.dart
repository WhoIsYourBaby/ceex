import 'dart:math';

import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

/// 显示加载动画
/// dismissAllToast()来隐藏
showLoading({
  Duration? duration,
  bool? dismissOtherOnShow,
}) {
  showToastWidget(
    Container(
      width: 120,
      height: 120,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: const Color(0xDD000000),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CircularProgressIndicator(),
    ),
    duration: duration ?? Duration(seconds: 120),
    dismissOtherToast: dismissOtherOnShow,
  );
}

/// 显示文字提示时长:min(msg.length * 100, 3500)
showMsg(String msg, {bool? dismissOtherOnShow}) {
  showToastWidget(
    Container(
      constraints: const BoxConstraints(
        minWidth: 120,
        maxWidth: 280,
        minHeight: 30,
        maxHeight: 120,
      ),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xDD000000),
        borderRadius: BorderRadius.circular(8),
      ),
      // alignment: Alignment.center,
      child: Text(
        msg,
        maxLines: 3,
        style: TextStyle(color: Colors.white, fontSize: 16),
        textAlign: TextAlign.center,
      ),
    ),
    duration: Duration(milliseconds: max(min(msg.length * 100, 3500), 2000)),
    dismissOtherToast: dismissOtherOnShow,
  );
}

/// 重试弹窗
void showRetryAlert(BuildContext context, String msg, [VoidCallback? onRetry]) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(
          msg,
          style: context
              .read<AppconfCubit>()
              .state
              .appTheme
              .colorSet
              .textBlack
              .style(
                fontSize: 18,
              ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (onRetry != null) {
                onRetry();
              }
              Navigator.pop(context);
            },
            child: Text("重试"),
          ),
        ],
      );
    },
  );
}

Future<String?> showInputAlert(
  BuildContext context,
  String title,
) {
  final controller = TextEditingController();
  final focus = FocusNode()..requestFocus();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title,
          style: context
              .read<AppconfCubit>()
              .state
              .appTheme
              .colorSet
              .textBlack
              .style(fontSize: 18),
        ),
        content: TextField(
          controller: controller,
          focusNode: focus,
          decoration: InputDecoration(
              // border: InputBorder.none,
              ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, null);
            },
            child: Text("取消"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, controller.text);
            },
            child: Text("确定"),
          ),
        ],
      );
    },
  );
}
