import 'package:flutter/material.dart';
          
        class GamePageController extends ChangeNotifier {

          int counter = 1;

          void increment() {
            counter ++;
            notifyListeners();
          }

        }
        