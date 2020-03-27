import 'package:flutter/material.dart';
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
              return Container(
                child: Center(
                  child: Consumer<ProductDetailProvider>(builder: (context,provider, child) {
                    return Container(
                      child: ListView(
                        children: <Widget>[
                          ProductDetailTopWidget(goodInfo: provider.productInfoModel.goodInfo,)
                        ],
                      ),
                    );
                  }),
                ),
              );
            } else {
              return Container(
                child: Center(
                  child: Text('加载中...'),
                ),
              );
            }
          },
        )
    );
  }

  Future _getProductDetail(BuildContext context) async{
    var _provider = Provider.of<ProductDetailProvider>(context, listen: false);
    await _provider.getProductDetailByProductId(this.productId);
    return '完成加载';
  }
}
