import 'package:flutter/material.dart';
import 'package:flutter_website/model/ProductModel.dart';
import 'package:flutter_website/pages/BannerWidget.dart';
import 'package:flutter_website/service/ProductService.dart';

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
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {})
          ],
        ),
        body: ListView(
          children: this.lists.data.map((model) {
            return ListTile(
              title: Text(model.name),
            );
          }).toList(),
        )
    );
  }
}
