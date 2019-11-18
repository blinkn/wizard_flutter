import 'package:flutter/material.dart';

class BoilerplatePageController extends ChangeNotifier {

  int counter = 1;

  void increment() {
    counter ++;
    notifyListeners();
  }

}
