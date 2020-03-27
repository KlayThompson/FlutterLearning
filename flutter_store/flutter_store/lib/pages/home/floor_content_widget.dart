import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_store/app.dart';

class FloorContentWidget extends StatelessWidget {
  final imgUrl;
  final List lists;
  FloorContentWidget({this.imgUrl, this.lists});

  //title image
  Widget _getTitleImageWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Image.network(imgUrl),
    );
  }

  //product content list view
  Widget _getProductListView(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              _getSingleProductItemWidget(context,lists[0]),
              Column(
                children: <Widget>[
                  _getSingleProductItemWidget(context,lists[1]),
                  _getSingleProductItemWidget(context,lists[2]),
                ],
              )
            ],
          ),
          Row(
            children: <Widget>[
              _getSingleProductItemWidget(context,lists[3]),
              _getSingleProductItemWidget(context,lists[4]),
            ],
          )
        ],
      ),
    );
  }

  //single product item
  Widget _getSingleProductItemWidget(BuildContext context,Map goods) {
    return InkWell(
      onTap: () {
        App.router.navigateTo(context, '/productDetail?id=${goods['goodsId']}', transition: TransitionType.cupertino);
      },
      child: Container(
        width: ScreenUtil().setWidth(375),
        child: Image.network(goods['image']),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _getTitleImageWidget(),
          _getProductListView(context)
        ],
      ),
    );
  }
}
