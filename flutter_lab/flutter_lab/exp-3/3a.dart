import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive UI Demo',
      home: ResponsiveHome(),
    );
  }
}

class ResponsiveHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive UI'),
        backgroundColor: Colors.blueAccent,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          if (width < 600) {
            // Small Screen (Mobile)
            return buildMobileLayout();
          } else if (width < 1000) {
            // Medium Screen (Tablet)
            return buildTabletLayout();
          } else {
            // Large Screen (Desktop)
            return buildDesktopLayout();
          }
        },
      ),
    );
  }

  /// Mobile Layout
  Widget buildMobileLayout() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.phone_android, size: 80, color: Colors.green),
          Text('Mobile Layout', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }

  /// Tablet Layout
  Widget buildTabletLayout() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.tablet_mac, size: 80, color: Colors.orange),
          Text('Tablet Layout', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }

  /// Desktop Layout
  Widget buildDesktopLayout() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.desktop_windows, size: 80, color: Colors.blue),
          Text('Desktop Layout', style: TextStyle(fontSize: 24)),
          Icon(Icons.desktop_windows, size: 80, color: Colors.blue),
        ],
      ),
    );
  }
}
