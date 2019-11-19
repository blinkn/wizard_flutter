import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizard_flutter/src/enums/confirm_action.dart';
import 'package:wizard_flutter/src/models/player.dart';
import 'package:wizard_flutter/src/pages/setup_page/widgets/new_player_form.dart';
import '../../../main_controller.dart';

class SetupPageController extends ChangeNotifier {

  void handleAddNewPlayer(BuildContext context) async {
    MainController mController = Provider.of<MainController>(context);
    if (mController.players.length < 6) {

      Player newPlayer = Player();
      ConfirmAction response = await showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return NewPlayerForm(newPlayer);
          },
      );

      if (response == ConfirmAction.CONFIRMED) {
        mController.addNewPlayer(newPlayer);
      }

    } else {

      Flushbar(
        message: 'Maximum number of players reached!',
        duration: Duration(milliseconds: 2000),
      )..show(context);

    }

  }

  void removePlayer(BuildContext context, Player player) {
    MainController mController = Provider.of<MainController>(context);
    mController.players.remove(player);

    Flushbar(
      message: 'Player Removed!',
      duration: Duration(milliseconds: 2000),
      mainButton: FlatButton(
        child: Text('UNDO'),
        onPressed: () {
          mController.addNewPlayer(player);
        },
      ),
      isDismissible: true,
    )..show(context);

    notifyListeners();

  }

  void handleContinueToBetPage(BuildContext context) {
    MainController mController = Provider.of<MainController>(context);
    mController.currentRoute = '/bet';
    Navigator.popAndPushNamed(context, '/bet');
  }

}
