import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_store/provide/product_detail_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailHtmlWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<ProductDetailProvider>(builder: (context, provider,child) {
        if (provider.isLeft) {
          return Html(data: provider.productInfoModel.goodInfo.goodsDetail);
        } else {
          return Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10, 30, 10, 50),
                child: Center(
                  child: Text('暂时还没有评论喔！'),
                ),
              ),
              Image.network(provider.productInfoModel.advertesPicture.pICTUREADDRESS,width: ScreenUtil().setWidth(750),)
            ],
          );
        }

      }),
    );
  }
}
