import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'start_page_controller.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StartPageController>.value(
      value: StartPageController(),
      child: Consumer<StartPageController>(
        builder: (context, controller, builder) {
          return Scaffold(
            backgroundColor: Colors.blueGrey,
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            controller.handleStartGame(context);
                          },
                          child: Text('Start a New Game'),
                        ),
                      ),
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            controller.handleContinueGame(context);
                          },
                          child: Text('Continue Game'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
