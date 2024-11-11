import 'package:ceex_flutter/components/app_bar_center_text.dart';
import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ArgeementViewLoadType {
  privacyZh,
  privacyEn,
  argemrntZh,
  argemrntEn,
}

class ArgeementView extends StatefulWidget {
  final ArgeementViewLoadType argeementViewLoadType;
  final String title;
  const ArgeementView({required this.argeementViewLoadType, required this.title,super.key});
  static Route route(ArgeementViewLoadType argeementViewLoadType,{required String title}) =>
      MaterialPageRoute(
          builder: (context) =>
              ArgeementView(argeementViewLoadType: argeementViewLoadType,title: title));

  @override
  State<ArgeementView> createState() => _ArgeementViewState();
}

class _ArgeementViewState extends State<ArgeementView> {
  late AppTheme appTheme;
  String _privacyPolicy = '加载中...';

  @override
  void initState() {
    super.initState();
    switch (widget.argeementViewLoadType) {
      case ArgeementViewLoadType.privacyZh:
        _loadZhPrivacyPolicy();
        break;
      case ArgeementViewLoadType.privacyEn:
        _loadEnPrivacyPolicy();
        break;
      case ArgeementViewLoadType.argemrntZh:
        _loadZhArgemrnt();
        break;
      case ArgeementViewLoadType.argemrntEn:
        _loadEnArgemrnt();
        break;
      default:
    }
  }

  // 中文隐私政策
  Future<void> _loadZhPrivacyPolicy() async {
    try {
      const String path = 'assets/argeement/privacy_policy_zh.txt';
      final String content = await rootBundle.loadString(path);
      setState(() {
        _privacyPolicy = content;
      });
    } catch (e) {
      setState(() {
        _privacyPolicy = '加载失败';
      });
    }
  }

  // 英文隐私政策
  Future<void> _loadEnPrivacyPolicy() async {
    try {
      const String path = 'assets/argeement/privacy_policy_en.txt';
      final String content = await rootBundle.loadString(path);
      setState(() {
        _privacyPolicy = content;
      });
    } catch (e) {
      setState(() {
        _privacyPolicy = 'load File';
      });
    }
  }

  // 中文用户协议
  Future<void> _loadZhArgemrnt() async {
    try {
      const String path = 'assets/argeement/argeement_zh.txt';
      final String content = await rootBundle.loadString(path);
      setState(() {
        _privacyPolicy = content;
      });
    } catch (e) {
      setState(() {
        _privacyPolicy = '加载失败';
      });
    }
  }

  // 英文用户协议
  Future<void> _loadEnArgemrnt() async {
    try {
      const String path = 'assets/argeement/argeement_en.txt';
      final String content = await rootBundle.loadString(path);
      setState(() {
        _privacyPolicy = content;
      });
    } catch (e) {
      setState(() {
        _privacyPolicy = 'load File';
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appTheme = context.watch<AppconfCubit>().state.appTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.colorSet.textWhite,
      appBar: AppBarWrapper(
        statusBarColor: appTheme.colorSet.colorWhite,
        child: AppBarCenterText(
          title: widget.title,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          _privacyPolicy,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
