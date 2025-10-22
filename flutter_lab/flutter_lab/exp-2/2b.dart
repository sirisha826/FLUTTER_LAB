import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layouts',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Row, Column & Stack Example'),
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),

              /// ROW LAYOUT
              Text(
                'Row Layout',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(width: 60, height: 60, color: Colors.red),
                  Container(width: 60, height: 60, color: Colors.green),
                  Container(width: 60, height: 60, color: Colors.blue),
                ],
              ),
              SizedBox(height: 30),

              /// COLUMN LAYOUT
              Text(
                'Column Layout',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  Container(width: 60, height: 60, color: Colors.orange),
                  Container(width: 60, height: 60, color: Colors.purple),
                  Container(width: 60, height: 60, color: Colors.teal),
                ],
              ),
              SizedBox(height: 30),

              /// STACK LAYOUT
              Text(
                'Stack Layout',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                width: 200,
                height: 200,
                color: Colors.grey[300],
                child: Stack(
                  children: [
                    Container(width: 200, height: 200, color: Colors.yellow),
                    Positioned(
                      top: 30,
                      left: 30,
                      child: Container(width: 100, height: 100, color: Colors.red),
                    ),
                    Positioned(
                      top: 60,
                      left: 60,
                      child: Container(width: 50, height: 50, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
