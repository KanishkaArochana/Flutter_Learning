import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ListView & ListTile"),
        ),
        //Can Sroll in ListView
        //Sutable for small List (Memory Efficincy)
        body: ListView(
          scrollDirection: Axis.vertical, //Scroll Side
          children: [
            ListTile( //A wigect
              leading: const Icon(Icons.brightness_auto), //leading is start place
              title: const Text("Brightness Auto"), // title is first row
              subtitle: const Text("Change the Brightness"), // title is second row
              trailing: const Icon(Icons.menu), //trailing is end place
              onTap: () {},  //Create list function
            ),
            const Divider(), //between two list
            const ListTile(
              leading: Icon(Icons.image),
              title: Text("Change Image"),
              subtitle: Text("Change the Image"),
              trailing: Icon(Icons.menu),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.keyboard),
              title: Text("Keyboard Layout"),
              subtitle: Text("Change the Keybord Layout"),
              trailing: Icon(Icons.menu),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text("Ring Option"),
              subtitle: Text("Change the Ring Option"),
              trailing: Icon(Icons.menu),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.build),
              title: Text("Settings"),
              subtitle: Text("Change the Settings"),
              trailing: Icon(Icons.menu),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.nature_people),
              title: Text("Near"),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.backup),
              title: Text("Backup"),
            ),
          ],
        ),
      ),
    );
  }
}
