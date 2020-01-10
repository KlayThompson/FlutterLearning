import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:train_ui/custom_icon/mock_data.dart';

class CustomIconsDemo extends StatelessWidget {

  //获取随机的颜色
  Color getRandomColor() {
    return Color((math.Random().nextDouble() * 0xffffffff).toInt() << 0)
      .withOpacity(1.0);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义Icon'),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
          ),
          itemBuilder: (context, index) {
            return Center(
              child: Icon(
                iconList[index],
                size: 30,
                color: Colors.black,
              ),
            );
          },
        itemCount: iconList.length,
      ),
    );
  }
}