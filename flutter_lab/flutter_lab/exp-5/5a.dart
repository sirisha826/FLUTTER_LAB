import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Root Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Stateless & Stateful Demo",
      home: HomeScreen(),
    );
  }
}

// --------------------
// Home Screen
// --------------------
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
              child: Text("Go to Stateless Example"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StatelessExample()),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Go to Stateful Example"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StatefulExample()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// --------------------
// Stateless Widget Example
// --------------------
class StatelessExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stateless Widget")),
      body: Center(
        child: Text(
          "I am a Stateless Widget.\nI don't change!",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, color: Colors.blue),
        ),
      ),
    );
  }
}

// --------------------
// Stateful Widget Example
// --------------------
class StatefulExample extends StatefulWidget {
  @override
  _StatefulExampleState createState() => _StatefulExampleState();
}

class _StatefulExampleState extends State<StatefulExample> {
  int counter = 0; // mutable state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stateful Widget")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter Value: $counter",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // change state → UI rebuilds
                setState(() {
                  counter++;
                });
              },
              child: Text("Increment Counter"),
            ),
          ],
        ),
      ),
    );
  }
}
