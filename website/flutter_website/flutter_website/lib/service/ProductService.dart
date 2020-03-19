import 'package:flutter_website/conf/Config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

getProductList([int page=0]) async{
  var url = 'http://' + Config.IP + ':' + Config.PORT + '/?action=getProducts&page=$page';
  var res = await http.get(url);
  String body = res.body;
  return jsonDecode(body)['items'];
}