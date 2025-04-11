import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // Controller for the first method
  StreamController<int> _controller = StreamController<int>();

  // 1st Method: Adding data to the StreamController
  addStreamData() async {
    for (var i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 2));
      _controller.sink.add(i);
    }
  }

  // 2nd Method: Using async* to create a stream
  Stream<int> addStreamData2() async* {
    for (var i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 2));
      yield i; // yield use async*
    }
  }

  @override
  void initState() {
    super.initState();
    // Uncomment the method you want to use:
    // addStreamData(); // 1st Method
  }

  @override
  void dispose() {
    // Dispose the StreamController to avoid memory leaks
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text("Stream & Stream Builder")),
        ),
        body: Center(
          child: StreamBuilder<int>(
            // Specify the stream here:
            // stream: _controller.stream, // 1st Method stream
            stream: addStreamData2() // 2nd Method stream
                .where((event) => event.isEven), // 2nd Method(can filter-->Ex-filter event number)
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Error");
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator.adaptive();
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Stream Item"),
                  Text("${snapshot.data}"),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
