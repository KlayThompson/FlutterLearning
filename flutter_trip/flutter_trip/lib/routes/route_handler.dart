import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trip/model/home_model.dart';
import 'dart:convert' as convert;

import 'package:flutter_trip/pages/home_page.dart';
import 'package:flutter_trip/widget/webview.dart';

// 根目录
var rootHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return HomePage();
});

// 设置页 - 示例：不传参数
//var settingHandler =
//Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//  return Settings();
//});

// 网页加载 - 示例：传多个字符串参数
var webViewHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  // params内容为  {title: [我是标题哈哈哈], url: [https://www.baidu.com/]}
  String title = params['title']?.first;
  String statusBarColor = params['statusBarColor']?.first;
  String hideAppbar = params['hideAppbar']?.first;
  String url = params['url']?.first;
  return WebViewWidget(
    url: url,
    title: title,
    statusBarColor: statusBarColor,
    hideAppbar: hideAppbar == 'true' ? true : false,
  );
});

// 示例：传多个model参数
//var webViewHandler =
//Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//
//  LocalNavList _model1 =
//  LocalNavList.fromJson(convert.jsonDecode(params['localNavList'][0]));
//
//  return WebViewWidget(
//    localNavList: _model1,
//  );
//});