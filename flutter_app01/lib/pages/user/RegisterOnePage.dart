import 'package:flutter/material.dart';

class RegisterOnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('注册'),
        ),
        body: Column(
          children: <Widget>[
            Text('请输入手机号码'),
            RawMaterialButton(child: Text('发送验证码'),onPressed: () {
              Navigator.pushNamed(context, '/registerTwo');
//            Navigator.of(context).pushReplacementNamed('/registerTwo');
            },)
          ],
        )
    );
  }
}
