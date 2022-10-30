import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewApp extends StatelessWidget {
  const WebViewApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String news = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: WebView(
        initialUrl: news,
      ),
    );
  }
}
