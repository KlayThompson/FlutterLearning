import 'package:flutter/material.dart';
import 'package:flutter_website/App.dart';
import 'package:flutter_website/pages/CommonWebViewPage.dart';
import 'package:flutter_website/pages/ProductDetailPage.dart';
import 'package:flutter_website/pages/NewsDetailPage.dart';
import 'package:flutter_website/pages/ContactUsPage.dart';

final routes = {
  '/app': (context) => AppPage(),
  '/productDetail': (context, {arguments}) => ProductDetailPage(item: arguments,),
  '/newsDetail': (context, {arguments}) => NesDetailPage(itemModel: arguments,),
  '/webView': (context, {arguments}) => CommonWebViewPage(webInfo: arguments,),
  '/contact': (context) => ContactUsPage(),
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