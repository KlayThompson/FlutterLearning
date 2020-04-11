import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trip/model/home_model.dart';
import 'package:flutter_trip/routes/routes.dart';

class LocalNavWidget extends StatelessWidget {
  final List<LocalNavList> localNavList;
  LocalNavWidget(this.localNavList);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _getSingleMenu(context),
      ),
    );
  }

  List<Widget> _getSingleMenu(BuildContext context) {
    return this.localNavList.map((val) {
      return Container(
//        padding: EdgeInsets.only(top: 7),
        child: Expanded(
          flex: 1,
            child: InkWell(
              onTap: () {
              Routes.navigateTo(context, Routes.webView, params: {'url': val.url, 'title': val.title, 'statusBarColor': val.statusBarColor, 'hideAppbar': val.hideAppBar ? 'true' : 'false'},);
//              Routes.navigateTo(context, Routes.webView, params: {'localNavList': jsonEncode(val)});
              },
              child: Column(
                children: <Widget>[
                  Image.network(val.icon, width: 32,height: 32,),
                  SizedBox(height: 10,),
                  Text(val.title),
                ],
              ),
            )
        ),
      );
    }).toList();
  }
}
