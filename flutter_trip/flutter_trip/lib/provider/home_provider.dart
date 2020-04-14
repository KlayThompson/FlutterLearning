import 'package:flutter/cupertino.dart';
import 'package:flutter_trip/config/base_config.dart';
import 'package:flutter_trip/model/home_model.dart';
import 'package:flutter_trip/service/service_method.dart';

class HomeProvider with ChangeNotifier {
  HomeModel _homeModel;
  double _appBarAlpha = 0;
  bool _loading = false;

  HomeModel get homeModel => _homeModel;
  double get appBarAlpha => _appBarAlpha;
  bool get loading => _loading;

  getHomeData() {
    _loading = true;
    requestData(Config.homeUrl, 'get').then((val) {
      _loading = false;
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