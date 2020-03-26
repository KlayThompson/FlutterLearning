import 'package:flutter/material.dart';
import 'package:flutter_store/model/category_product_model.dart';
import 'package:flutter_store/service/service_method.dart';
import 'package:flutter_store/provide/category_provide.dart';
import 'package:flutter_store/config.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

getCategoryProductList(BuildContext context,{String categoryId, String categorySubId, int page}) {
  var data = {
    'categoryId': categoryId == null ? '2c9f6c946cd22d7b016cd74220b70040' : categoryId,
    'categorySubId': categorySubId == null ? '' : categorySubId,
    'page': page == null ? 1 : page
  };
  print(data);
  requestData(Config.getMallGoods, params: data).then((res) {
    var json = jsonDecode(res.toString());
    CategoryProductListModel listModel = CategoryProductListModel.fromJson(json);
    final _provider = Provider.of<CategoryProductProvider>(context);
    final _categorySubProvider = Provider.of<CategorySubProvide>(context);
    if (listModel.data == null) {
      Fluttertoast.showToast(
          msg: '已经到底啦',
          toastLength: Toast.LENGTH_LONG,
        textColor: Colors.white,
        backgroundColor: Colors.pink
      );
      _categorySubProvider.changeNoMore('没有更多了');
      if (page == null) {
        _provider.setProducts([]);
      }
    } else {
      if (page == null) {
        _provider.setProducts(listModel.data);
      } else {
        _provider.addProducts(listModel.data);
      }
      _categorySubProvider.addPage();
    }
  });
}

