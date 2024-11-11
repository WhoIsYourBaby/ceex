import 'package:ceex_flutter/repository/publish_repository.dart';
import 'package:ceex_flutter/utils/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gt3_flutter_plugin/gt3_flutter_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewDialog extends StatefulWidget {
  const WebViewDialog({super.key});

  @override
  State<WebViewDialog> createState() => _WebViewDialogState();
}

class _WebViewDialogState extends State<WebViewDialog> {
  WebViewController? controller;
  Gt3FlutterPlugin? captcha;
  Gt3CaptchaConfig config = Gt3CaptchaConfig();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (kVerifyType == 1) {
      initGoogleVer();
    } else if (kVerifyType == 2) {
      getChallenge();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    captcha?.close();
  }

  // 谷歌验证
  initGoogleVer() {
    // Initialize the controller in didChangeDependencies
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      // ..setNavigationDelegate(NavigationDecisionPolicy())
      ..setNavigationDelegate(NavigationDelegate(
          onProgress: (e) {},
          onNavigationRequest: (NavigationRequest request) {
            // Allow loading HTTP resources
            if (request.url.startsWith('http://')) {
              return NavigationDecision.navigate;
            }
            // Block loading HTTPS resources
            else if (request.url.startsWith('https://')) {
              return NavigationDecision.prevent;
            }
            // Allow all other requests
            return NavigationDecision.navigate;
          }))
      ..addJavaScriptChannel(
        'recaptcha',
        onMessageReceived: (message) {
          // Handle the token and navigate back
          String token = message.message;
          handleToken(context, token);
        },
      )
      ..setOnConsoleMessage((message) {
        print(message.message);
        String i = message.message;
        if (i.length > 100) {
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
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(kRecaptchaUrl));
  }

  // 极验滑块验证

  void getChallenge() {
    captcha = Gt3FlutterPlugin(config);
    final repo = GetIt.I.get<PublishRepository>();
    final formData = FormData.fromMap({
      "captcha_id": kGt3Gt,
    });
    final resp = repo.geev3Register(formData);
    resp.then((value) {
      initGt3(Gt3RegisterData(
          gt: kGt3Gt, challenge: value.data.challenge, success: false));
    });
  }

  void initGt3(Gt3RegisterData gt3registerData) async {
    captcha?.addEventHandler(
      onResult: (data) {
        // Handle result
        print('验证结果: ${data}');

        print('验证结果: ${data['result']['geetest_challenge']}');
        handleToken(context,data['result']['geetest_validate']);
      },
      onError: (error) {
        // Handle error
        print('验证失败: $error');
      },
    );
    captcha?.startCaptcha(gt3registerData);
  }

  void handleToken(BuildContext context, String token) {
    // 返回上一个页面并将token传递给它
    Navigator.of(context).pop(token);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: EdgeInsets.zero,
      child: IntrinsicHeight(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
                    height: 0,
                    child: verView(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget verView() {
    Widget view = const SizedBox();
    switch (kVerifyType) {
      case 1:
        view = WebViewWidget(controller: controller!);
        break;
      default:
    }
    return view;
  }
}

class NavigationDecisionPolicy extends NavigationDelegate {
  NavigationDecision decideNavigation(NavigationRequest request) {
    // Allow loading HTTP resources
    if (request.url.startsWith('http://')) {
      return NavigationDecision.navigate;
    }
    // Block loading HTTPS resources
    else if (request.url.startsWith('https://')) {
      return NavigationDecision.prevent;
    }
    // Allow all other requests
    return NavigationDecision.navigate;
  }
}
