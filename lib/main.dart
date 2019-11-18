import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizard_flutter/src/pages/startpage/start_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StartPage(),
      ),
    );
  }
}
