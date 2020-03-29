import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartBottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          _getLeftSelectAllWidget(),
          _getTotalPriceWidget(),
          _getRightWidget()
        ],
      ),
    );
  }

  Widget _getLeftSelectAllWidget() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Checkbox(value: true, activeColor: Colors.pink, onChanged: (val) {}),
          Text('全选'),
        ],
      ),
    );
  }

  Widget _getTotalPriceWidget() {
    return Container(
      alignment: Alignment.centerRight,
//      color: Colors.orange,
      padding: EdgeInsets.all(5),
//      color: Colors.red,
      width: ScreenUtil().setWidth(400),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(220),
                child: Text('合计：'),
              ),
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: Text(
                  '￥ 1992.09',
                  style: TextStyle(color: Colors.redAccent),
                ),
              )
            ],
          ),
          Container(
            width: ScreenUtil().setWidth(400),
            alignment: Alignment.centerRight,
            child: Text(
              '满68元免配送费，预购免配送费',
              style: TextStyle(fontSize: ScreenUtil().setSp(24)),
            ),
          )
        ],
      ),
    );
  }

  Widget _getRightWidget() {
    return Container(
        width: ScreenUtil().setWidth(160),
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(5)),
          child: InkWell(
            onTap: () {},
            child: Text(
              '结算(9)',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ));
  }
}
