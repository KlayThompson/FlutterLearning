import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('会员中心'),
        ),
        body: ListView(
          children: <Widget>[
            _getHeaderWidget()
          ],
        )
    );
  }

  Widget _getHeaderWidget() {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(400),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Positioned(left: 0, top: 0,bottom: 0,right: 0, child: Image.network('https://img1.doubanio.com/view/photo/l/public/p2523017409.jpg',fit: BoxFit.cover,)),
          Positioned(
            top: 50,
            child: Container(
              width: ScreenUtil().setWidth(160),
              height: ScreenUtil().setHeight(160),
              decoration: BoxDecoration(
                border: Border.all(width: 2,color: Colors.white),
                borderRadius: BorderRadius.circular(80)
              ),
              child: ClipOval(
                child: Image.network('https://img3.doubanio.com/view/photo/l/public/p2519693841.jpg',fit: BoxFit.cover,),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
              child: Container(
                child: Text('葵司', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(34)),),
              )
          )
        ],
      ),
    );
  }
}
