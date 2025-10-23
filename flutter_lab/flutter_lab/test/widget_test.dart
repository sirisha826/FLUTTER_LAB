import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_lab/custom_button.dart'; // Adjust to your project path

void main() {
  testWidgets('CustomButton displays text and responds to tap', (WidgetTester tester) async {
    bool pressed = false;

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: CustomButton(
          text: 'Click Me',
          onPressed: () { pressed = true; },
        ),
      ),
    );

    // Check if the button text exists
    expect(find.text('Click Me'), findsOneWidget);

    // Tap the button
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify onPressed worked
    expect(pressed, isTrue);
  });
}
