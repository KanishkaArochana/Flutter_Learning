import 'package:flutter/material.dart';

class FormLearn extends StatelessWidget {
  // Create a final variable of type GlobalKey<FormState> to identify the form's state.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _name; // Variable for storing the name, using null safety.

  // Constructor
  FormLearn({super.key});

  // Method to build the name input field
  Widget _buildNameField() {  // Should be type in  Widget
    return TextFormField(
      maxLength: 50, // Limit to 50 characters.
      maxLines: 1, // Single-line input.
      decoration: const InputDecoration(
        // Text field decoration.
        labelText: "Enter Name",
        border: OutlineInputBorder(), // Add a border for better appearance.
      ),
      // Validation logic.
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Name cannot be empty';
        }
        return null; // No errors.
      },
      onSaved: (text) {
        _name = text!; // Assign input text to _name.
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Form"),
        ),
        body: SingleChildScrollView(
          // Wrap the body with SingleChildScrollView to prevent overflow when the keyboard is open.
          child: Form(
            // Use the Form widget to group form fields.
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Add a TextFormField widget for user input.
                  _buildNameField(), //Call the function
                  const SizedBox(height: 20), // Add some spacing.
                  ElevatedButton(
                    onPressed: () {
                      // Validate the current form state
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save(); // If valid, save the form.
                        debugPrint(_name);
                      }
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
