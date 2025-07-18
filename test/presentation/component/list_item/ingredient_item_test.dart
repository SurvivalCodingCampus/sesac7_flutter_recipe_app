import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/model/recipe/ingredient.dart';
import 'package:flutter_recipe_app/presentation/component/list_item/ingredient_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IngredientItem', () {
    testWidgets('displays ingredient name and whole number weight', (
      tester,
    ) async {
      final ingredient = Ingredient(
        id: '1',
        name: 'Sugar',
        imageUrl: 'https://example.com/sugar.jpg',
        weight: 100.0,
      );

      await tester.pumpWidget(
        MaterialApp(home: IngredientItem(ingredient: ingredient)),
      );

      expect(find.text('Sugar'), findsOneWidget);
      expect(find.text('100g'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('displays ingredient name and decimal weight', (tester) async {
      final ingredient = Ingredient(
        id: '2',
        name: 'Flour',
        imageUrl: 'https://example.com/flour.jpg',
        weight: 150.5,
      );

      await tester.pumpWidget(
        MaterialApp(home: IngredientItem(ingredient: ingredient)),
      );

      expect(find.text('Flour'), findsOneWidget);
      expect(find.text('150.5g'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('displays error icon when image fails to load', (tester) async {
      final ingredient = Ingredient(
        id: '3',
        name: 'Salt',
        imageUrl: '', // Invalid URL to trigger errorBuilder
        weight: 10.0,
      );

      await tester.pumpWidget(
        MaterialApp(home: IngredientItem(ingredient: ingredient)),
      );
      await tester.pumpAndSettle(); // Wait for image to load/fail

      expect(find.text('Salt'), findsOneWidget);
      expect(find.text('10g'), findsOneWidget);
      expect(find.byIcon(Icons.image_not_supported), findsOneWidget);
    });
  });
}
