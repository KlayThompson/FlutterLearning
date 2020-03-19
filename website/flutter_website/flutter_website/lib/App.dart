import 'package:flutter/material.dart';
import 'package:flutter_website/pages/HomePage.dart';
import 'package:flutter_website/pages/NewsPage.dart';
import 'package:flutter_website/pages/ProductPage.dart';
import 'package:flutter_website/pages/AboutUsPage.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {

  var _currentIndex = 0;
  HomePage homePage;
  NewsPage newsPage;
  ProductPage productPage;
  AboutUsPage aboutUsPage;

  getPage() {
    switch (_currentIndex) {
      case 0:
        if (homePage == null) {
          homePage = HomePage();
        }
        return homePage;
      case 1:
        if (productPage == null) {
          productPage = ProductPage();
        }
        return productPage;
      case 2:
        if (newsPage == null) {
          newsPage = NewsPage();
        }
        return newsPage;
      case 3:
        if (aboutUsPage == null) {
          aboutUsPage = AboutUsPage();
        }
        return aboutUsPage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(
//          title: Text('企业站'),
//          actions: <Widget>[
//            IconButton(icon: Icon(Icons.search), onPressed: () {})
//          ],
//        ),
        body: getPage(),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (int i) {
              setState(() {
                this._currentIndex = i;
              });
            },
            items: [
              BottomNavigationBarItem(
                title: Text('首页'),
                icon: Icon(Icons.home)
              ),
              BottomNavigationBarItem(
                  title: Text('产品'),
                  icon: Icon(Icons.computer)
              ),
              BottomNavigationBarItem(
                  title: Text('新闻'),
                  icon: Icon(Icons.ondemand_video)
              ),
              BottomNavigationBarItem(
                  title: Text('我们'),
                  icon: Icon(Icons.people)
              ),
            ]
        ),
    );;
  }
}
