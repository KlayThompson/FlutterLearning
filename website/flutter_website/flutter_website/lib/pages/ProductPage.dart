import 'package:flutter/material.dart';
import 'package:flutter_website/model/ProductModel.dart';
import 'package:flutter_website/pages/ProductList.dart';
import 'package:flutter_website/service/ProductService.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  ProductItemListModel list = ProductItemListModel([]);
  int page = 0;

  getDataList() async{
    var json = await getProductList(page);
    ProductItemListModel temp = ProductItemListModel.fromJson(json);
    setState(() {
      list.data.addAll(temp.data);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('产品'),
        ),
        body: ProductListPage(dataList: list, getNextPage: () => getDataList(),)
    );;
  }
}
