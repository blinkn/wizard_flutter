import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizard_flutter/main_controller.dart';
import 'package:wizard_flutter/src/models/player.dart';

import 'bid_page_controller.dart';

class BidPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BidPageController>.value(
      value: BidPageController(),
      child: Consumer<BidPageController>(
        builder: (context, controller, builder) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Bid Phase'),
            ),
            body: Column(
              children: <Widget>[
                SizedBox(height: 40),
                Text(
                  'Make player\'s trick predictions',
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
                    color: Colors.deepPurple,
                    textColor: Colors.white,
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
    int playerBidValue = mController.getPlayerBidValue(player: player);

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
                    mController.setPlayerBidValue(player: player, bidValue: playerBidValue - 1);
                  },
                  icon: Icon(
                    Icons.remove,
                    size: 30,
                    color: Colors.red,
                  ),
                ),
                Text(
                  '$playerBidValue',
                  style: TextStyle(fontSize: 17),
                ),
                IconButton(
                  onPressed: () {
                    mController.setPlayerBidValue(player: player, bidValue: playerBidValue + 1);
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
