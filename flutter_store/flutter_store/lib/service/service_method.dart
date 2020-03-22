

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_store/config.dart';

Future getHomePageContent() async {
  try{
    print('开始请求首页数据');
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded").toString();
    var formData = {'lon':'115.02932','lat':'35.76189'};
    Response res;
    res = await dio.post(Config.homePageContentUrl, data: formData);
    if (res.statusCode == 200) {
      return res.data;
    } else {
      throw Exception('后端接口异常');
    }
  }catch(e){
    return print('ERROR:==================================>$e');
  }
}