import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_trip/model/home_model.dart';
import 'package:flutter_trip/widget/home/grid_nav.dart';
import 'package:flutter_trip/widget/home/home_appbar.dart';
import 'package:flutter_trip/widget/home/home_swiper_widget.dart';
import 'package:flutter_trip/widget/home/local_nav.dart';
import 'package:flutter_trip/widget/home/sales_nav.dart';
import 'package:flutter_trip/widget/home/sub_nav.dart';
import 'package:flutter_trip/widget/loading_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_trip/provider/home_provider.dart';

//http://www.devio.org/io/flutter_app/json/home_page.json
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  double appBarAlpha = 0;
  BuildContext topContext;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    topContext = context;
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
        body: FutureBuilder(
          future: _loadHomeData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Consumer<HomeProvider>(
                    builder: (context, provider, child) {
                      if (provider.homeModel != null) {
                        return MediaQuery.removePadding(
                            removeTop: true,
                            context: context,
                            child: NotificationListener(
                              onNotification: (scroll) {
                                if (scroll is ScrollUpdateNotification && scroll.depth == 0) {
                                  _onScroll(context,scroll.metrics.pixels);
                                }
                                return true;
                              },
                              child: Stack(
                                children: <Widget>[
                                 LoadingWidget(
                                     child: RefreshIndicator(
                                         child:  ListView(
                                           children: <Widget>[
                                             HomeBannerWidget(provider.homeModel.bannerList),
                                             LocalNavWidget(provider.homeModel.localNavList ?? []),
                                             GridNavWidget(provider.homeModel.gridNav),
                                             SubNavWidget(provider.homeModel.subNavList),
                                             SalesNavWidget(provider.homeModel.salesBox)
                                           ],
                                         ),
                                         onRefresh: _loadHomeData
                                     ),
                                     loading: provider.loading),
                                  CustomAppbar(provider.appBarAlpha)
                                ],
                              ),
                            )
                        );
                      } else {
                        return Center(child: CircularProgressIndicator(),);
                      }
                    }
                );
              } else {
                return Center(child: CircularProgressIndicator(),);
              }
            }
        )
    );
  }

  _onScroll(BuildContext context,double offset) {
    double alpha = offset/100;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha >1) {
      alpha = 1;
    }
    Provider.of<HomeProvider>(context, listen: false).changeAppbarAlpha(alpha);
  }

  Future _loadHomeData() async{
    await Provider.of<HomeProvider>(topContext, listen: false).getHomeData();
    return 'ok';
  }
}
