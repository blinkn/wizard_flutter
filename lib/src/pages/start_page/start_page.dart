import 'package:flutter/cupertino.dart';
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
            backgroundColor: Colors.deepPurpleAccent,
            body: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/wizard.jpg'),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: FlatButton(
                              color: Colors.deepPurple,
                              textColor: Colors.white,
                              onPressed: () {
                                controller.handleStartGame(context);
                              },
                              child: Text('Start a New Game'),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: FlatButton(
                              color: Colors.deepPurple,
                              textColor: Colors.white,
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
              ],
            )
          );
        },
      ),
    );
  }
}
