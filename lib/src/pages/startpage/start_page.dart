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
            appBar: AppBar(
              title: Text('Wizard with Provider'),
            ),
            body: ListView.builder(
                itemCount: controller.numbers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${controller.numbers[index]}'),
                  );
                }),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                controller.addNumber();
              },
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
