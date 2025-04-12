
# 🎨 Flutter TextField Widget Documentation 📱

## 🌟 Overview
This document provides an easy-to-understand guide to the `TextField` widget in Flutter, explaining its properties and usage.

## 📸 Example Screenshot
*(Below is an example UI of the TextField widget in action.)*
🖼️ *[Insert Screenshot Here]*

---

## 1️⃣ Basic `TextField` Example 📝
```dart
TextField(
  cursorColor: Colors.blue, // Cursor color
  maxLength: 10, // Maximum number of characters
  obscureText: true, // Hides the text like a password field
  keyboardType: TextInputType.number, // Numeric keyboard type
  style: const TextStyle(fontSize: 22), // Styling the text field
  decoration: const InputDecoration(
    prefixIcon: Icon(Icons.search), // Adds a search icon inside the field
  ),
  onChanged: (text) {
    print(text); // Prints input value as user types
  },
)
```
### ✨ Properties:
- 🎯 `cursorColor`: Changes the cursor color.
- 🔢 `maxLength`: Limits the number of characters.
- 🔒 `obscureText`: Hides text input (useful for password fields).
- ⌨️ `keyboardType`: Defines the type of keyboard (e.g., number, text).
- 🎨 `style`: Customizes the text style.
- 🖌️ `decoration`: Adds icons, hint text, and border styling.
- 🔄 `onChanged`: Detects when the text changes.

---

## 2️⃣ Disabled `TextField` 🚫
```dart
TextField(
  maxLength: 100, // Maximum characters allowed
  keyboardType: TextInputType.text, // Standard text keyboard
  autofocus: true, // Focuses on this field automatically
  style: const TextStyle(fontSize: 22),
  enabled: false, // Disables input
  onSubmitted: (text) {
    print(text);
  },
)
```
### ✨ Properties:
- ❌ `enabled`: Set to `false` to disable input.
- 🔍 `autofocus`: Automatically focuses on this field when the screen loads.

---

## 3️⃣ `TextField` with Controller 🎛️
```dart
final TextEditingController title = TextEditingController();

title.text = 'Typing name'; // Setting initial text

TextField(
  maxLength: 100,
  keyboardType: TextInputType.text,
  autofocus: true,
  style: const TextStyle(fontSize: 22),
  enabled: true,
  controller: title, // Assigns controller to manage input
)
```
### ✨ Properties:
- 🎮 `controller`: Uses `TextEditingController` to manage text input.
- 📝 `text`: Pre-fills the field with a value.

---

## 4️⃣ Search Bar with Clear Button 🔎❌
```dart
TextField(
  keyboardType: TextInputType.text,
  decoration: InputDecoration(
    prefixIcon: const Icon(Icons.search, color: Colors.black),
    suffixIcon: IconButton(
      icon: const Icon(Icons.close, color: Colors.black),
      onPressed: () {
        title.text = ''; // Clears input field
      },
    ),
    border: InputBorder.none,
    filled: true,
    hintText: 'Search...',
    hintStyle: const TextStyle(color: Colors.black),
  ),
)
```
### ✨ Properties:
- 🔍 `prefixIcon`: Adds an icon before the input.
- ❌ `suffixIcon`: Adds an icon button for clearing the text.
- 🚫 `border`: Removes the default underline.
- 🎨 `filled`: Enables background fill.
- 🏷️ `hintText`: Displays placeholder text.
- ✍️ `hintStyle`: Styles the placeholder text.

---

## 🎯 Conclusion
This document explains different ways to use `TextField` in Flutter, including styling, controllers, and special properties for functionality like search bars and password fields. Happy coding! 🚀
