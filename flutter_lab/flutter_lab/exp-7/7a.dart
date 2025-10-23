import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Form Example",
      home: UserForm(),
    );
  }
}

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();

  String? name;
  String? email;
  String? password;
  String? gender = 'Male';
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Registration Form")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Name Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Enter Name" : null,
                  onSaved: (value) => name = value,
                ),
                SizedBox(height: 16),

                // Email Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) =>
                      value!.isEmpty ? "Enter Email" : null,
                  onSaved: (value) => email = value,
                ),
                SizedBox(height: 16),

                // Password Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) =>
                      value!.length < 6 ? "Minimum 6 characters" : null,
                  onSaved: (value) => password = value,
                ),
                SizedBox(height: 16),

                // Gender Radio Buttons
                Row(
                  children: [
                    Text("Gender: "),
                    Radio<String>(
                      value: 'Male',
                      groupValue: gender,
                      onChanged: (value) =>
                          setState(() => gender = value),
                    ),
                    Text("Male"),
                    Radio<String>(
                      value: 'Female',
                      groupValue: gender,
                      onChanged: (value) =>
                          setState(() => gender = value),
                    ),
                    Text("Female"),
                  ],
                ),
                SizedBox(height: 16),

                // Agree Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: agree,
                      onChanged: (value) =>
                          setState(() => agree = value!),
                    ),
                    Flexible(
                      child: Text("I agree to the terms and conditions"),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && agree) {
                      _formKey.currentState!.save();
                      // Display input
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("Form Submitted"),
                          content: Text(
                            "Name: $name\nEmail: $email\nGender: $gender",
                          ),
                        ),
                      );
                    } else if (!agree) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text("You must agree to the terms")),
                      );
                    }
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
