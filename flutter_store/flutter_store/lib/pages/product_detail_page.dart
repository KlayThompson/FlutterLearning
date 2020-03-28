import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_store/pages/product_detail/product_detail_bottom.dart';
import 'package:flutter_store/pages/product_detail/product_detail_html_widget.dart';
import 'package:flutter_store/pages/product_detail/product_detail_tabbar_widget.dart';
import 'package:flutter_store/pages/product_detail/product_detail_top_widget.dart';
import 'package:flutter_store/provide/product_detail_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  final String productId;
  ProductDetailPage(this.productId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('商品详情'),
        ),
        body: FutureBuilder(
          future: _getProductDetail(context),
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              return Stack(
                children: <Widget>[
                  Container(
                    child: ListView(
                      children: <Widget>[
                        ProductDetailTopWidget(),
                        ProductDetailTabbarWidget(),
                        ProductDetailHtmlWidget()
                      ],
                    ),
                  ),
                  Positioned(child: ProductDetailBottomWidget(),left: 0,bottom: 0,)
                ],
              );
            } else {
              return Container(
                child: Center(
                  child: Text('加载中...'),
                ),
              );
            }
          },
        ));
  }

  Future _getProductDetail(BuildContext context) async {
//    var _provider = Provider.of<ProductDetailProvider>(context, listen: false);
//    await _provider.getProductDetailByProductId(this.productId);
    await Provider.of<ProductDetailProvider>(context, listen: false).getProductDetailByProductId(this.productId);
    return '完成加载';
  }
}
