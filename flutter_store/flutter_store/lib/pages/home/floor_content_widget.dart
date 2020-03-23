import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  Widget _getProductListView() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              _getSingleProductItemWidget(lists[0]),
              Column(
                children: <Widget>[
                  _getSingleProductItemWidget(lists[1]),
                  _getSingleProductItemWidget(lists[2]),
                ],
              )
            ],
          ),
          Row(
            children: <Widget>[
              _getSingleProductItemWidget(lists[3]),
              _getSingleProductItemWidget(lists[4]),
            ],
          )
        ],
      ),
    );
  }

  //single product item
  Widget _getSingleProductItemWidget(Map goods) {
    return InkWell(
      onTap: () {},
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
          _getProductListView()
        ],
      ),
    );
  }
}
