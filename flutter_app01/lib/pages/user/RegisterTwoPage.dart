import 'package:flutter/material.dart';
import 'package:flutter_app01/tabs/TabsPage.dart';

class RegisterTwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('注册'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Text('请填写用户名密码'),
              RaisedButton(onPressed: () {
                print('注册成功');
                Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(builder: (context) => new TabsPage(index: 2,)),
                    (route) =>route == null
                );
              }, child: Text('注册'),)
            ],
          ),
        )
    );
  }
}
