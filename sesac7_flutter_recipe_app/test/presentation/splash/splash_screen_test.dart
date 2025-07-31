import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/medium_button.dart';
import 'package:flutter_recipe_app/presentation/splash/splash_action.dart';
import 'package:flutter_recipe_app/presentation/splash/splash_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SplashScreen', () {
    testWidgets('SplashScreen renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SplashScreen(
            onAction: (action) {},
          ),
        ),
      );

      expect(find.byType(Image), findsNWidgets(2)); // Background and logo
      expect(find.text('100K+ Premium Recipe'), findsOneWidget);
      expect(find.text('Get Cooking'), findsOneWidget);
      expect(find.text('Simple way to find Tasty Recipe'), findsOneWidget);
      expect(find.byType(MediumButton), findsOneWidget);
      expect(find.text('Start Cooking'), findsOneWidget);
    });

    testWidgets('onAction is called when Start Cooking button is tapped', (
      tester,
    ) async {
      SplashAction? capturedAction;
      await tester.pumpWidget(
        MaterialApp(
          home: SplashScreen(
            onAction: (action) {
              capturedAction = action;
            },
          ),
        ),
      );

      await tester.tap(find.byType(MediumButton));
      await tester.pump();

      expect(capturedAction, const SplashAction.clickStartButton());
    });
  });
}
