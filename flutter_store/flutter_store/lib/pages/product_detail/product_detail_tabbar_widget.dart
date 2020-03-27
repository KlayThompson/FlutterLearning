import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_store/provide/product_detail_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailTabbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2),
      child: Consumer<ProductDetailProvider>(
          builder: (context, provider, child) {
            return Row(
              children: <Widget>[
                _getLeftTabWidget(context,provider.isLeft),
                _getRightTabWidget(context, provider.isRight),
              ],
            );
          }
      ),
    );
  }

  Widget _getLeftTabWidget(BuildContext context,bool isLeft) {
    return InkWell(
      onTap: () {
        var provider = Provider.of<ProductDetailProvider>(context);
        provider.changeSelectTab('left');
      },
      child: Container(
        width: ScreenUtil().setWidth(375),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(width: 1, color: isLeft ? Colors.pink : Colors.black12)
            )
        ),
        child: Text(
          '详情',
          style: TextStyle(
              color: isLeft ? Colors.pink : Color(0xff333333)
          ),
        ),
      ),
    );
  }
  Widget _getRightTabWidget(BuildContext context,bool isRight) {
    return InkWell(
      onTap: () {
        var provider = Provider.of<ProductDetailProvider>(context);
        provider.changeSelectTab('right');
      },
      child: Container(
        width: ScreenUtil().setWidth(375),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(width: 1, color: isRight ? Colors.pink : Colors.black12)
            )
        ),
        child: Text(
          '评论',
          style: TextStyle(
              color: isRight ? Colors.pink : Color(0xff333333)
          ),
        ),
      ),
    );
  }
}
