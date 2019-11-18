import 'package:flutter/material.dart';

class StartPageController extends ChangeNotifier {

  int counter = 1;
  List<int> numbers = List<int>();

  StartPageController() {
    _init();
  }

  _init() async {
    for(int i = 0; i < 3000; i++) {
      numbers.add(i);
    }
    notifyListeners();
  }

  void increment() {
    counter ++;
    notifyListeners();
  }

  void addNumber() {
    numbers.insert(0, 999);
    notifyListeners();
  }

}
