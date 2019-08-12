import 'package:boohee_flutter/utils/base64_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class BrowserPage extends StatefulWidget {
  String webViewUrl;

  BrowserPage(String url) {
    webViewUrl = url;
  }

  @override
  _BrowserPageState createState() => _BrowserPageState(webViewUrl);
}

class _BrowserPageState extends State<BrowserPage> {
  String webViewUrl;

  _BrowserPageState(String url) {
    webViewUrl = Base64.decodeBase64(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebView"),
      ),
      body: WebView(
        initialUrl: webViewUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
