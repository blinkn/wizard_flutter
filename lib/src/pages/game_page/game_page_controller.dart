import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../main_controller.dart';

class GamePageController extends ChangeNotifier {

  void handleContinueToNextRound(BuildContext context) {
    MainController mController = Provider.of<MainController>(context);

    mController.goToNextRound();

    if(mController.isGameOver) {
      mController.currentRoute = '/gameOver';
      Navigator.popAndPushNamed(context, '/gameOver');
    } else {
      mController.currentRoute = '/bids';
      Navigator.popAndPushNamed(context, '/bids');
    }

  }

  bool isAllTrickValuesSet(BuildContext context) {
    MainController mController = Provider.of<MainController>(context);
    int currentRound = mController.rounds.length;
    int currentRoundIndex = currentRound -1;
    return mController.rounds[currentRoundIndex].bids.fold(0, (acc, cur) => acc + cur.trickValue) == currentRound;
  }


}
