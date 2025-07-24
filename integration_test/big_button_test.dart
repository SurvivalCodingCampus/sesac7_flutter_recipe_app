import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/big_button.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('BigButton toggles color and triggers callback', (
    WidgetTester tester,
  ) async {
    bool wasClicked = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BigButton(
            text: 'Start',
            onClick: () {
              wasClicked = true;
            },
          ),
        ),
      ),
    );

    final buttonFinder = find.byType(BigButton);

    final initialContainer = tester.widget<AnimatedContainer>(
      find.byType(AnimatedContainer),
    );
    final initialColor = (initialContainer.decoration as BoxDecoration).color;
    expect(initialColor, equals(AppColors.primary100));

    await tester.tap(buttonFinder);
    await tester.pump();

    final tappedContainer = tester.widget<AnimatedContainer>(
      find.byType(AnimatedContainer),
    );
    final newColor = (tappedContainer.decoration as BoxDecoration).color;
    expect(newColor, equals(AppColors.gray4));
  });
}
