import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('登录'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Text('这是登录页面'),
              RaisedButton(
                  child: Text('登录'),
                  onPressed: () {
                    Navigator.pop(context);
                  }
              )
            ],
          ),
        )
    );;
  }
}
