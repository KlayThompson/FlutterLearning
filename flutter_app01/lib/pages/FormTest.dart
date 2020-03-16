import 'dart:ffi';

import 'package:flutter/material.dart';

class FormTestPage extends StatefulWidget {
  @override
  _FormTestPageState createState() => _FormTestPageState();
}

class _FormTestPageState extends State<FormTestPage> {
  String name;
  var sex = 1;
  String detail = '';
  List hobbyData = [
    {
      'title': '吃饭',
      'select': false,
    },
    {
      'title': '睡觉',
      'select': false,
    },
    {
      'title': '打豆豆',
      'select': false,
    }
  ];

  List <Widget> getHobbyListWidget() {
    List <Widget>hobbys = new List();
    for (int i = 0; i < hobbyData.length; i++) {
      hobbys.add(
        Row(
          children: <Widget>[
            Text(hobbyData[i]['title']),
            Checkbox(
                value: hobbyData[i]['select'],
                onChanged: (e) {
                  setState(() {
                    hobbyData[i]['select'] = e;
                  });
                }
            )
          ],
        )
      );
    }
    return hobbys;
}

   sexChanged(e) {
    setState(() {
      this.sex = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('学员信息登记系统'),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child:Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      hintText: '请输入姓名',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (e) {
                      setState(() {
                        name = e;
                      });
                    },
                  ),
                  Row(
                    children: <Widget>[
                      Text('男：'),
                      Radio(value: 1, groupValue: this.sex, onChanged: sexChanged),
                      SizedBox(width: 20,),
                      Text('女：'),
                      Radio(value: 2, groupValue: this.sex, onChanged: sexChanged)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(
                    children: this.getHobbyListWidget(),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                        hintText: '请输入其他信息',
                        border: OutlineInputBorder()
                    ),
                    onChanged: (e) {
                      setState(() {
                        this.detail = e;
                      });
                    },
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    height: 45,
                    child: RaisedButton(
                        child: Text('Submit'),
                        onPressed: () {
                          print('姓名：${this.name},性别：${this.sex == 1? '男':'女'},爱好：${this.hobbyData},备注：${this.detail}');
                        }),
                  )
                ],
              ),)
          ],
        )
    );
  }
}
