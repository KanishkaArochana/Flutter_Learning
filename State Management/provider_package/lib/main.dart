import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('Building MainPage');
    return ChangeNotifierProvider( //Use ChangeNotifierProvider class
        create: (context) => MyData(),
        builder: (BuildContext context, child) { //When the Data change after value 
          return Scaffold(
            appBar: AppBar(
              title: Consumer<MyData>(
                builder: (context, value, child) => Text(value.name),
              ),
            ),
            body: Screen2(),
          );
        });
  }
}

class Screen2 extends StatelessWidget {
  Screen2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugPrint('Building Screen2');
    return Container(
      child: Screen3(),
    );
  }
}
