import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Animation Types Example",
      home: AnimationTypesDemo(),
    );
  }
}

class AnimationTypesDemo extends StatefulWidget {
  @override
  _AnimationTypesDemoState createState() => _AnimationTypesDemoState();
}

class _AnimationTypesDemoState extends State<AnimationTypesDemo>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _scaleController;
  late AnimationController _rotateController;

  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _slideController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _slideAnimation =
        Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.easeInOut),
    );

    _scaleController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _rotateController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _scaleController.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Different Animation Types")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _fadeController,
              child: SlideTransition(
                position: _slideAnimation,
                child: ScaleTransition(
                  scale: _scaleController,
                  child: RotationTransition(
                    turns: _rotateController,
                    child: FlutterLogo(size: 100),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () => _fadeController.forward(from: 0),
                  child: Text("Fade"),
                ),
                ElevatedButton(
                  onPressed: () => _slideController.forward(from: 0),
                  child: Text("Slide"),
                ),
                ElevatedButton(
                  onPressed: () => _scaleController.forward(from: 0),
                  child: Text("Scale"),
                ),
                ElevatedButton(
                  onPressed: () => _rotateController.forward(from: 0),
                  child: Text("Rotate"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
