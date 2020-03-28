import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_store/provide/cart_provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('购物车'),
        ),
        body: FutureBuilder(
            future: _getProducts(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Consumer<CartProvider>(
                    builder: (context, provider, child) {
                      return ListView.builder(
                        itemCount: provider.products.length,
                          itemBuilder: (context, index) {
                          return ListTile(title: Text(provider.products[index].goodsName),);
                          }
                      );
                    }
                );
              } else {
                return Container(child: Center(child: Text('暂无数据'),),);
              }
            }
        )
    );;
  }

  Future _getProducts(BuildContext context) async{
    await Provider.of<CartProvider>(context).getCartProducts();
    return 'ok';
  }
}
