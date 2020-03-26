import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_store/app.dart';
import 'package:flutter_store/config.dart';
import 'package:flutter_store/service/service_method.dart';

class HotProductWidget extends StatefulWidget {
  final List products;
  HotProductWidget({this.products});
  @override
  _HotProductWidgetState createState() => _HotProductWidgetState(hotProducts: products);
}

class _HotProductWidgetState extends State<HotProductWidget> {

  List hotProducts;
  _HotProductWidgetState({this.hotProducts});
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget _getListTitleWidget() {
    return Container(
      padding: EdgeInsets.all(5),
      width: ScreenUtil().setWidth(750),
      alignment: Alignment.center,
      color: Colors.black12,
      child: Text('火爆专区'),
    );
  }
  
  //warp
  Widget _getProductWrapWidget() {
    //先组装widget list
    List<Widget> productsWidget = hotProducts.map((val) {
      return InkWell(
        onTap: () {
          App.router.navigateTo(context, '/productDetail?id=${val['goodsId']}', transition: TransitionType.cupertino);
        },
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          width: ScreenUtil().setWidth(372),
          child: Column(
            children: <Widget>[
              Image.network(val['image'],width: ScreenUtil().setWidth(370),),
              Text(
                val['name'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: ScreenUtil().setSp(28)
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('￥${val['mallPrice']}'),
                  Text(
                    '￥${val['price']}',
                    style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }).toList();
    
    return hotProducts.length == 0 ? Text('') :
        Wrap(
          spacing: 2,
          children: productsWidget,
        );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _getListTitleWidget(),
          _getProductWrapWidget()
        ],
      ),
    );
  }
}
