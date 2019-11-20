import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../main_controller.dart';

class BidPageController extends ChangeNotifier {

  void handleContinueToGamePhase(BuildContext context) {
    MainController mController = Provider.of<MainController>(context);
    mController.currentRoute = '/game';
    Navigator.popAndPushNamed(context, '/game');
  }

}
