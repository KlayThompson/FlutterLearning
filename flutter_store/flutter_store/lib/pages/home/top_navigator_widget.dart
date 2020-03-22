import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopNavigatorWidget extends StatelessWidget {
  final List navigators;
  TopNavigatorWidget({this.navigators});

  Widget _getNavigatorWidget(context, item) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Image.network(
            item['image'],
            width: ScreenUtil().setWidth(95),
          ),
          Text(item['mallCategoryName'])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (navigators.length > 10) {
      navigators.removeRange(10, navigators.length);
    }
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3),
      child: GridView.count(
        padding: EdgeInsets.all(5),
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        children: navigators.map((item) {
          return this._getNavigatorWidget(context, item);
        }).toList(),
      ),
    );
  }
}
