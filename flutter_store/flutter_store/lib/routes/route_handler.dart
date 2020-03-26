import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_store/pages/product_detail_page.dart';

Handler productDetailHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return ProductDetailPage(params['id'][0]);
  }
);