import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class CommonWebViewPage extends StatelessWidget {
  final Map webInfo;
  CommonWebViewPage({this.webInfo});

  @override
  Widget build(BuildContext context) {
    return  WebviewScaffold(
      appBar: AppBar(
        title: Text(this.webInfo['title']),
      ),
      url: this.webInfo['webUrl'],
    );
  }
}
