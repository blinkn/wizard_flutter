import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../main_controller.dart';
import 'game_over_page_controller.dart';

class GameOverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameOverPageController>.value(
      value: GameOverPageController(),
      child: Consumer<GameOverPageController>(
        builder: (context, controller, builder) {
          return Scaffold(
            appBar: AppBar(
              title: Text('GameOver'),
            ),
            body: Consumer<MainController>(
							builder: (context, mController, widget) {
								return Column(
									children: <Widget>[

									],
								);
							},
						),
          );
        },
      ),
    );
  }
}
