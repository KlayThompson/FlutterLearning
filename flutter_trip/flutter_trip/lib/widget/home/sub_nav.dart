import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trip/model/home_model.dart';
import 'package:flutter_trip/routes/routes.dart';

class SubNavWidget extends StatelessWidget {
  final List<SubNavList> subNavList;
  SubNavWidget(this.subNavList);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: _getMenu(context),
    );
  }

   _getMenu(BuildContext context) {
    List<Widget> lists = [];
    subNavList.forEach((val) {
      lists.add(_getSingleMenu(context, val));
    });
    //计算第一行显示数量,此处计算分隔位置
    int separate = (subNavList.length / 2 + 0.5).toInt();
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: lists.sublist(0, separate),
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: lists.sublist(separate, subNavList.length),
        )
      ],
    );
  }

  Widget _getSingleMenu(BuildContext context, SubNavList val) {
    return Container(
      child: Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              Routes.navigateTo(context, Routes.webView, params: {'url': val.url, 'title': val.title, 'statusBarColor': 'ffffff', 'hideAppbar': val.hideAppBar ? 'true' : 'false'},);
            },
            child: Column(
              children: <Widget>[
                Image.network(val.icon, width: 22,height: 22,),
                SizedBox(height: 10,),
                Text(val.title),
              ],
            ),
          )
      ),
    );
  }
}
