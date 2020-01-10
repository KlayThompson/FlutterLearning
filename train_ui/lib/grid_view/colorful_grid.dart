import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorfulGrid extends StatelessWidget {

  var lists = [
    Container(color: Colors.red),
    Container(color: Colors.indigo),
    Container(color: Colors.lime),
    Container(color: Colors.purple),
    Container(color: Colors.green),
    Container(color: Colors.pink),
    Container(color: Colors.cyan),
    Container(color: Colors.amber),
    Container(color: Colors.redAccent),
    Container(color: Colors.teal),
    Container(color: Colors.orange),
    Container(color: Colors.brown),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10
        ),
        itemBuilder: (context, index) {
          return this.lists[index];
        },
        itemCount: this.lists.length,
    );
  }
}