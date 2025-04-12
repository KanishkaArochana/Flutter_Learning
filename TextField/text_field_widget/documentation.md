# Flutter TextField Widget Documentation

The TextField widget in Flutter is used to allow users to input and edit text. It is a core widget for form and input functionality.

## Key Properties

1. **cursorColor**
   - Sets the color of the blinking cursor in the text field.
   - Example: `cursorColor: Colors.blue`.

2. **maxLength**
   - Limits the number of characters the user can input.
   - Example: `maxLength: 10`.

3. **obscureText**
   - Hides the text being entered, typically used for password fields.
   - Example: `obscureText: true`.

4. **keyboardType**
   - Defines the type of keyboard that appears for the input field.
   - Options:
     - `TextInputType.text` (default keyboard for text).
     - `TextInputType.number` (numeric keyboard).
     - `TextInputType.emailAddress` (email keyboard).
   - Example: `keyboardType: TextInputType.number`.

5. **style**
   - Applies text styling like font size, color, weight, etc.
   - Example: `style: TextStyle(fontSize: 22)`.

6. **decoration**
   - Customizes the appearance of the input field (e.g., borders, icons, hints).
   - Common Options:
     - `prefixIcon`: Adds an icon before the text.
     - `suffixIcon`: Adds an icon after the text.
     - `hintText`: Placeholder text inside the field.
   - Example:
     ```dart
     decoration: InputDecoration(
       prefixIcon: Icon(Icons.search),
       hintText: 'Enter text here',
     )
     ```

7. **enabled**
   - Enables or disables the TextField.
   - Example: `enabled: false`.

8. **autofocus**
   - Automatically focuses on the field when the screen loads.
   - Example: `autofocus: true`.

9. **controller**
   - A TextEditingController manages the content of the TextField.
   - Can be used to set or get text programmatically.
   - Example:
     ```dart
     final TextEditingController title = TextEditingController();
     title.text = 'Initial Value';
     ```

## Callback Methods

1. **onChanged**
   - Triggered whenever the text changes.
   - Use this to dynamically handle user input.
   - Example:
     ```dart
     onChanged: (text) {
       print("Current input: $text");
     }
     ```

2. **onSubmitted**
   - Triggered when the user submits the text (e.g., by pressing the Enter key).
   - Example:
     ```dart
     onSubmitted: (text) {
       print("User submitted: $text");
     }
     ```

3. **Using a Controller**
   - Programmatically set or get the text using a TextEditingController.
   - Example:
     ```dart
     final TextEditingController controller = TextEditingController();

     // Set value
     controller.text = 'Hello, World!';

     // Get value
     String currentText = controller.text;
     print("Current text: $currentText");
     ```

## Complete Example

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("TextField Example")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                maxLength: 10,
                cursorColor: Colors.blue,
                obscureText: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  hintText: "Enter your text",
                ),
                onChanged: (text) {
                  print("Text changed: $text");
                },
                onSubmitted: (text) {
                  print("Text submitted: $text");
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print("Controller value: ${titleController.text}");
                },
                child: Text("Show Text"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

You can copy this Markdown content into a `.md` file. If you need any further assistance, feel free to ask!