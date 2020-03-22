import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/components/home_swiper.dart';
import 'package:flutter_store/pages/home/ad_banner_widget.dart';
import 'package:flutter_store/pages/home/commend_product_widget.dart';
import 'package:flutter_store/pages/home/leader_info_widget.dart';
import 'package:flutter_store/pages/home/top_navigator_widget.dart';
import 'package:flutter_store/service/service_method.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('生活家超市'),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
              future: getHomePageContent(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  //decode
                  var data = jsonDecode(snapshot.data);
                  List<Map> swiperDataList = (data['data']['slides'] as List).cast();
                  List<Map> navigatorDataList = (data['data']['category'] as List).cast();
                  String advertesPicture = data['data']['advertesPicture']['PICTURE_ADDRESS']; //广告图片
                  String  leaderImage= data['data']['shopInfo']['leaderImage'];  //店长图片
                  String  leaderPhone = data['data']['shopInfo']['leaderPhone']; //店长电话
                  List<Map> recommendList = (data['data']['recommend'] as List).cast(); // 商品推荐
                  return Column(
                    children: <Widget>[
                      HomeSwiperWidget(items: swiperDataList,),
                      TopNavigatorWidget(navigators: navigatorDataList,),
                      AdBannerWidget(adImageUrl: advertesPicture,),
                      LeaderInfoWidget(imgUrl: leaderImage, phoneNum: leaderPhone,),
                      CommendProductWidget(lists: recommendList,)
                    ],
                  );
                } else {
                  return Container(child: Center(child: Text('正在请求数据...'),),);
                }
              }
          ),
        )
    );
  }
}
