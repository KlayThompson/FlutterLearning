import 'dart:convert';
import 'dart:io';
import 'data.dart';

void main() async{
  var requestServer = await HttpServer.bind('172.18.8.177', 2020);
  await for (HttpRequest request in requestServer) {
    handleMessage(request);
  }
}

void handleMessage(HttpRequest request) {
  try {
    if (request.method == 'GET') {
      handleGetMethod(request); 
    } else if (request.method == 'POST') {
      handlePostMethod(request);
    }
    
  } catch (e) {
    print('got error $e');
  }
}

void handleGetMethod(HttpRequest request) {
  var action = request.uri.queryParameters['action'];

  if (action == 'getProducts') {
    print('请求产品列表');
    request.response
      ..statusCode = HttpStatus.ok
      ..write(json.encode(products))
      ..close();
  } else if (action == 'getNews') {
    request.response
      ..statusCode = HttpStatus.ok
      ..write(json.encode(news))
      ..close();
  }
   else {
    request.response..write('Hello World1')..close();
  }
}

void handlePostMethod(HttpRequest request) {

}