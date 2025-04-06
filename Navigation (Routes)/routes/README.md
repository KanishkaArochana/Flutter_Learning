# 🚀 Flutter Routing and Navigation Documentation 🛤️

## 📖 Introduction
This documentation explains the routing mechanism in Flutter using `MaterialPageRoute`, `Navigator.push`, and `Navigator.pop`. It also covers how to pass data between screens.

## 📂 File Structure
```
/lib
  |-- main.dart
  |-- Screens/
       |-- MyHomePage.dart
       |-- SecondScreen.dart
```

---
## 1️⃣ main.dart
### 📜 Description
The `main.dart` file serves as the entry point for the Flutter application. It defines the `MyApp` widget, which initializes the app and sets `MyHomePage` as the home screen.

### 📝 Code
```dart
import 'package:flutter/material.dart';
import 'Screens/MyHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Home Page'),
    );
  }
}
```

### Widgets and Properties
- **MaterialApp**: The root widget that sets up navigation and themes.
- **home**: Specifies the first screen to be displayed (`MyHomePage`).

---
## 2️⃣ MyHomePage.dart
### 📜 Description
This screen is the home page containing a button that navigates to `SecondScreen` and passes text data.

### 📝 Code
```dart
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
                  return SecondScreen(text: "Kanishka");
                },
              ),
            );
          },
          child: Text('Go to Second Screen'),
        ),
      ),
    );
  }
}
```

### Widgets and Properties
- **Scaffold**: Provides structure with `AppBar` and `body`.
- **AppBar**: Displays the page title.
- **ElevatedButton**: A button that triggers navigation.
- **Navigator.push**:
  - Creates a new route using `MaterialPageRoute`.
  - Pushes `SecondScreen` onto the navigation stack.
  - Passes the string `"Kanishka"` to `SecondScreen`.

---
## 3️⃣ SecondScreen.dart
### 📜 Description
Displays text received from `MyHomePage` and a button that navigates back.

### 📝 Code
```dart
import 'package:flutter/material.dart';
import 'package:routes/Screens/MyHomePage.dart';

class SecondScreen extends StatelessWidget {
  final String text;

  const SecondScreen({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pop(
                  context,
                  MyHomePage(title: 'Home Page'),
                );
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.pink,
                ),
                child: Text(
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
```

### Widgets and Properties
- **Text**: Displays the received text.
- **Column**: Arranges widgets vertically.
- **SizedBox**: Adds spacing.
- **GestureDetector**:
  - Detects taps.
  - Calls `Navigator.pop()` to return to `MyHomePage`.
- **Navigator.pop**:
  - Removes the current screen from the stack.
  - Returns `MyHomePage`.

---
## 🔄 Navigation Concepts

### **1️⃣ Pushing a New Screen (`Navigator.push`)**
- Adds a new screen to the navigation stack.
- Uses `MaterialPageRoute` to define the screen transition.

**Example:**
```dart
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) {
      return SecondScreen(text: "Kanishka");
    },
  ),
);
```

### **2️⃣ Popping a Screen (`Navigator.pop`)**
- Removes the current screen and returns to the previous screen.

**Example:**
```dart
Navigator.pop(context);
```

### **3️⃣ Passing Data Between Screens**
- **Passing Data:**
  - Done via constructor parameters while pushing a new route.

**Example:**
```dart
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) {
      return SecondScreen(text: "Hello");
    },
  ),
);
```

- **Receiving Data:**
  - Define a parameter in `SecondScreen` and use it inside `build`.

**Example:**
```dart
class SecondScreen extends StatelessWidget {
  final String text;
  const SecondScreen({super.key, required this.text});
}
```

---
## Summary
| Feature | Method |
|---------|--------|
| Navigate to new screen | `Navigator.push` |
| Go back to previous screen | `Navigator.pop` |
| Pass data to next screen | Constructor parameters |

