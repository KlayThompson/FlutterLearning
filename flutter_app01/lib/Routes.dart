import 'package:flutter/material.dart';
import 'package:flutter_app01/pages/FormPage.dart';
import 'package:flutter_app01/pages/NewsListPage.dart';
import 'package:flutter_app01/pages/SearchPage.dart';
import 'package:flutter_app01/pages/user/RegisterOnePage.dart';
import 'package:flutter_app01/pages/user/RegisterTwoPage.dart';
import 'package:flutter_app01/tabs/TabBarController.dart';
import 'package:flutter_app01/tabs/TabsPage.dart';
import 'pages/user/LoginPage.dart';

final routes = {
  '/':(context) => TabsPage(),
  '/search': (context) => SearchPage(),
  '/form': (context, {arguments}) => FormPage(params: arguments),
  '/login': (context) => LoginPage(),
  '/registerOne': (context) => RegisterOnePage(),
  '/registerTwo': (context) => RegisterTwoPage(),
  '/newsLists': (context) => NewsListPage(),
  '/tabbarController': (context) => TabBarControllerPage()
};

var route = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context, arguments: settings.arguments)
      );
      return route;
    } else {
      final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context)
      );
      return route;
    }
  }
};
