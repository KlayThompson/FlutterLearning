import 'package:flutter/cupertino.dart';
import 'package:flutter_trip/config/base_config.dart';
import 'package:flutter_trip/model/home_model.dart';
import 'package:flutter_trip/service/service_method.dart';

class HomeProvider with ChangeNotifier {
  HomeModel _homeModel;
  double _appBarAlpha = 0;

  HomeModel get homeModel => _homeModel;
  double get appBarAlpha => _appBarAlpha;

  getHomeData() {
    requestData(Config.homeUrl, 'get').then((val) {
      HomeModel model = HomeModel.fromJson(val);
      _homeModel = model;
      notifyListeners();
    });
  }

  changeAppbarAlpha(double alpha) {
    _appBarAlpha = alpha;
    notifyListeners();
  }
}