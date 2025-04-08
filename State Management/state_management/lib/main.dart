import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

// Screen 1 (Main Page)
class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String name = "Kanishka";
//Create new function
  void changeName(String newName) {
    setState(() {
      name = newName;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Building MainPage");
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(name)),
      ),
      body:
          Screen2(name: name, changeName: changeName), //Pass the data Screen 2
    );
  }
}

// Screen 2
class Screen2 extends StatelessWidget {
  Screen2({super.key, required this.name, required this.changeName});
  String name; //Variable
  Function changeName; //Function
  @override
  Widget build(BuildContext context) {
    debugPrint("Building Screen2");
    return Container(
      child:
          Screen3(name: name, changeName: changeName), //Pass the data Screen 3
    );
  }
}


