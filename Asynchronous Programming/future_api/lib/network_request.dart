import 'package:flutter/material.dart';

class NetworkRequest extends StatefulWidget {
  const NetworkRequest({super.key});

  @override
  State<NetworkRequest> createState() => _NetworkRequestState();
}

class _NetworkRequestState extends State<NetworkRequest> {
  Future<String> getData() async {
    // Shude be add Future class and return type include genaric(<>) and String is return type
    // Wait for the first network request simulation
    String email = await Future.delayed(const Duration(seconds: 3), () {
      // first run this code awit 3 seconds
      throw Exception("Server down"); // Return fake error
    });
    return email; // This line is never reached due to the exception
  }

  // Function call
  Future<void> getNetworkRequest() async {
    try {
      debugPrint(
          await getData()); // The value will not be printed until it arrives.
    } catch (e) {
      debugPrint("Error: $e"); // Handle the exception
    }
  }

  @override
  void initState() {
    super.initState();
    // call
    getNetworkRequest();
    debugPrint("Other code"); // First Print
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
