import 'package:flutter/material.dart';
import 'package:flutter_website/model/ProductModel.dart';
import 'package:flutter_website/pages/BannerWidget.dart';
import 'package:flutter_website/service/ProductService.dart';
import 'HomeProductPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ProductItemListModel lists = ProductItemListModel([]);

  getProduct() async{
    var data = await getProductList();
    ProductItemListModel tempList = ProductItemListModel.fromJson(data);
    setState(() {
      lists.data.addAll(tempList.data);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('企业站'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.add), onPressed: () {})
          ],
        ),
        body: ListView(
          children: <Widget>[
            BannerWidget(),
            HomeProductPage(list: this.lists,),
          ],
        )
    );
  }
}
