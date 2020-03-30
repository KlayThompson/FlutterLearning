import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_store/model/cart_product_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  String cartListsStr = '[]';
  List<CartProductModel> _products = [];
  double _totalPrice = 0.0;
  int _productCount = 0;
  bool _allCheck = true;

  List<CartProductModel> get products => _products;
  double get totalPrice => _totalPrice;
  int get productCount => _productCount;
  bool get allCheck => _allCheck;

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
    getCartProducts();
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
    _totalPrice = 0;
    _productCount = 0;
    if (cartListsStr == '[]') {
      _products = [];
    } else {
      List<Map> tempList = (jsonDecode(cartListsStr.toString()) as List).cast();
      //添加到列表
      tempList.forEach((item) {
        if (item['isSelect']) {
          //计算总价
          _totalPrice += item['price']*item['count'];
          //商品总数
          _productCount +=item['count'];
        } else {
          _allCheck = false;
        }

        _products.add(CartProductModel.fromJson(item));
      });
    }
    notifyListeners();
  }

  //delete product
  deleteCartProduct(String productId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //获取本地数据
    cartListsStr = prefs.getString('cartList') ?? '[]';
    List<Map> tempList = (jsonDecode(cartListsStr.toString()) as List).cast();

    //找到数据
    int selectIndex = 0;
    for (int index = 0; index < tempList.length; index++) {
      var item = tempList[index];
      if (item['goodsId'] == productId) {
          selectIndex = index;
      }
    }
    //在temp list 删除
    tempList.removeAt(selectIndex);
    //保存本地
    prefs.setString('cartList', jsonEncode(tempList).toString());
    //重新获取商品数据
    getCartProducts();

    //提示
    Fluttertoast.showToast(msg: '删除成功', gravity: ToastGravity.CENTER,toastLength: Toast.LENGTH_LONG);
  }

  //选择商品，取消选中
  selectOrDeselectProduct(CartProductModel model) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //获取本地数据
    cartListsStr = prefs.getString('cartList') ?? '[]';
    List<Map> tempList = (jsonDecode(cartListsStr.toString()) as List).cast();
    int selectIndex = 0;
    for (int index = 0; index < tempList.length; index++) {
      var item = tempList[index];
      if (item['goodsId'] == model.goodsId) {
        selectIndex = index;
      }
    }
    tempList[selectIndex] = model.toJson();
    //重新设置全选
    _allCheck = true;
    tempList.forEach((val) {
      if (val['isSelect'] == false) {
        _allCheck = false;
      }
    });
    cartListsStr = jsonEncode(tempList).toString();
    //保存本地
    prefs.setString('cartList', cartListsStr);
    //重新获取商品数据
    getCartProducts();
  }

  //全选
  changeAllCheckState(bool value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //获取本地数据
    cartListsStr = prefs.getString('cartList') ?? '[]';
    List<Map> tempList = (jsonDecode(cartListsStr.toString()) as List).cast();
    //新建一个new list
    List<Map> newList = [];
    tempList.forEach((val) {
      var tempItem = val;
      tempItem['isSelect'] = value;
      newList.add(tempItem);
    });
    _allCheck = value;
    //保存new list
    prefs.setString('cartList', jsonEncode(newList).toString());
    //重新获取商品数据
    getCartProducts();
  }

  //➕or➖
  changeProductNum(String state, CartProductModel model) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //获取本地数据
    cartListsStr = prefs.getString('cartList') ?? '[]';
    List<Map> tempList = (jsonDecode(cartListsStr.toString()) as List).cast();
    int selectIndex = 0;
    for (int index = 0; index < tempList.length; index++) {
      var item = tempList[index];
      if (item['goodsId'] == model.goodsId) {
        selectIndex = index;
      }
    }
    //根据state判断是—+
    if (state == 'add') {
      model.count++;
    } else if (model.count > 1) {
      model.count--;
    }
    tempList[selectIndex] = model.toJson();
    //保存本地
    cartListsStr = jsonEncode(tempList).toString();
    prefs.setString('cartList', cartListsStr);
    //重新获取商品数据
    getCartProducts();
  }
}