import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {

  List datas = new List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getDataList();
  }

  _getDataList() async{
    var res = await http.get('http://a.itying.com/api/productlist');
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      setState(() {
        this.datas = data['result'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.info),
          title: Text('个人信息'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('系统设置'),
        ),
        ListTile(
          leading: Icon(Icons.search),
          title: Text('站内搜索'),
        ),
        ListTile(
          leading: Icon(Icons.backup),
          title: Text('备份资料'),
        ),
        RaisedButton(
            onPressed: (){
              Navigator.of(context).pushNamed('/login');
            },
            child: Text('登录'),
        ),
        RaisedButton(
          child: Text('注册'),
          onPressed: () {
            Navigator.pushNamed(context, '/registerOne');
          },
        ),
        ListView(
          shrinkWrap: true,
          children: this.datas.map((value) {
              return ListTile(
                leading: Icon(Icons.people),
                title: Text(value['title']),
              );
          }).toList(),
        )
      ],
    );
  }
}
