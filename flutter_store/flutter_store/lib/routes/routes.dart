import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_store/routes/route_handler.dart';

class Routes {
  static String root = '/';
  static String productDetailPage = '/productDetail';
  static void configRoutes(Router router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params) {
        print('route not found');
        return Text('route not found');
      }
    );
    router.define(productDetailPage, handler: productDetailHandler);
  }
}

