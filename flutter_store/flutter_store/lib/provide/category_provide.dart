import 'package:flutter/material.dart';
import 'package:flutter_store/model/category_model.dart';
import 'package:flutter_store/model/category_product_model.dart';

class CategorySubProvide with ChangeNotifier {
  List<BxMallSubDto> subCategories = [];//子分类列表
  int _selectIndex = 0;//选择子分类的索引，每次获取新的分类置为0
  String _categoryId = '2c9f6c946cd22d7b016cd74220b70040';//默认为生鲜
  String _subCategoryId = '';//子分类id
  int _page = 1;//页码
  String _noMoreDataTip = '暂无商品，补货中...'; //上拉刷新没有数据提示

  int get selectIndex => _selectIndex;
  String get categoryId => _categoryId;
  String get subCategoryId => _subCategoryId;
  int get page => _page;
  String get noMoreDataTip => _noMoreDataTip;

  setSubCategory(List<BxMallSubDto> channels, String id) {
    //清空子分类索引
    _selectIndex = 0;
    //设置主分类id
    _categoryId = id;
    //清空子分类id
    _subCategoryId = '';
    //页码，需要在点击主次分类时置为1
    _page = 1;
    _noMoreDataTip = '';

    BxMallSubDto all = BxMallSubDto();
    all.mallSubName = '全部';
    all.mallCategoryId = '0';
    all.comments = '';
    all.mallSubId = '0';
    subCategories = [all];
    subCategories.addAll(channels);
    notifyListeners();
  }
  //设置子分类选中索引 设置子分类id
  setSubCategorySelectIndex(int index, String subCategoryId) {
    _selectIndex = index;
    _subCategoryId = subCategoryId;
    _page = 1;
    _noMoreDataTip = '';
    notifyListeners();
  }

  addPage() {
    _page++;
  }

  changeNoMore(String tip) {
    _noMoreDataTip = tip;
    notifyListeners();
  }
}

class CategoryProductProvider with ChangeNotifier {
  List<CategoryProductModel> _products = [];

  List<CategoryProductModel> get products => _products;

  setProducts(List<CategoryProductModel> list) {
    _products = list;
    notifyListeners();
  }

  addProducts(List<CategoryProductModel> list) {
    _products.addAll(list);
    notifyListeners();
  }
}