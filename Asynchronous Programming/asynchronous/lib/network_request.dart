import 'package:flutter/material.dart';

class NetworkRequest extends StatefulWidget {
  const NetworkRequest({super.key});

  @override
  State<NetworkRequest> createState() => _NetworkRequestState();
}

class _NetworkRequestState extends State<NetworkRequest> {
  Future<void> getData() async {

    // Wait for the first network request simulation
    await Future.delayed(Duration(seconds: 3), () {
      //first run this code awit 3 seconds
      debugPrint('email@gmail.com'); // Print the fake email
    });

    // Wait for the second network request simulation
    await Future.delayed(Duration(seconds: 2), () {
      //seconds run this code awit 2 seconds
      debugPrint('name: Kanishka, age: 24'); // Print the fake details
    });

    //If you wont output shoud be return
    String details = await Future.delayed(Duration(seconds: 2), () {
      //seconds run this code awit 2 seconds
      return ('name: Kanishka, age: 24'); // Print the fake details
    });

    // This line will execute after both delays
    debugPrint("Other code"); //After last run this code

//Print get return details
    debugPrint(details);
  }

  @override
  void initState() {
    super.initState();
    // Call the method
    getData();
    debugPrint(
        "Another other codes"); //asyn function is not effect run other code becouse first run "Another other codes" after run asyn function
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Network Request"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Get Data",
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
