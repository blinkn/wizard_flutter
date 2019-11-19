import 'package:flutter/material.dart';
		import 'package:provider/provider.dart';

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
		                title: Text('Wizard with Provider'),
		              ),
		              body: Column(
		                children: <Widget>[
		                  Text('${controller.counter}'),
		                  FlatButton(
		                    onPressed: () {
		                      controller.increment();
		                    },
		                    child: Text('Increment'),
		                  )
		                ],
		              ),
		            );
		          },
		        ),
		    );
		  }
		}
		