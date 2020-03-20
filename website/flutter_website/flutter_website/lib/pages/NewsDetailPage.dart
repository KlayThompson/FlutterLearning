import 'package:flutter/material.dart';
import 'package:flutter_website/model/NewsModel.dart';

class NesDetailPage extends StatelessWidget {
  final NewsItemModel itemModel;
  NesDetailPage({this.itemModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(itemModel.title),
        ),
        body: ListView(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16/9,
              child: Image.network(itemModel.imgUrl,fit: BoxFit.cover,),
            ),
            Text(itemModel.author, style: TextStyle(color: Colors.blue, fontSize: 18),),
            SizedBox(height: 10,),
            Text(itemModel.content, style: TextStyle(color: Color(0xff333333), fontSize: 14),),
          ],
        )
    );;
  }
}
