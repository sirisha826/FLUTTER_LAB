import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Experiment 10b - Debugging',
      home: DebugScreen(),
    );
  }
}

class DebugScreen extends StatefulWidget {
  @override
  _DebugScreenState createState() => _DebugScreenState();
}

class _DebugScreenState extends State<DebugScreen> {
  final TextEditingController _nameController = TextEditingController();
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    debugPrint("DebugScreen initialized"); // DevTools & console logging
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
    debugPrint("Like button toggled: $isLiked"); // Track state change
  }

  void submitForm() {
    debugPrint("Submit button pressed");
    debugPrint("Name entered: ${_nameController.text}");

    // You can set a breakpoint here in IDE
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Form Submitted"),
        content: Text("Name: ${_nameController.text}\nLiked: $isLiked"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Debugging Demo")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                key: Key('customButton'),
                text: 'Click Me',
                onPressed: () {
                  debugPrint("Custom button pressed");
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                key: Key('nameField'),
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                key: Key('submitButton'),
                onPressed: submitForm,
                child: Text('Submit'),
              ),
              SizedBox(height: 20),
              IconButton(
                key: Key('likeButton'),
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.grey,
                  size: 32,
                ),
                onPressed: toggleLike,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Reusable Custom Button Widget
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
