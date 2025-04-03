# Dart: Synchronous and Asynchronous Programming

Dart is a single-threaded programming language, meaning that all code runs on the main thread unless explicitly stated otherwise. However, it provides mechanisms for handling asynchronous programming to avoid blocking the thread during time-consuming tasks like network requests or file operations.

## Synchronous Programming
Synchronous programming executes code line by line in sequence, where each line must complete before the next line starts.

### Real-World Example
- Cooking a meal where you cook one dish fully before starting the next.

### Code Example
```dart
void main() {
  print('Step 1');
  print('Step 2');
  print('Step 3');
}
```
**Output:**
```
Step 1
Step 2
Step 3
```

## Asynchronous Programming
Asynchronous programming allows multiple tasks to run simultaneously, or more accurately, without waiting for a time-consuming task to finish.

### Real-World Example
- Cooking where you boil water while simultaneously chopping vegetables.

### Code Example
```dart
void main() async {
  print('Step 1');
  await Future.delayed(Duration(seconds: 2), () {
    print('Step 2');
  });
  print('Step 3');
}
```
**Output:**
```
Step 1
Step 3
Step 2
```
Here, the program does not wait for `Step 2` to finish before executing `Step 3`.

---

## Code Documentation: `main.dart`

### **Imports**
```dart
import 'network_request.dart';
import 'package:flutter/material.dart';
```
- `network_request.dart`: Contains the `NetworkRequest` widget logic.
- `package:flutter/material.dart`: Provides Flutter’s Material Design widgets.

### **Main Function**
```dart
void main() {
  runApp(const MyApp());
}
```
- **Purpose:** Starts the Flutter application by running `MyApp`.
- **Example:** This is the entry point for the app.

### **MyApp Widget**
```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asynchronous Programming',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
```
- **Purpose:** Defines the app structure and theme.
- **Components:**
  - `title`: Sets the app’s title.
  - `theme`: Applies the blue primary color theme.
  - `home`: Sets `HomeScreen` as the initial screen.

### **HomeScreen Widget**
```dart
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Asynchronous Programming"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Asynchronous Programming",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NetworkRequest(),
                  ),
                );
              },
              child: const Text("Press Me"),
            ),
          ],
        ),
      ),
    );
  }
}
```
- **Purpose:** Displays a title and a button to navigate to `NetworkRequest`.
- **Key Widgets:**
  - `ElevatedButton`: Navigates to the `NetworkRequest` screen when pressed.
  - `Navigator.push`: Handles navigation to a new route.

---

## Code Documentation: `network_request.dart`

### **NetworkRequest StatefulWidget**
```dart
class NetworkRequest extends StatefulWidget {
  const NetworkRequest({super.key});

  @override
  State<NetworkRequest> createState() => _NetworkRequestState();
}
```
- **Why StatefulWidget?**
  - A `StatefulWidget` is required because the widget involves asynchronous state changes (network requests).

### **_NetworkRequestState Class**
```dart
class _NetworkRequestState extends State<NetworkRequest> {
```
- Contains logic to simulate network requests.

### **getData Method**
```dart
Future<void> getData() async {
  await Future.delayed(Duration(seconds: 3), () {
    debugPrint('email@gmail.com');
  });

  await Future.delayed(Duration(seconds: 2), () {
    debugPrint('name: Kanishka, age: 24');
  });

  String details = await Future.delayed(Duration(seconds: 2), () {
    return ('name: Kanishka, age: 24');
  });

  debugPrint("Other code");
  debugPrint(details);
}
```
- **Purpose:** Simulates three asynchronous network requests.
- **Line-by-Line Explanation:**
  1. `await Future.delayed(Duration(seconds: 3))`: Simulates a 3-second network delay to fetch the email.
  2. `debugPrint('kanishka@gmail.com')`: Logs the email.
  3. `await Future.delayed(Duration(seconds: 2))`: Simulates a 2-second delay to fetch details.
  4. `debugPrint('name: Kanishka, age: 24')`: Logs the details.
  5. `String details = await Future.delayed...`: Fetches and stores details as a string after a 2-second delay.
  6. `debugPrint("Other code")`: Logs a message to show other code execution after the async tasks.
  7. `debugPrint(details)`: Logs the returned details.

### **initState Method**
```dart
@override
void initState() {
  super.initState();
  getData();
  debugPrint("Another other codes");
}
```
- **Purpose:** Automatically triggers the `getData` method when the widget initializes.
- **Behavior:** Prints "Another other codes" before `getData` finishes.

### **Build Method**
```dart
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
```
- **Purpose:** Displays a simple UI.

---

## Explanation of `await` and `async`
- **`async` Keyword:** Marks a function as asynchronous, allowing the use of `await` inside it.
- **`await` Keyword:** Pauses execution until the awaited task completes.

### Example
```dart
Future<void> fetchData() async {
  await Future.delayed(Duration(seconds: 2), () {
    print('Data fetched');
  });
  print('Done');
}
```
- Output:
  ```
  (2-second delay)
  Data fetched
  Done
  ```

