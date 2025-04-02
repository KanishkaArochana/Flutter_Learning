
# Black Hole Space App 🌌

A Flutter-based mobile application designed to showcase stunning visuals and informative content about black holes and space. This project focuses on building a responsive and interactive UI using Flutter widgets.

## Features 🚀

### 🖼️ Visuals
- **AppBar** with a title, custom styling, and a menu button.
- Display of multiple sections with images, text, and buttons.
- Use of gestures for button functionality.
- Responsive UI with scrollable content.
- Color palette display using circular containers.
- Footer section with styled text and a divider line.

### 📜 Informative
- Detailed descriptions about black holes, using dynamic and styled text.
- Using stateLesswigect

### 🎨 Interactive Elements
- Buttons with gesture-based interactions.
- Scrollable content for enhanced usability.
- Color palette display for aesthetics.

### 📐 Organized Structure
- Footer section with styled text and a divider line for better segmentation.
- Adaptive layouts using rows, columns, and padding.

## Widgets Overview 🧩

### 1. AppBar
- Displays the app title: "BLACK HOLE".
- Includes an IconButton with a menu symbol.
 - Styled with a black background and yellow shadow.

```dart
appBar: AppBar(
  backgroundColor: Colors.black,
  shadowColor: Colors.yellow,
  title: const Text(
    "BLACK HOLE",
    style: TextStyle(
        color: Colors.white, fontWeight: FontWeight.w900, fontSize: 30),
  ),
  actions: [
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.menu),
    ),
  ],
),
```

### 2. Text
- Used extensively for titles, descriptions, and footer content.
- Customizable properties:
  - `color`: White for readability on the dark theme.
  - `fontWeight`: Varied from w400 to w900 for emphasis.
  - `textAlign`: Centered for balanced visuals.

### 3. Image.asset
- Displays images stored in the assets folder.
- Configured in `pubspec.yaml`.

```yaml
flutter:
  assets:
    - assets/space1.png
    - assets/space2.png
    - assets/space3.png
```

```dart
Image.asset(
  "assets/space1.png",
  height: 300,
  scale: 2,
),
```
### 4. Icon
   - Adds interactive icons like the hamburger menu in the AppBar.
```dart
IconButton(
  onPressed: () {},
  icon: const Icon(Icons.menu),
),
```

### 5. SizedBox
- Adds vertical or horizontal spacing between widgets.

```dart
const SizedBox(height: 50);
```

### 6. Padding
- Adds internal spacing around widgets.
- Example: Wrapping content in a Padding widget with uniform spacing.

```dart
Padding(
  padding: const EdgeInsets.all(16.0),
  child: Column(
    children: [
      // Child widgets
    ],
  ),
)
```

### 7. Row & Column
###  **Column**
   - Organizes widgets vertically.
   - Custom alignment using `crossAxisAlignment`.
```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [...],
)
```

###  **Row**
   - Organizes widgets horizontally.
   - Used for displaying color palettes with circular containers.
   - Aligned using `mainAxisAlignment.spaceAround`.

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    // Color palette containers
    Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.blue,
      ),
    ),
    // Other containers...
  ],
);
```
### 8. Container
   - Used for styling sections, buttons, and circular color displays.
   - Customizable properties like `height`, `width`, `padding`, `decoration`, and `borderRadius`.
```dart
Container(
  height: 50,
  width: 50,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(100),
    color: Colors.blue,
  ),
)
```
## Advanced Features

### 9. GestureDetector
- Wraps buttons to detect and respond to gestures (e.g., tap).

```dart
GestureDetector(
  onTap: () {},
  child: Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: Colors.redAccent,
    ),
    child: const Text(
      "SPACE DETAILS",
      style: TextStyle(color: Colors.white),
    ),
  ),
);
```

### 10. SingleChildScrollView
- Wraps the body to make it scrollable, ensuring responsive design.

```dart
SingleChildScrollView(
  child: Column(
    children: [
      // Content widgets
    ],
  ),
);
```
## Additional points



### crossAxisAlignment
This defines the alignment of widgets along the cross axis (horizontal axis in a Column or vertical axis in a Row).

**Example:**
```dart
crossAxisAlignment: CrossAxisAlignment.start
```

### mainAxisAlignment
To achieve space between elements in Row, use `MainAxisAlignment.spaceBetween` instead of `spaceAround`.

**Example:**
```dart
mainAxisAlignment: MainAxisAlignment.spaceBetween,
```

### Avoiding textAlign: TextAlign.center in the style
You should use `textAlign: TextAlign.center` directly in the `Text` widget, not inside the `TextStyle`.

**Correct Usage:**
```dart
Text(
  "Centered Text",
  textAlign: TextAlign.center,
  style: TextStyle(color: Colors.white),
)
```

If you need any more help, feel free to ask!

### **Dependencies**
- **Material Design Library**:
  ```dart
  import 'package:flutter/material.dart';
  ```
## Project Structure 🏗️

### Main File: `main.dart`
- Contains:
  - `MaterialApp` for theming and routing.
  - `Scaffold` for app structure (AppBar, body, etc.).
  - UI components such as `Text`, `Image.asset`, `Row`, `Column`.

## How to Run 🛠️

1. Clone the repository:

```bash
git clone https://github.com/your-username/black-hole-space-app.git
cd black-hole-space-app
```

2. Install dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run
```


