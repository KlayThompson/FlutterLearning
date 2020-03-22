import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_store/components/home_swiper.dart';
import 'package:flutter_store/model/home_content_model.dart';
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
        body: FutureBuilder(
          future: getHomePageContent(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //decode
                var data = jsonDecode(snapshot.data);
                List<Map> swiperDataList = (data['data']['slides'] as List).cast();
                return Column(
                  children: <Widget>[
                    HomeSwiperWidget(items: swiperDataList,)
                  ],
                );
              } else {
                return Container(child: Center(child: Text('正在请求数据...'),),);
              }
            }
        )
    );;
  }
}
