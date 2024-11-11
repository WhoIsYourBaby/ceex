import 'package:flutter/widgets.dart';
// 触摸收起键盘
// ignore: non_constant_identifier_names
GestureDetector TouchUpKeyboard({
  required Widget child,
  required BuildContext context,
}){
return GestureDetector(
  child: child,
  behavior: HitTestBehavior.translucent,
  onTap: () {FocusScope.of(context).requestFocus(FocusNode());},
);
}