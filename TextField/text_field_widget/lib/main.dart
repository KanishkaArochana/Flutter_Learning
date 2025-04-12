import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // Create TextEditingController object for title controller
  final TextEditingController title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    title.text = 'Typing name'; // Set data in controller
    String test = title.text; // Get data in controller

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Text"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0), // Optional for spacing
          child: Column(
            children: [

              //Text Field 01

              TextField(
                cursorColor: Colors.blue, // Cursor Color
                maxLength: 10, // Assign max length
                obscureText: true, // Convert to password field
                keyboardType: TextInputType.number, // Choose keyboard type
                style: const TextStyle(fontSize: 22), // Style TextField
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search), // Decoration TextField
                ),
                onChanged: (text) {
                  print(text);
                },
              ),

              const SizedBox(height: 16), // Adds space between TextFields

              //Text Field 02

              TextField(
                maxLength: 100, // Assign max length
                keyboardType: TextInputType.text, // Choose keyboard type
                autofocus: true, // This field auto focus
                style: const TextStyle(fontSize: 22),
                enabled: false, // TextField disabled
                onSubmitted: (text) {
                  print(text);
                },
              ),
              const SizedBox(height: 16), // Adds space between TextFields

              //Text Field 03

              TextField(
                maxLength: 100, // Assign max length
                keyboardType: TextInputType.text, // Choose keyboard type
                autofocus: true, // This field auto focus
                style: const TextStyle(fontSize: 22),
                enabled: true, // Ensure this TextField is enabled
                controller: title, // Can set the value and get the value
              ),
              const SizedBox(height: 66), // Adds space between TextFields

              //Text Field 04

              //Create SearchBar
              TextField(
                keyboardType: TextInputType.text,
                // controller: title,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      title.text = '';
                    },
                  ),
                  border: InputBorder.none,
                  filled: true,
                  hintText: 'Search...',
                  hintStyle: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
