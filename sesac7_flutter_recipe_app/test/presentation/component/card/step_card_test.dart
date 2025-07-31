
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/card/step_card.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StepCard', () {
    testWidgets('StepCard renders correctly with data', (tester) async {
      const String testTitle = 'Step 1';
      const String testDescription = 'This is the first step of the recipe.';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StepCard(
              title: testTitle,
              description: testDescription,
            ),
          ),
        ),
      );

      expect(find.text(testTitle), findsOneWidget);
      expect(find.text(testDescription), findsOneWidget);

      final Container container = tester.widget(find.byType(Container));
      final BoxDecoration decoration = container.decoration as BoxDecoration;
      expect(decoration.color, AppColors.gray4);

      final Text titleText = tester.widget(find.text(testTitle));
      expect(titleText.style, TextStyles.stepCardTitle);

      final Text descriptionText = tester.widget(find.text(testDescription));
      expect(descriptionText.style, TextStyles.stepCardDescription);
    });
  });
}
