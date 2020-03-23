import 'dart:io';
import 'package:dio/dio.dart';

Future requestData(url, {params}) async {
  try{
    print('开始请求数据......................url=${url}');
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded").toString();
    Response res;
    if (params == null) {
      res = await dio.post(url);
    } else {
      res = await dio.post(url, data: params);
    }
    if (res.statusCode == 200) {
      return res.data;
    } else {
      throw Exception('后端接口异常');
    }
  }catch(e){
    return print('ERROR:==================================>$e');
  }
}