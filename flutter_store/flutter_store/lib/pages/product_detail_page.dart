import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {

  final String productId;
  ProductDetailPage(this.productId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('商品详情'),
        ),
        body: Container(child: Center(child: Text('这是商品详情页:${this.productId}'),),)
    );
  }
}
