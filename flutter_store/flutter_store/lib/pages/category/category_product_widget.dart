import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_store/config.dart';
import 'package:flutter_store/model/category_product_model.dart';
import 'package:flutter_store/service/category_service.dart';
import 'package:flutter_store/service/service_method.dart';
import 'package:provider/provider.dart';
import 'package:flutter_store/provide/category_provide.dart';

class CategoryProductListWidget extends StatefulWidget {
  @override
  _CategoryProductListWidgetState createState() =>
      _CategoryProductListWidgetState();
}

class _CategoryProductListWidgetState extends State<CategoryProductListWidget> {
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _productProvider = Provider.of<CategoryProductProvider>(context);
    return Expanded(
        child: Container(
            width: ScreenUtil().setWidth(530),
            child: _productProvider.products.length == 0
                ? Center(
                    child: Text('暂无商品，补货中...'),
                  )
                : _getListView(context)));
  }

  _getListView(context) {
    final _productProvider = Provider.of<CategoryProductProvider>(context);
    final _categorySubProvider = Provider.of<CategorySubProvide>(context);
    try {
      if (_categorySubProvider.page == 1) {
        _scrollController.jumpTo(0.0);
      }
    } catch (e) {
      print('init');
    }
    return EasyRefresh(
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _productProvider.products.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black12))),
                child: Row(
                  children: <Widget>[
                    _getImageWidget(_productProvider.products[index]),
                    Column(
                      children: <Widget>[
                        _getTitleWidget(_productProvider.products[index]),
                        _getPriceWidget(_productProvider.products[index])
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
      onLoad: () async {
        print('上拉加载更多');
        await getCategoryProductList(context,
            categoryId: _categorySubProvider.categoryId,
            categorySubId: _categorySubProvider.subCategoryId,
            page: _categorySubProvider.page);
      },
    );
  }

  Widget _getImageWidget(CategoryProductModel model) {
    return Container(
      width: ScreenUtil().setWidth(190),
      child: Image.network(
        model.image,
      ),
    );
  }

  Widget _getTitleWidget(CategoryProductModel model) {
    return Container(
      width: ScreenUtil().setWidth(340),
      padding: EdgeInsets.all(5),
      child: Text(
        model.goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Color(0xff333333), fontSize: ScreenUtil().setSp(30)),
      ),
    );
  }

  Widget _getPriceWidget(CategoryProductModel model) {
    return Container(
      width: ScreenUtil().setWidth(340),
      margin: EdgeInsets.only(top: 20),
      child: Row(
        children: <Widget>[
          Text(
            '￥${model.presentPrice}',
            style:
                TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(28)),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            '￥${model.oriPrice}',
            style: TextStyle(
                color: Colors.black26,
                fontSize: ScreenUtil().setSp(26),
                decoration: TextDecoration.lineThrough),
          )
        ],
      ),
    );
  }
}
