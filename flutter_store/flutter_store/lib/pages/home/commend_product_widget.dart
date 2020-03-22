import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommendProductWidget extends StatelessWidget {
  final List lists;
  CommendProductWidget({this.lists});

  //title widget
  Widget _headerTitleWidget() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: ScreenUtil().setHeight(60),
      width: ScreenUtil().setWidth(750),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12)), color: Colors.white),
      child: Text(
        '商品推荐',
        style: TextStyle(color: Colors.pink),
      ),
    );
  }

  //product list widget
  Widget _getListViewWidget() {
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
          itemCount: lists.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return _getSingleCellWidget(index);
          }),
    );
  }

  //single cell
  Widget _getSingleCellWidget(int index) {
    var item = lists[index];
    return InkWell(
      onTap: () {},
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
//        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border(left: BorderSide(width: 1, color: Colors.black12)),
            color: Colors.white),
        child: Column(
          children: <Widget>[
            Image.network(item['image']),
            Text('￥${item['mallPrice']}'),
            Text(
              '${item['price']}',
              style: TextStyle(
                  decoration: TextDecoration.lineThrough, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(390),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          //标题
          _headerTitleWidget(),
          //横向list
          _getListViewWidget()
        ],
      ),
    );
  }
}
