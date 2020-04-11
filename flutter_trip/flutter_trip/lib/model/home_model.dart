class HomeModel {
  ConfigSearchUrl config;
  List<BannerList> bannerList;
  List<LocalNavList> localNavList;
  GridNav gridNav;
  List<SubNavList> subNavList;
  SalesBox salesBox;

  HomeModel(
      {this.config,
        this.bannerList,
        this.localNavList,
        this.gridNav,
        this.subNavList,
        this.salesBox});

  HomeModel.fromJson(Map<String, dynamic> json) {
    config = json['config'] != null
        ? new ConfigSearchUrl.fromJson(json['config'])
        : null;
    if (json['bannerList'] != null) {
      bannerList = new List<BannerList>();
      json['bannerList'].forEach((v) {
        bannerList.add(new BannerList.fromJson(v));
      });
    }
    if (json['localNavList'] != null) {
      localNavList = new List<LocalNavList>();
      json['localNavList'].forEach((v) {
        localNavList.add(new LocalNavList.fromJson(v));
      });
    }
    gridNav =
    json['gridNav'] != null ? new GridNav.fromJson(json['gridNav']) : null;
    if (json['subNavList'] != null) {
      subNavList = new List<SubNavList>();
      json['subNavList'].forEach((v) {
        subNavList.add(new SubNavList.fromJson(v));
      });
    }
    salesBox = json['salesBox'] != null
        ? new SalesBox.fromJson(json['salesBox'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.config != null) {
      data['config'] = this.config.toJson();
    }
    if (this.bannerList != null) {
      data['bannerList'] = this.bannerList.map((v) => v.toJson()).toList();
    }
    if (this.localNavList != null) {
      data['localNavList'] = this.localNavList.map((v) => v.toJson()).toList();
    }
    if (this.gridNav != null) {
      data['gridNav'] = this.gridNav.toJson();
    }
    if (this.subNavList != null) {
      data['subNavList'] = this.subNavList.map((v) => v.toJson()).toList();
    }
    if (this.salesBox != null) {
      data['salesBox'] = this.salesBox.toJson();
    }
    return data;
  }
}

class ConfigSearchUrl {
  String searchUrl;

  ConfigSearchUrl({this.searchUrl});

  ConfigSearchUrl.fromJson(Map<String, dynamic> json) {
    searchUrl = json['searchUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['searchUrl'] = this.searchUrl;
    return data;
  }
}

class BannerList {
  String icon;
  String url;

  BannerList({this.icon, this.url});

  BannerList.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['url'] = this.url;
    return data;
  }
}

class LocalNavList {
  String icon;
  String title;
  String url;
  String statusBarColor;
  bool hideAppBar;

  LocalNavList(
      {this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  LocalNavList.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    title = json['title'];
    url = json['url'];
    statusBarColor = json['statusBarColor'];
    hideAppBar = json['hideAppBar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['url'] = this.url;
    data['statusBarColor'] = this.statusBarColor;
    data['hideAppBar'] = this.hideAppBar;
    return data;
  }
}

class GridNav {
  Hotel hotel;
  Flight flight;
  Travel travel;

  GridNav({this.hotel, this.flight, this.travel});

  GridNav.fromJson(Map<String, dynamic> json) {
    hotel = json['hotel'] != null ? new Hotel.fromJson(json['hotel']) : null;
    flight =
    json['flight'] != null ? new Flight.fromJson(json['flight']) : null;
    travel =
    json['travel'] != null ? new Travel.fromJson(json['travel']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hotel != null) {
      data['hotel'] = this.hotel.toJson();
    }
    if (this.flight != null) {
      data['flight'] = this.flight.toJson();
    }
    if (this.travel != null) {
      data['travel'] = this.travel.toJson();
    }
    return data;
  }
}

class Hotel {
  String startColor;
  String endColor;
  GridNavMainItem gridNavMainItem;
  GridNavMainItem1 gridNavMainItem1;
  GridNavMainItem2 gridNavMainItem2;
  GridNavMainItem3 gridNavMainItem3;
  GridNavMainItem3 gridNavMainItem4;

  Hotel(
      {this.startColor,
        this.endColor,
        this.gridNavMainItem,
        this.gridNavMainItem1,
        this.gridNavMainItem2,
        this.gridNavMainItem3,
        this.gridNavMainItem4});

  Hotel.fromJson(Map<String, dynamic> json) {
    startColor = json['startColor'];
    endColor = json['endColor'];
    gridNavMainItem = json['mainItem'] != null
        ? new GridNavMainItem.fromJson(json['mainItem'])
        : null;
    gridNavMainItem1 = json['item1'] != null
        ? new GridNavMainItem1.fromJson(json['item1'])
        : null;
    gridNavMainItem2 = json['item2'] != null
        ? new GridNavMainItem2.fromJson(json['item2'])
        : null;
    gridNavMainItem3 = json['item3'] != null
        ? new GridNavMainItem3.fromJson(json['item3'])
        : null;
    gridNavMainItem4 = json['item4'] != null
        ? new GridNavMainItem3.fromJson(json['item4'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startColor'] = this.startColor;
    data['endColor'] = this.endColor;
    if (this.gridNavMainItem != null) {
      data['mainItem'] = this.gridNavMainItem.toJson();
    }
    if (this.gridNavMainItem1 != null) {
      data['item1'] = this.gridNavMainItem1.toJson();
    }
    if (this.gridNavMainItem2 != null) {
      data['item2'] = this.gridNavMainItem2.toJson();
    }
    if (this.gridNavMainItem3 != null) {
      data['item3'] = this.gridNavMainItem3.toJson();
    }
    if (this.gridNavMainItem4 != null) {
      data['item4'] = this.gridNavMainItem4.toJson();
    }
    return data;
  }
}

class GridNavMainItem {
  String title;
  String icon;
  String url;
  String statusBarColor;

  GridNavMainItem({this.title, this.icon, this.url, this.statusBarColor});

  GridNavMainItem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
    url = json['url'];
    statusBarColor = json['statusBarColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['icon'] = this.icon;
    data['url'] = this.url;
    data['statusBarColor'] = this.statusBarColor;
    return data;
  }
}

class GridNavMainItem1 {
  String title;
  String url;
  String statusBarColor;

  GridNavMainItem1({this.title, this.url, this.statusBarColor});

  GridNavMainItem1.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    statusBarColor = json['statusBarColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    data['statusBarColor'] = this.statusBarColor;
    return data;
  }
}

class GridNavMainItem2 {
  String title;
  String url;

  GridNavMainItem2({this.title, this.url});

  GridNavMainItem2.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}

class GridNavMainItem3 {
  String title;
  String url;
  bool hideAppBar;

  GridNavMainItem3({this.title, this.url, this.hideAppBar});

  GridNavMainItem3.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    hideAppBar = json['hideAppBar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    data['hideAppBar'] = this.hideAppBar;
    return data;
  }
}

class Flight {
  String startColor;
  String endColor;
  FlightMainItem flightMainItem;
  GridNavMainItem3 flightMainItem1;
  GridNavMainItem2 flightMainItem2;
  GridNavMainItem3 flightMainItem3;
  GridNavMainItem3 flightMainItem4;

  Flight(
      {this.startColor,
        this.endColor,
        this.flightMainItem,
        this.flightMainItem1,
        this.flightMainItem2,
        this.flightMainItem3,
        this.flightMainItem4});

  Flight.fromJson(Map<String, dynamic> json) {
    startColor = json['startColor'];
    endColor = json['endColor'];
    flightMainItem = json['mainItem'] != null
        ? new FlightMainItem.fromJson(json['mainItem'])
        : null;
    flightMainItem1 = json['item1'] != null
        ? new GridNavMainItem3.fromJson(json['item1'])
        : null;
    flightMainItem2 = json['item2'] != null
        ? new GridNavMainItem2.fromJson(json['item2'])
        : null;
    flightMainItem3 = json['item3'] != null
        ? new GridNavMainItem3.fromJson(json['item3'])
        : null;
    flightMainItem4 = json['item4'] != null
        ? new GridNavMainItem3.fromJson(json['item4'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startColor'] = this.startColor;
    data['endColor'] = this.endColor;
    if (this.flightMainItem != null) {
      data['mainItem'] = this.flightMainItem.toJson();
    }
    if (this.flightMainItem1 != null) {
      data['item1'] = this.flightMainItem1.toJson();
    }
    if (this.flightMainItem2 != null) {
      data['item2'] = this.flightMainItem2.toJson();
    }
    if (this.flightMainItem3 != null) {
      data['item3'] = this.flightMainItem3.toJson();
    }
    if (this.flightMainItem4 != null) {
      data['item4'] = this.flightMainItem4.toJson();
    }
    return data;
  }
}

class FlightMainItem {
  String title;
  String icon;
  String url;

  FlightMainItem({this.title, this.icon, this.url});

  FlightMainItem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['icon'] = this.icon;
    data['url'] = this.url;
    return data;
  }
}

class Travel {
  String startColor;
  String endColor;
  LocalNavList travelMainItem;
  TravelMainItem1 travelMainItem1;
  TravelMainItem1 travelMainItem2;
  GridNavMainItem3 travelMainItem3;
  GridNavMainItem3 travelMainItem4;

  Travel(
      {this.startColor,
        this.endColor,
        this.travelMainItem,
        this.travelMainItem1,
        this.travelMainItem2,
        this.travelMainItem3,
        this.travelMainItem4});

  Travel.fromJson(Map<String, dynamic> json) {
    startColor = json['startColor'];
    endColor = json['endColor'];
    travelMainItem = json['mainItem'] != null
        ? new LocalNavList.fromJson(json['mainItem'])
        : null;
    travelMainItem1 = json['item1'] != null
        ? new TravelMainItem1.fromJson(json['item1'])
        : null;
    travelMainItem2 = json['item2'] != null
        ? new TravelMainItem1.fromJson(json['item2'])
        : null;
    travelMainItem3 = json['item3'] != null
        ? new GridNavMainItem3.fromJson(json['item3'])
        : null;
    travelMainItem4 = json['item4'] != null
        ? new GridNavMainItem3.fromJson(json['item4'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startColor'] = this.startColor;
    data['endColor'] = this.endColor;
    if (this.travelMainItem != null) {
      data['mainItem'] = this.travelMainItem.toJson();
    }
    if (this.travelMainItem1 != null) {
      data['item1'] = this.travelMainItem1.toJson();
    }
    if (this.travelMainItem2 != null) {
      data['item2'] = this.travelMainItem2.toJson();
    }
    if (this.travelMainItem3 != null) {
      data['item3'] = this.travelMainItem3.toJson();
    }
    if (this.travelMainItem4 != null) {
      data['item4'] = this.travelMainItem4.toJson();
    }
    return data;
  }
}

class TravelMainItem1 {
  String title;
  String url;
  String statusBarColor;
  bool hideAppBar;

  TravelMainItem1({this.title, this.url, this.statusBarColor, this.hideAppBar});

  TravelMainItem1.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    statusBarColor = json['statusBarColor'];
    hideAppBar = json['hideAppBar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    data['statusBarColor'] = this.statusBarColor;
    data['hideAppBar'] = this.hideAppBar;
    return data;
  }
}

class SubNavList {
  String icon;
  String title;
  String url;
  bool hideAppBar;

  SubNavList({this.icon, this.title, this.url, this.hideAppBar});

  SubNavList.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    title = json['title'];
    url = json['url'];
    hideAppBar = json['hideAppBar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['url'] = this.url;
    data['hideAppBar'] = this.hideAppBar;
    return data;
  }
}

class SalesBox {
  String icon;
  String moreUrl;
  FlightMainItem bigCard1;
  FlightMainItem bigCard2;
  FlightMainItem smallCard1;
  FlightMainItem smallCard2;
  FlightMainItem smallCard3;
  FlightMainItem smallCard4;

  SalesBox(
      {this.icon,
        this.moreUrl,
        this.bigCard1,
        this.bigCard2,
        this.smallCard1,
        this.smallCard2,
        this.smallCard3,
        this.smallCard4});

  SalesBox.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    moreUrl = json['moreUrl'];
    bigCard1 = json['bigCard1'] != null
        ? new FlightMainItem.fromJson(json['bigCard1'])
        : null;
    bigCard2 = json['bigCard2'] != null
        ? new FlightMainItem.fromJson(json['bigCard2'])
        : null;
    smallCard1 = json['smallCard1'] != null
        ? new FlightMainItem.fromJson(json['smallCard1'])
        : null;
    smallCard2 = json['smallCard2'] != null
        ? new FlightMainItem.fromJson(json['smallCard2'])
        : null;
    smallCard3 = json['smallCard3'] != null
        ? new FlightMainItem.fromJson(json['smallCard3'])
        : null;
    smallCard4 = json['smallCard4'] != null
        ? new FlightMainItem.fromJson(json['smallCard4'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['moreUrl'] = this.moreUrl;
    if (this.bigCard1 != null) {
      data['bigCard1'] = this.bigCard1.toJson();
    }
    if (this.bigCard2 != null) {
      data['bigCard2'] = this.bigCard2.toJson();
    }
    if (this.smallCard1 != null) {
      data['smallCard1'] = this.smallCard1.toJson();
    }
    if (this.smallCard2 != null) {
      data['smallCard2'] = this.smallCard2.toJson();
    }
    if (this.smallCard3 != null) {
      data['smallCard3'] = this.smallCard3.toJson();
    }
    if (this.smallCard4 != null) {
      data['smallCard4'] = this.smallCard4.toJson();
    }
    return data;
  }
}

