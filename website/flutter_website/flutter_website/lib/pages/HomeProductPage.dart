import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_website/model/ProductModel.dart';

class HomeProductPage extends StatelessWidget {
  final ProductItemListModel list;
  HomeProductPage({this.list, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      width: deviceWidth,
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: _buildSubView(context, deviceWidth),
    );
  }

  _buildSubView(BuildContext context, double deviceWidth) {
    double itemWidth = deviceWidth * 168.5 / deviceWidth;
    double imageWidth = deviceWidth * 110.0 / 360;

    List<Widget> listWidget = this.list.data.map((e) {
      return InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/productDetail', arguments: e);
        },
        child: Container(
          width: itemWidth,
          color: Color(0xfff8f8f8),
          margin: EdgeInsets.only(bottom: 5, left: 5),
          padding: EdgeInsets.only(top: 10, left: 13, bottom: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                e.name,
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 16
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                e.desc,
                maxLines: 2,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Container(
                alignment: Alignment(0, 0),
                margin: EdgeInsets.only(top: 5),
                child: Image.network(e.imageUrl, fit: BoxFit.cover,),
              )
            ],
          ),
        ),
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10,left: 10),
          child: Text(
            '最新产品',
            style: TextStyle(color: Color(0xff333333), fontSize: 16.0),
          ),
        ),
        SizedBox(height: 10,),
        Wrap(
          spacing: 5,
          children: listWidget.length == 0 ? [Text('no data')] : listWidget,
        )
      ],
    );
  }
}
