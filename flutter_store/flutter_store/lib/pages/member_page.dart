import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberPage extends StatelessWidget {

  List orderOptions = [
    {
      'title': '待付款',
      'image': CupertinoIcons.bell
    },
    {
      'title': '待发货',
      'image': CupertinoIcons.time
    },
    {
      'title': '待收货',
      'image': CupertinoIcons.brightness
    },
    {
      'title': '待评价',
      'image': CupertinoIcons.create
    }
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('会员中心'),
        ),
        body: ListView(
          children: <Widget>[
            _getHeaderWidget(),
            _getMyOrderWidget(),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: <Widget>[
                  _getListTileWidget('领取优惠券', Icon(CupertinoIcons.tags)),
                  _getListTileWidget('已领取优惠券', Icon(CupertinoIcons.heart)),
                  _getListTileWidget('地址管理', Icon(CupertinoIcons.location)),
                  _getListTileWidget('关于商城', Icon(CupertinoIcons.info)),
                  _getListTileWidget('扫码进行投诉', Icon(CupertinoIcons.switch_camera)),
                  Padding(padding: EdgeInsets.only(bottom: 10))
                ],
              ),
            )
          ],
        )
    );
  }

  Widget _getHeaderWidget() {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(400),
      child: Stack(
        alignment: Alignment.bottomCenter,//http://img.netbian.com/file/2020/0215/e88b27550495d06a041a7854fcd07b8c.jpg
        children: <Widget>[//https://img1.doubanio.com/view/photo/l/public/p2523017409.jpg
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

  Widget _getMyOrderWidget() {

    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      width: ScreenUtil().setWidth(750),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.5, color: Colors.black12)
              )
            ),
            child: ListTile(
              leading: Icon(CupertinoIcons.news),
              title: Text('我的订单'),
              trailing: Icon(CupertinoIcons.right_chevron),
            ),
          ),
          Row(
            children: _getOrderOptionWidgetList(),
          )
        ],
      ),
    );
  }

  List<Widget> _getOrderOptionWidgetList() {
    return orderOptions.map((val){
      return Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: Column(
            children: <Widget>[
              Icon(val['image'],size: 34,color: Color(0xff333333),),
              SizedBox(height: 10,),
              Text(val['title']),
            ],
          ),
        ),
      );
    }).toList();
  }

  Widget _getListTileWidget(String title, Icon icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.black12)
        )
      ),
      margin: title == '关于商城' ? EdgeInsets.only(top: 10) : EdgeInsets.only(top: 0),
      child: ListTile(
        trailing: Icon(CupertinoIcons.right_chevron),
        title: Text(title),
        leading: icon,
      ),
    );
  }
}
