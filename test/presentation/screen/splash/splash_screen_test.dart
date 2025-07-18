import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/medium_button.dart';
import 'package:flutter_recipe_app/presentation/screen/splash/splash_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SplashScreen widget rendering and interaction test', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(const MaterialApp(
      home: SplashScreen(),
    ));

    // Assert: Verify that all the key widgets are rendered

    // 1. Top section widgets
    expect(find.byIcon(Icons.food_bank_outlined), findsOneWidget);
    expect(find.text('100K+ Premium Recipe'), findsOneWidget);

    // 2. Bottom section widgets
    expect(find.text('Get\nCooking'), findsOneWidget);
    expect(find.text('Simple way to find Tasty Recipe'), findsOneWidget);

    // 3. Button
    final startCookingButton = find.widgetWithText(MediumButton, 'Start Cooking');
    expect(startCookingButton, findsOneWidget);

    // Act: Tap the button
    await tester.tap(startCookingButton);
    await tester.pump(); // Rebuild the widget after the tap

    // Assert: Verify that the tap was handled without error
    // (Since onClick is empty, we just ensure no exceptions are thrown)
  });
}