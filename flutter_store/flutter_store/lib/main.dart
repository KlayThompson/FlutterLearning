import 'package:flutter/material.dart';
import 'package:flutter_store/pages/index_page.dart';
import 'package:flutter_store/provide/category_provide.dart';
import 'package:flutter_store/provide/counter.dart';
import 'package:provider/provider.dart';

void main() {
  var counter = Counter();
  var categorySubProvide = CategorySubProvide();
  var categoryProductProvider = CategoryProductProvider();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider.value(value: counter),
      ChangeNotifierProvider.value(value: categorySubProvide),
      ChangeNotifierProvider.value(value: categoryProductProvider)
    ],
    child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: IndexPage(),
      ),
    );
  }
}

