import 'package:flutter/material.dart';

class GameOverPageController extends ChangeNotifier {
  int counter = 1;

  void increment() {
    counter++;
    notifyListeners();
  }
}
