import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../main_controller.dart';

class StartPageController extends ChangeNotifier {

  void handleStartGame(BuildContext context) {
    MainController mController = Provider.of<MainController>(context);
    mController.currentRoute = '/setup';
    mController.startNewGame();
    Navigator.pushNamed(context, '/setup');
  }

  void handleContinueGame(BuildContext context) {
    MainController mController = Provider.of<MainController>(context);
    Navigator.pushNamed(context, mController.currentRoute);
  }

}
