import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_store/config.dart';
import 'package:flutter_store/model/product_detail_model.dart';
import 'package:flutter_store/service/service_method.dart';

class ProductDetailProvider with ChangeNotifier {
  ProductInfoModel _infoModel;
  ProductInfoModel get productInfoModel => _infoModel;

  getProductDetailByProductId(String id) {
    var params = {
      'goodId': id
    };
    requestData(Config.getGoodDetailById,params: params).then((res){
      var json = jsonDecode(res.toString());
      ProductDetailModel detailModel = ProductDetailModel.fromJson(json);
      _infoModel = detailModel.data;
      notifyListeners();
    });
  }
}