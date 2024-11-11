import 'package:flutter/material.dart';
/// 全局context
/// 使用：context = RouterContext.navigatorKey.currentState!.overlay!.context;
class RouterContext {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
}