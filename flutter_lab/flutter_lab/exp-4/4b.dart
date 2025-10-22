import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Named Routes Example",
      // Define all named routes here
      initialRoute: '/', // default route (HomeScreen)
      routes: {
        '/': (context) => HomeScreen(), // root route
        '/second': (context) => SecondScreen(),
        '/third': (context) => ThirdScreen(),
      },
    );
  }
}

// First Screen (Home)
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Go to Second Screen"),
              onPressed: () {
                // Navigate using named route
                Navigator.pushNamed(context, '/second');
              },
            ),
            ElevatedButton(
              child: Text("Go to Third Screen"),
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Second Screen
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
      body: Center(
        child: ElevatedButton(
          child: Text("Back to Home"),
          onPressed: () {
            Navigator.pop(context); // Go back to previous screen
          },
        ),
      ),
    );
  }
}

// Third Screen
class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Third Screen")),
      body: Center(
        child: ElevatedButton(
          child: Text("Back to Home"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
