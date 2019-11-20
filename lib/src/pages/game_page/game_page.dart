import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizard_flutter/src/models/player.dart';

import '../../../main_controller.dart';
import 'game_page_controller.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GamePageController>.value(
      value: GamePageController(),
      child: Consumer<GamePageController>(
        builder: (context, controller, builder) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Game Phase'),
            ),
            body: Column(
              children: <Widget>[
                SizedBox(height: 40),
                Text(
                  'Set Player Successful Tricks',
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
                Visibility(
                  visible: controller.isAllTrickValuesSet(context),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: RaisedButton(
                      color: Colors.deepPurple,
                      textColor: Colors.white,
                      onPressed: () {
                        controller.handleContinueToNextRound(context);
                      },
                      child: Text('Continue to Next Round'),
                    ),
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
		int playerTrickValue = mController.getPlayerTrickValue(player: player);

		return Card(
			child: Padding(
				padding: const EdgeInsets.all(8.0),
				child: ListTile(
					leading: CircleAvatar(
						backgroundImage: AssetImage(player.image),
						radius: 26,
					),
					title: Text(player.name),
					subtitle: Text('Bid: $playerBidValue / Score: ${player.score}'),
					trailing: SizedBox(
						width: 130,
						child: Row(
							mainAxisAlignment: MainAxisAlignment.end,
							children: <Widget>[
								IconButton(
									onPressed: () {
										mController.decreasePlayerTrickValue(player: player);
									},
									icon: Icon(
										Icons.remove,
										size: 30,
										color: Colors.red,
									),
								),
								Text(
									'$playerTrickValue',
									style: TextStyle(fontSize: 17),
								),
								IconButton(
									onPressed: () {
										mController.increasePlayerTrickValue(player: player);
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
