import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _name;
  late String _email;
  late String _password;
  late int _mobile;

  Widget _buildNameField() {
    return TextFormField(
      validator: (text) {
        return HelperValidator.nameValidate(
            text!); //Create anothor class for validate
      },
      maxLength: 20,
      maxLines: 1,
      decoration: const InputDecoration(
          labelText: 'Name', hintText: 'Enter your full name'),
      onSaved: (value) {
        _name = value!;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      maxLength: 20,
      validator: (text) {
        if (text!.isEmpty) {
          return "Please enter a valid email";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: 'Email', hintText: 'Enter your email'),
      onSaved: (value) {
        _email = value!;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      obscureText: true,
      maxLength: 10,
      validator: (text) {
        if (text!.isEmpty) {
          return "Please enter a password";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: 'Password', hintText: 'Enter your password'),
      onSaved: (value) {
        _password = value!;
      },
    );
  }

  Widget _buildMobileNumberField() {
    return TextFormField(
      maxLength: 10,
      keyboardType: TextInputType.number,
      validator: (text) {
        if (text!.isEmpty) {
          return "Please enter a mobile number";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: 'Mobile Number', hintText: 'Enter a mobile number'),
      onSaved: (value) {
        _mobile = int.tryParse(value!) ?? 0;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form - Register'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildNameField(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildEmailField(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildPasswordField(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildMobileNumberField(),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple, // Background color
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('valid form');
                        _formKey.currentState?.save();
                      } else {
                        print('not valid form');
                        return;
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Create Validation Class
class HelperValidator {
  static String? nameValidate(String value) {
    if (value.isEmpty) {
      return "Name can't be empty";
    }
    if (value.length < 2) {
      return "Name must be at least 2 characters long";
    }
    if (value.length > 50) {
      return "Name must be less than 50 characters long";
    }
    return null;
  }
}
