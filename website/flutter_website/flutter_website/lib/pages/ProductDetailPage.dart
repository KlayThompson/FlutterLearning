import 'package:flutter/material.dart';
import 'package:flutter_website/model/ProductModel.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductItemModel item;
  const ProductDetailPage({this.item, Key key}) : super(key: key);
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState(item: item);
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final ProductItemModel item;
  _ProductDetailPageState({this.item});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(item.name),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                child: Center(child: Image.network(item.imageUrl, fit: BoxFit.cover,),),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                item.desc,
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20
                ),
              ),
            ),
          ],
        )
    );
  }
}
