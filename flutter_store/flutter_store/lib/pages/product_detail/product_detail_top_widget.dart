import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_store/model/product_detail_model.dart';
import 'package:flutter_store/provide/product_detail_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailTopWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailProvider>(
        builder: (context, provider, child) {
          if (provider.productInfoModel == null) {
            return Center(child: CircularProgressIndicator(),);
          } else {
            return Container(
              child: Column(
                children: <Widget>[
                  _getProductImageWidget(provider.productInfoModel.goodInfo),
                  _getProductNameWidget(provider.productInfoModel.goodInfo),
                  _getProductNumWidget(provider.productInfoModel.goodInfo),
                  _getProductPriceWidget(provider.productInfoModel.goodInfo),
                  _getExplainWidget()
                ],
              ),
            );
          }
        }
    );
  }

  Widget _getProductImageWidget(GoodInfo goodInfo) {
    return Container(
      width: ScreenUtil().setWidth(740),
      child: Image.network(goodInfo.image1),
    );
  }

  Widget _getProductNameWidget(GoodInfo goodInfo) {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.all(10),
      child: Text(
        goodInfo.goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: ScreenUtil().setSp(40),
            color: Color(0xff333333)),
      ),
    );
  }

  Widget _getProductNumWidget(GoodInfo goodInfo) {
    return Container(
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      color: Colors.white,
      child: Text(
        '编号：${goodInfo.goodsSerialNumber}',
        style: TextStyle(fontSize: ScreenUtil().setSp(26), color: Colors.grey),
      ),
    );
  }

  Widget _getProductPriceWidget(GoodInfo goodInfo) {
    return Container(
      width: ScreenUtil().setWidth(740),
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Text(
            '￥${goodInfo.presentPrice}',
            style:
                TextStyle(fontSize: ScreenUtil().setSp(34), color: Colors.pink),
          ),
          SizedBox(
            width: 50,
          ),
          Text(
            '市场价：',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(26), color: Color(0xff333333)),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            '￥${goodInfo.oriPrice}',
            style: TextStyle(
                color: Colors.black38, decoration: TextDecoration.lineThrough),
          ),
        ],
      ),
    );
  }

  Widget _getExplainWidget() {
    return Container(
      width: ScreenUtil().setWidth(750),
//      height: ScreenUtil().setHeight(100),
      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      color: Colors.white,
      child: Text(
          '说明：>极速送达>正品保证',
        style: TextStyle(
          color: Colors.deepOrange,
        ),
      ),
    );
  }
}
