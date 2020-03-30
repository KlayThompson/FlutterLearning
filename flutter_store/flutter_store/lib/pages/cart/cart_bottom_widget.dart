import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_store/provide/cart_provider.dart';
import 'package:provider/provider.dart';

class CartBottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(

        builder: (context, provider, child) {
          return Container(
            color: Colors.white,
            child: Row(
              children: <Widget>[
                _getLeftSelectAllWidget(context),
                _getTotalPriceWidget(provider.totalPrice),
                _getRightWidget(provider.productCount)
              ],
            ),
          );
        }
    );
  }

  Widget _getLeftSelectAllWidget(BuildContext context) {
    var provider = Provider.of<CartProvider>(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Checkbox(
              value: provider.allCheck,
              activeColor: Colors.pink,
              onChanged: (val) {
                provider.changeAllCheckState(val);
              }),
          Text('全选'),
        ],
      ),
    );
  }

  Widget _getTotalPriceWidget(double price) {
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
                  '￥ ${price.toStringAsFixed(2)}',
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

  Widget _getRightWidget(int count) {
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
              '结算($count)',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ));
  }
}
