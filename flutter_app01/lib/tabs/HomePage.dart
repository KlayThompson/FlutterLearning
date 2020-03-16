import 'package:flutter/material.dart';
import 'package:flutter_app01/pages/FormPage.dart';
import '../pages/SearchPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  alertDialog() {
    showDialog(
      context: context,
//      barrierDismissible: barrierDismissible,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('title'),
          content: Text('dialogBody'),
          actions: <Widget>[
            FlatButton(
              child: Text('buttonText'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }

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
            Navigator.pushNamed(context, '/form',
                arguments: {'formId': '333333'});
          },
        ),
        RaisedButton(
          textColor: Colors.primaries.first,
          color: Colors.white,
          child: Text('News'),
          onPressed: () {
            Navigator.of(context).pushNamed('/newsLists');
          },
        ),
        RaisedButton(
          color: Colors.red,
          textColor: Colors.white,
          child: Text('tabbarcontroller'),
          onPressed: () {
            Navigator.of(context).pushNamed('/tabbarController');
          },
        ),
        RaisedButton(
          textColor: Colors.primaries.first,
          color: Colors.white,
          child: Text('Form表单实现'),
          onPressed: () {
            Navigator.of(context).pushNamed('/formTest');
          },
        ),
        RaisedButton(
          textColor: Colors.primaries.first,
          color: Colors.white,
          child: Text('Dialog'),
          onPressed: alertDialog,
        )
      ],
    );
  }
}
