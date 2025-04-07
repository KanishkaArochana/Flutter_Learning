import 'package:flutter/material.dart';
import 'SecondScreen.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const SecondScreen(text: "Kanishka"); //Pasing Text
                },
              ),
            );
          },
          child: const Text('Go to Second Screen'),
        ),
      ),
    );
  }
}
