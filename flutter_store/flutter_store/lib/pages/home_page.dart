import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/components/home_swiper.dart';
import 'package:flutter_store/config.dart';
import 'package:flutter_store/pages/home/ad_banner_widget.dart';
import 'package:flutter_store/pages/home/commend_product_widget.dart';
import 'package:flutter_store/pages/home/floor_content_widget.dart';
import 'package:flutter_store/pages/home/hot_product_widget.dart';
import 'package:flutter_store/pages/home/leader_info_widget.dart';
import 'package:flutter_store/pages/home/top_navigator_widget.dart';
import 'package:flutter_store/service/service_method.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {

    var params = {'lon':'121.46896','lat':'31.27524'};
    return Scaffold(
        appBar: AppBar(
          title: Text('生活家超市'),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
              future: requestData(Config.homePageContentUrl, params: params),
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
                  String floor1Title =data['data']['floor1Pic']['PICTURE_ADDRESS'];//楼层1的标题图片
                  String floor2Title =data['data']['floor2Pic']['PICTURE_ADDRESS'];//楼层1的标题图片
                  String floor3Title =data['data']['floor3Pic']['PICTURE_ADDRESS'];//楼层1的标题图片
                  List<Map> floor1 = (data['data']['floor1'] as List).cast(); //楼层1商品和图片
                  List<Map> floor2 = (data['data']['floor2'] as List).cast(); //楼层1商品和图片
                  List<Map> floor3 = (data['data']['floor3'] as List).cast(); //楼层1商品和图片

                  return Column(
                    children: <Widget>[
                      HomeSwiperWidget(items: swiperDataList,),
                      TopNavigatorWidget(navigators: navigatorDataList,),
                      AdBannerWidget(adImageUrl: advertesPicture,),
                      LeaderInfoWidget(imgUrl: leaderImage, phoneNum: leaderPhone,),
                      CommendProductWidget(lists: recommendList,),
                      FloorContentWidget(imgUrl: floor1Title, lists: floor1,),
                      FloorContentWidget(imgUrl: floor2Title, lists: floor2,),
                      FloorContentWidget(imgUrl: floor3Title, lists: floor3,),
                      HotProductWidget(),
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
