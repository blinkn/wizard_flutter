import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizard_flutter/main_controller.dart';
import 'package:wizard_flutter/src/models/player.dart';

import 'setup_page_controller.dart';

class SetupPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SetupPageController>.value(
      value: SetupPageController(),
      child: Consumer<SetupPageController>(
        builder: (context, controller, builder) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Add Players'),
              ),
              body: Consumer<MainController>(
                builder: (context, mController, widget) {
                  return Column(
                    children: <Widget>[
                      Flexible(
                        child: ListView.builder(
                            itemCount: mController.players.length,
                            itemBuilder: (context, index) {
                              Player player = mController.players[index];
                              return _buildListItem(context, player);
                            }),
                      ),
                      Visibility(
                        visible: mController.players.length > 2,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: RaisedButton(
                              color: Colors.deepPurple,
                              textColor: Colors.white,
                              onPressed: () {
                                controller.handleContinueToBidsPage(context);
                              },
                              child: Text('Continue to Bids Phase'),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
              floatingActionButton: Consumer<MainController>(
                builder: (context, mController, widget) {
                  return Visibility(
                    visible: mController.players.length < 6,
                    child: FloatingActionButton(
                      onPressed: () {
                        controller.handleAddNewPlayer(context);
                      },
                      child: Icon(Icons.add),
                    ),
                  );
                },
              ),
          );
        },
      ),
    );
  }

  Widget _buildListItem(BuildContext context, Player player) {
    SetupPageController controller = Provider.of<SetupPageController>(context);

    return Card(
      child: Dismissible(
        key: ValueKey(player.id),
        direction: DismissDirection.endToStart,
        background: Container(
          color: Colors.red,
          child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(
                  Icons.remove_circle_outline,
                  color: Colors.white,
                  size: 35,
                ),
              )
          ),
        ),
        onDismissed: (direction) {
          controller.removePlayer(context, player);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(player.image ?? 'assets/images/avatars/dumbledore.png'),
              radius: 26,
            ),
            title: Text(player.name),
          ),
        ),
      ),
    );
  }
}
