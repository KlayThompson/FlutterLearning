import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbar extends StatelessWidget {

  final double alpha;
  CustomAppbar(this.alpha);
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: this.alpha,
      child: Container(
        color: Colors.white,
        height: ScreenUtil().setHeight(150),
        padding: EdgeInsets.only(top: 25),
        child: Center(
          child: Text('首页'),
        ),
      ),
    );
  }
}
