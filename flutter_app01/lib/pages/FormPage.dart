import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  final Map params;
  const FormPage({Key key, this.params}) : super(key: key);
  @override
  _FormPageState createState() => _FormPageState(params: this.params);
}

class _FormPageState extends State<FormPage> {
  final Map params;
  var value = true;
  _FormPageState({this.params});
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          title: Text('appbarTitle'),
        ),
        body: Column(
          children: <Widget>[
            Text(this.params['formId']),
            Switch(value: this.value, onChanged: (v) {
              setState(() {
                this.value = v;
              });
            })
          ],
        )
    );;
  }
}
