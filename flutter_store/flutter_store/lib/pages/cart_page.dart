import 'package:flutter/material.dart';
import 'package:flutter_store/pages/cart/cart_bottom_widget.dart';
import 'package:flutter_store/pages/cart/cart_cell_widget.dart';
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
                      return Stack(
                        children: <Widget>[
                      ListView.builder(
                      itemCount: provider.products.length,
                          itemBuilder: (context, index) {
                            return CartCellWidget(provider.products[index]);
                          }
                      ),
                          Positioned(child: CartBottomWidget(), left: 0,bottom: 0,)
                        ],
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
    await Provider.of<CartProvider>(context,listen: false).getCartProducts();
    return 'ok';
  }
}
