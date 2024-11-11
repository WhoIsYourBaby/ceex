import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  static Route route() =>
      MaterialPageRoute(builder: (context) => const WebViewPage());

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController controller;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Initialize the controller in didChangeDependencies
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'recaptcha',
        onMessageReceived: (message) {
          // Handle the token and navigate back
          String token = message.message;
          handleToken(context, token);
        },
      )
      ..setOnConsoleMessage((message) {
        String i = message.message;
        if (i.length>100) {
          handleToken(context, message.message);
        }
      })
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
          },
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(
          'https://static.ceex.com/static/google_recaptcha_v3.html?siteKey=6LeSoDwpAAAAAE2n_QgXO8XF9G8nVUqlU7K4FUT9'));
  }

  void handleToken(BuildContext context, String token) {
    // 返回上一个页面并将token传递给它
    Navigator.of(context).pop(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(""),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
