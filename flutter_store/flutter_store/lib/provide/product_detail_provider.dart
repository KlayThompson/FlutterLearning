import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_store/config.dart';
import 'package:flutter_store/model/product_detail_model.dart';
import 'package:flutter_store/service/service_method.dart';

class ProductDetailProvider with ChangeNotifier {
  ProductInfoModel _infoModel;
  bool _isLeft = true;
  bool _isRight = false;

  ProductInfoModel get productInfoModel => _infoModel;
  bool get isLeft => _isLeft;
  bool get isRight => _isRight;

  getProductDetailByProductId(String id) {
    //每次加载数据将left置为选中
    changeSelectTab('left');
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

  changeSelectTab(String tabTitle) {
    if (tabTitle == 'left') {
      _isLeft = true;
      _isRight = false;
    } else {
      _isLeft = false;
      _isRight = true;
    }
    notifyListeners();
  }
}