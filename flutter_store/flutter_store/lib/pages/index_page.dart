import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_store/pages/cart_page.dart';
import 'package:flutter_store/pages/category_page.dart';
import 'package:flutter_store/pages/home_page.dart';
import 'package:flutter_store/pages/member_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_store/provide/current_index_provider.dart';
import 'package:provider/provider.dart';

class IndexPage extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home),
        title: Text('首页')
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search),
        title: Text('分类')
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart),
        title: Text('购物车')
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        title: Text('会员中心')
    )
  ];
  final List<Widget> bodyPages = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Consumer<CurrentIndexProvider>(
        builder: (context, provider, child) {
          return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: provider.currentIndex,
                items: bottomTabs,
                onTap: (index) {
                  provider.changeIndex(index);
                },
              ),
              body: IndexedStack(
                index: provider.currentIndex,
                children: bodyPages,
              )
          );
        }
    );
  }
}

