import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizard_flutter/main_controller.dart';
import 'package:wizard_flutter/src/models/player.dart';

import 'bet_page_controller.dart';

class BetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BetPageController>.value(
      value: BetPageController(),
      child: Consumer<BetPageController>(
        builder: (context, controller, builder) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Bet Phase'),
            ),
            body: Column(
              children: <Widget>[
                SizedBox(height: 40),
                Text(
                  'Make player\'s bet',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(height: 8),
                Consumer<MainController>(
                  builder: (context, mController, widget) {
                    return Text(
                      'Round ${mController.rounds.length}',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    );
                  },
                ),
                SizedBox(height: 30),
                Flexible(
                  child: Consumer<MainController>(
                    builder: (context, mController, widget) {
                      return ListView.builder(
                        itemCount: mController.players.length,
                        itemBuilder: (context, index) {
                          Player player = mController.players[index];
                          return _buildListItem(context, player);
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: RaisedButton(
                    onPressed: () {
                      controller.handleContinueToGamePhase(context);
                    },
                    child: Text('Continue to Game Phase'),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildListItem(BuildContext context, Player player) {
    MainController mController = Provider.of<MainController>(context);
    int playerBetValue = mController.getPlayerBetValue(player: player);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(player.image),
            radius: 26,
          ),
          title: Text(player.name),
          subtitle: Text('Score: ${player.score}'),
          trailing: SizedBox(
            width: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    mController.setPlayerBetValue(player: player, betValue: playerBetValue - 1);
                  },
                  icon: Icon(
                    Icons.remove,
                    size: 30,
                    color: Colors.red,
                  ),
                ),
                Text(
                  '$playerBetValue',
                  style: TextStyle(fontSize: 17),
                ),
                IconButton(
                  onPressed: () {
                    mController.setPlayerBetValue(player: player, betValue: playerBetValue + 1);
                  },
                  icon: Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
