import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_store/model/cart_product_model.dart';
import 'package:flutter_store/pages/cart/cart_count_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_store/provide/cart_provider.dart';

class CartCellWidget extends StatelessWidget {
  final CartProductModel productModel;
  CartCellWidget(this.productModel);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: ScreenUtil().setWidth(750),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: Row(
        children: <Widget>[
          _getCheckBoxWidget(context),
          _getProductImage(),
          _getProductNameWidget(),
          _getPriceAndDeleteIconWidget(context)
        ],
      ),
    );
  }

  //check box
  Widget _getCheckBoxWidget(BuildContext context) {
    var provider = Provider.of<CartProvider>(context);
    return Container(
      width: ScreenUtil().setWidth(90),
      padding: EdgeInsets.all(10),
      child: Checkbox(
          activeColor: Colors.pink,
          value: this.productModel.isSelect ?? false,
          onChanged: (val) {
            this.productModel.isSelect = val;
            provider.selectOrDeselectProduct(this.productModel);
          }),
    );
  }

  //商品图片
  Widget _getProductImage() {
    return Container(
      width: ScreenUtil().setWidth(160),
      height: ScreenUtil().setHeight(160),
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
      padding: EdgeInsets.all(5),
      child: Image.network(productModel.images),
    );
  }

  //商品名称和增加数量方法
  Widget _getProductNameWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
//      alignment: Alignment.topLeft,
//      color: Colors.orange,
      width: ScreenUtil().setWidth(300),
      height: ScreenUtil().setHeight(170),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            productModel.goodsName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: ScreenUtil().setSp(32), color: Color(0xff333333)),
          ),
          CartCountWidget(this.productModel)
        ],
      ),
    );
  }

  //商品价格和删除icon
  Widget _getPriceAndDeleteIconWidget(BuildContext context) {
    var provider = Provider.of<CartProvider>(context, listen: false);
    return Container(
      padding: EdgeInsets.all(5),
      width: ScreenUtil().setWidth(160),
      alignment: Alignment.topRight,
//      color: Colors.red,
      child: Column(
        children: <Widget>[
          Text('￥${productModel.price}'),
          IconButton(
              icon: Icon(
                CupertinoIcons.delete,
                size: 30,
              ),
              onPressed: () {
                provider.deleteCartProduct(this.productModel.goodsId);
              })
        ],
      ),
    );
  }
}
