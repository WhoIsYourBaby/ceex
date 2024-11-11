import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CommonWebvView extends StatefulWidget {
  final String url;
  String? title;
  CommonWebvView({required this.url, this.title, super.key});

  static Route route(String url, [String? title]) => MaterialPageRoute(
        builder: (context) => CommonWebvView(
          url: url,
          title: title,
        ),
      );

  @override
  State<CommonWebvView> createState() => _CommonWebvViewState();
}

class _CommonWebvViewState extends State<CommonWebvView> {
  late WebViewController _webController = WebViewController();

  @override
  void initState() {
    super.initState();
    _webController.loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.read<AppconfCubit>().state.appTheme;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: appTheme.colorSet.textBlack,
        ),
        title: Text(
          widget.title ?? "",
          style: appTheme.colorSet.textBlack.style(fontSize: 18),
        ),
      ),
      body: WebViewWidget(controller: _webController),
    );
  }
}
