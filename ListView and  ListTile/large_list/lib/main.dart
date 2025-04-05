import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Data source for the ListView
    final items = List<String>.generate(100, (index) => 'Item $index');

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dynamic Large ListView"),
        ),
        body: ListView.builder( //This builder Memory safe 
          itemCount: items.length, // Specify the number of items length
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]), // Use the item text dynamically
            );
          },
        ),
      ),
    );
  }
}
