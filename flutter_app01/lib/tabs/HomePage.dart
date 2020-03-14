import 'package:flutter/material.dart';
import 'package:flutter_app01/pages/FormPage.dart';
import '../pages/SearchPage.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text('搜索🔍'),
          textColor: Colors.primaries.first,
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/search');
          },
        ),
        RaisedButton(
          color: Colors.red,
          textColor: Colors.white,
          child: Text('新建表单'),
          onPressed: () {
            Navigator.pushNamed(context, '/form', arguments: {
              'formId': '333333'
            });
          },
        )
      ],
    );
  }
}
