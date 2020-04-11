import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_trip/model/home_model.dart';
import 'package:flutter_trip/routes/routes.dart';

class GridNavWidget extends StatelessWidget {
  final GridNav gridNav;
  GridNavWidget(this.gridNav);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5, top: 10),
//      height: 300,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: _gridNavItems(context),
      ),
    );
  }

  List<Widget> _gridNavItems(BuildContext context) {
    List<Widget> items = [];
    if (gridNav == null) {
      return items;
    }
    if (gridNav.hotel != null) {
      items.add(_gridHotelNavItem(context));
    }
    if (gridNav.flight != null) {
      items.add(_gridFlightNavItem(context));
    }
    if (gridNav.travel != null) {
      items.add(_gridTravelNavItem(context));
    }
    return items;
  }

  _gridHotelNavItem(BuildContext context) {
    Color startColor = Color(int.parse('0xff' + gridNav.hotel.startColor));
    Color endColor = Color(int.parse('0xff' + gridNav.hotel.endColor));

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [startColor, endColor]),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5))),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: _mainItemWidget(
              context,
              gridNav.hotel.gridNavMainItem.title,
              gridNav.hotel.gridNavMainItem.icon,
              gridNav.hotel.gridNavMainItem.statusBarColor,
              true,
              gridNav.hotel.gridNavMainItem.url,
            ),
          ),
          Expanded(
              flex: 1,
              child: _doubleItem(
                gridNav.hotel.gridNavMainItem1.title,
                gridNav.hotel.gridNavMainItem2.title,
                true,
              )),
          Expanded(
              flex: 1,
              child: _doubleItem(
                gridNav.hotel.gridNavMainItem3.title,
                gridNav.hotel.gridNavMainItem4.title,
                false,
              )),
        ],
      ),
    );
  }

  _gridFlightNavItem(BuildContext context) {
    Color startColor = Color(int.parse('0xff' + gridNav.flight.startColor));
    Color endColor = Color(int.parse('0xff' + gridNav.flight.endColor));
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [startColor, endColor])),
      margin: EdgeInsets.only(top: 3),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: _mainItemWidget(
              context,
              gridNav.flight.flightMainItem.title,
              gridNav.flight.flightMainItem.icon,
              'ffffff',
              true,
              gridNav.flight.flightMainItem.url,
            ),
          ),
          Expanded(
              flex: 1,
              child: _doubleItem(
                gridNav.flight.flightMainItem1.title,
                gridNav.flight.flightMainItem2.title,
                true,
              )),
          Expanded(
              flex: 1,
              child: _doubleItem(
                gridNav.flight.flightMainItem3.title,
                gridNav.flight.flightMainItem4.title,
                false,
              )),
        ],
      ),
    );
  }

  _gridTravelNavItem(BuildContext context) {
    Color startColor = Color(int.parse('0xff' + gridNav.travel.startColor));
    Color endColor = Color(int.parse('0xff' + gridNav.travel.endColor));
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [startColor, endColor]),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
      margin: EdgeInsets.only(top: 3),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: _mainItemWidget(
              context,
              gridNav.travel.travelMainItem.title,
              gridNav.travel.travelMainItem.icon,
              gridNav.travel.travelMainItem.statusBarColor,
              true,
              gridNav.travel.travelMainItem.url,
            ),
          ),
          Expanded(
              flex: 1,
              child: _doubleItem(
                gridNav.travel.travelMainItem1.title,
                gridNav.travel.travelMainItem2.title,
                true,
              )),
          Expanded(
              flex: 1,
              child: _doubleItem(
                gridNav.travel.travelMainItem3.title,
                gridNav.travel.travelMainItem4.title,
                false,
              )),
        ],
      ),
    );
  }

  _mainItemWidget(
    BuildContext context,
    String title,
    String imgUrl,
    String statusBarColor,
    bool hideAppBar,
    String url,
  ) {
    return InkWell(
      onTap: () {
        Routes.navigateTo(
          context,
          Routes.webView,
          params: {
            'url': url,
            'title': title,
            'statusBarColor': statusBarColor,
            'hideAppbar': hideAppBar ? 'true' : 'false'
          },
        );
      },
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 12),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              width: 121,
            ),
            Image.network(
              imgUrl,
              fit: BoxFit.contain,
              width: 121,
              height: 88,
              alignment: AlignmentDirectional.bottomCenter,
            )
          ],
        ),
      ),
    );
  }

  _doubleItem(String upTitle, String downTitle, bool isCenter) {
    return Container(
      height: 88,
      margin: EdgeInsets.only(top: 0),
      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(flex: 1, child: _singleItem(upTitle, false)),
          Expanded(
            flex: 1,
            child: _singleItem(downTitle, true),
          )
        ],
      ),
    );
  }

  _singleItem(String title, bool isBottom) {
    final border = BorderSide(color: Colors.white, width: 0.7);

    return Container(
      decoration: BoxDecoration(
          border: Border(
              left: border, bottom: isBottom ? BorderSide.none : border)),
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }
}
