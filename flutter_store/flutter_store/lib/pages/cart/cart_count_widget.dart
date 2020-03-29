import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartCountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(165),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
//        color: Colors.red,
        border: Border.all(width: 1, color: Colors.black12),
      ),
      child: Row(
        children: <Widget>[
          _getReduceWidget(),
          _getCenterCountWidget(),
          _getAddWidget()
        ],
      ),
    );
  }

  Widget _getReduceWidget() {
    return InkWell(
      onTap: (){},
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            right: BorderSide(width: 1,color: Colors.black12)
          )
        ),
        child: Text('-'),
      ),
    );
  }

  Widget _getAddWidget() {
    return InkWell(
      onTap: (){},
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                left: BorderSide(width: 1,color: Colors.black12)
            )
        ),
        child: Text('+'),
      ),
    );
  }
  
  Widget _getCenterCountWidget() {
    return Container(
      width: ScreenUtil().setWidth(70),
      height: ScreenUtil().setHeight(45),
      color: Colors.white,
      alignment: Alignment.center,
      child: Text('1'),
    );
  }
}
