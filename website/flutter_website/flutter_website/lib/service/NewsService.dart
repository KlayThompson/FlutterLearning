import 'package:flutter_website/conf/Config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

getNewsList() async{
  var url = 'http://' + Config.IP + ':' + Config.PORT + '/?action=getNews';
  var res = await http.get(url);
  var json = jsonDecode(res.body);
  return json['items'];
}