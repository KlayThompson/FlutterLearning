import 'dart:convert';
import 'package:flutter_website/Routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_website/App.dart';
import 'package:flutter_website/Loading.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: <String, WidgetBuilder>{
        'app': (BuildContext context) => AppPage(),
        'company_info': (BuildContext context) => WebviewScaffold(
              url: 'https://www.baidu.com',
              appBar: AppBar(
                title: Text('公司简介'),
                leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/app');
                    }),
              ),
            )
      },
      theme: ThemeData(
        primaryColor: Colors.redAccent,
      ),
      home: LoadingPage(),
      onGenerateRoute: route,
    );
  }
}
