import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_controller.dart';
import 'src/pages/bid_page/bid_page.dart';
import 'src/pages/game_page/game_page.dart';
import 'src/pages/setup_page/setup_page.dart';
import 'src/pages/start_page/start_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainController>.value(value: MainController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Wizard Flutter Version',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepPurpleAccent,
        ),
        routes: {
          '/': (context) => StartPage(),
          '/setup': (context) => SetupPage(),
          '/bids': (context) => BidPage(),
          '/game': (context) => GamePage(),
        },
      ),
    );
  }
}
