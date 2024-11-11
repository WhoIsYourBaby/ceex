import 'dart:async';

import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/views/root_tabbar.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static Route route() =>
      MaterialPageRoute(builder: (context) => const SplashView());

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.endOfFrame.then((value) {
      Timer(Duration(milliseconds: 2100), () {
        Navigator.pushAndRemoveUntil(context, RootTabBar.route(), (route) => false);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: Image.asset(
          R.ASSETS_IMAGES_SPLASH_GIF,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
