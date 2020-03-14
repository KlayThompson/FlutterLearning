import 'package:flutter/material.dart';
class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
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
        )
      ],
    );
  }
}
