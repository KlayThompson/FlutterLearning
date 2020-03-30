import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_store/model/cart_product_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_store/provide/cart_provider.dart';

class CartCountWidget extends StatelessWidget {

  CartProductModel model;
  CartCountWidget(this.model);

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
          _getReduceWidget(context),
          _getCenterCountWidget(),
          _getAddWidget(context)
        ],
      ),
    );
  }

  Widget _getReduceWidget(BuildContext context) {
    return InkWell(
      onTap: (){
        Provider.of<CartProvider>(context).changeProductNum('reduce', this.model);
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: this.model.count>1 ? Colors.white : Colors.black12,
          border: Border(
            right: BorderSide(width: 1,color: Colors.black12)
          )
        ),
        child: this.model.count > 1 ? Text('-') : Text(''),
      ),
    );
  }

  Widget _getAddWidget(BuildContext context) {
    return InkWell(
      onTap: (){
        Provider.of<CartProvider>(context).changeProductNum('add', this.model);
      },
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
      child: Text('${this.model.count}'),
    );
  }
}
