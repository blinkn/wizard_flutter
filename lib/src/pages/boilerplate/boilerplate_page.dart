import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'boilerplate_page_controller.dart';

class BoilerplatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BoilerplatePageController>.value(
        value: BoilerplatePageController(),
        child: Consumer<BoilerplatePageController>(
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
