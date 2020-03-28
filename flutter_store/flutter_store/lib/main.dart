import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/app.dart';
import 'package:flutter_store/pages/index_page.dart';
import 'package:flutter_store/provide/cart_provider.dart';
import 'package:flutter_store/provide/category_provide.dart';
import 'package:flutter_store/provide/counter.dart';
import 'package:flutter_store/provide/product_detail_provider.dart';
import 'package:flutter_store/routes/routes.dart';
import 'package:provider/provider.dart';


void main() {
  var counter = Counter();
  var categorySubProvide = CategorySubProvide();
  var categoryProductProvider = CategoryProductProvider();
  var productDetailProvider = ProductDetailProvider();
  var cartProvider = CartProvider();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider.value(value: counter),
      ChangeNotifierProvider.value(value: categorySubProvide),
      ChangeNotifierProvider.value(value: categoryProductProvider),
      ChangeNotifierProvider.value(value: productDetailProvider),
      ChangeNotifierProvider.value(value: cartProvider)
    ],
    child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    var router = Router();
    Routes.configRoutes(router);
    App.router = router;

    return Container(
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: App.router.generator,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: IndexPage(),
      ),
    );
  }
}

