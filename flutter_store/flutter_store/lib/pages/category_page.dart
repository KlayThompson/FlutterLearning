import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_store/config.dart';
import 'package:flutter_store/model/category_model.dart';
import 'package:flutter_store/pages/category/category_left_channel_widget.dart';
import 'package:flutter_store/pages/category/category_product_widget.dart';
import 'package:flutter_store/pages/category/category_sub_channel_widget.dart';
import 'package:flutter_store/service/service_method.dart';
import 'package:provider/provider.dart';
import 'package:flutter_store/provide/category_provide.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  var categories = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCategoryData();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('商品分类'),
        ),
        body: Container(
            child: Row(
              children: <Widget>[
                CategoryLeftWidget(lists: this.categories,),
                Container(
                  color: Color.fromRGBO(250, 250, 250, 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CategoryRightChannelWidget(),
                      CategoryProductListWidget()
                    ],
                  ),
                )
              ],
            )
        )
    );
  }
  
  _getCategoryData() {
    requestData(Config.getCategory).then((val) {
      var json = jsonDecode(val.toString());
      CategoryListModel listModel = CategoryListModel.fromJson(json);
      setState(() {
        this.categories = listModel.data;
      });
      final _provide = Provider.of<CategorySubProvide>(context);
      _provide.setSubCategory(categories[0].bxMallSubDto, categories[0].mallCategoryId);
    });
  }
}
