import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_store/provide/cart_provider.dart';
import 'package:flutter_store/provide/product_detail_provider.dart';

class ProductDetailBottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var productDetailProvider = Provider.of<ProductDetailProvider>(context);
    var cartProvider = Provider.of<CartProvider>(context);
    var id = productDetailProvider.productInfoModel.goodInfo.goodsId;
    var image = productDetailProvider.productInfoModel.goodInfo.image1;
    var name = productDetailProvider.productInfoModel.goodInfo.goodsName;
    var price = productDetailProvider.productInfoModel.goodInfo.presentPrice;

    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(120),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: Container(
              width: ScreenUtil().setWidth(160),
              child: Icon(CupertinoIcons.shopping_cart,color: Colors.red,size: 35,),
            ),
          ),
          InkWell(
            onTap: (){
              cartProvider.addToCart(id, name, price, image, 1);
            },
            child: Container(
              width: ScreenUtil().setWidth(295),
              color: Colors.green,
              child: Center(
                child: Text(
                  '加入购物车',
                  style: TextStyle(
                      color: Colors.white,
                    fontSize: ScreenUtil().setSp(30)
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              cartProvider.clearAllProducts();
            },
            child: Container(
              width: ScreenUtil().setWidth(295),
              color: Colors.red,
              child: Center(
                child: Text(
                  '立即购买',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(30)
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
