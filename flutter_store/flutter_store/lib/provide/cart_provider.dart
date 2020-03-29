import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_store/model/cart_product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  String cartListsStr = '[]';
  List<CartProductModel> _products = [];

  List<CartProductModel> get products => _products;
  

  addToCart(String id, String name, double price, String image, int count) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //1.现获取保存的数据
    cartListsStr = prefs.getString('cartList') ?? '[]';
    List<Map> tempList = (jsonDecode(cartListsStr.toString()) as List).cast();

    //判断是否加入过该数据
    bool exist = false;
    int index = 0;
    tempList.forEach((item) {
      if (item['goodsId'] == id) {
        exist = true;
        //改变count
        item['count']++;
        _products[index].count++;
      }
      index++;
    });

    Map<String, dynamic> product = {
      'goodsId':id,
      'goodsName':name,
      'count':count,
      'price':price,
      'images':image,
      'isSelect': true,
    };

    if (!exist) {
      tempList.add(product);
      _products.add(CartProductModel.fromJson(product));
    }
    prefs.setString('cartList', jsonEncode(tempList).toString());
    notifyListeners();
//    print(tempList);
//    print(_products.toString());
  }

  clearAllProducts() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('cartList');

    notifyListeners();
  }

  getCartProducts() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //获取本地数据
    cartListsStr = prefs.getString('cartList') ?? '[]';
    //清空当前数据
    _products = [];
    if (cartListsStr == '[]') {
      _products = [];
    } else {
      List<Map> tempList = (jsonDecode(cartListsStr.toString()) as List).cast();
      //添加到列表
      tempList.forEach((item) {
        _products.add(CartProductModel.fromJson(item));
      });
    }
    notifyListeners();
  }
}