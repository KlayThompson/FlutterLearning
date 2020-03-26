import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  var count = 0;
  addCountNum() {
    count++;
    notifyListeners();
  }
}