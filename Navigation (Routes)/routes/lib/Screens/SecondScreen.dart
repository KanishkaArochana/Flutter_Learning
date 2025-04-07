import 'package:flutter/material.dart';
import 'package:routes/Screens/MyHomePage.dart';

class SecondScreen extends StatelessWidget {
  final String text;

// Create Constactor
  const SecondScreen({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text, // Use the instance variable here dynamically.
              style: const TextStyle(fontSize: 18), // Optional: Add styling.
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pop(
                  context,
                  const MyHomePage(title: 'Home Page'),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.pink,
                ),
                child: const Text(
                  "SPACE DETAILS",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
