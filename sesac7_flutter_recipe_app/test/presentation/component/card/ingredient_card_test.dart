
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/card/ingredient_card.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IngredientCard', () {
    testWidgets('IngredientCard renders correctly with data', (tester) async {
      const String testName = 'Test Ingredient';
      const String testImage = 'assets/home_category_image_sample.jpg';
      const int testAmount = 150;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IngredientCard(
              name: testName,
              image: testImage,
              amount: testAmount,
            ),
          ),
        ),
      );

      expect(find.text(testName), findsOneWidget);
      expect(find.text('${testAmount}g'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);

      final Container container = tester.widget(find.byType(Container).first);
      final BoxDecoration decoration = container.decoration as BoxDecoration;
      expect(decoration.color, AppColors.gray4);

      final Text nameText = tester.widget(find.text(testName));
      expect(nameText.style, TextStyles.ingredientCardTitle);

      final Text amountText = tester.widget(find.text('${testAmount}g'));
      expect(amountText.style, TextStyles.ingredientCardAmount);
    });
  });
}
