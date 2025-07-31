import 'package:flutter/material.dart';
import 'package:flutter_image_test_utils/image_test/image_test.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/ingredient.dart';
import 'package:flutter_recipe_app/core/presentation/component/list_item/ingredient_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IngredientItem', () {
    testWidgets('Given an ingredient with a whole number weight, '
        'When the widget is rendered, '
        'Then it should display the name and formatted weight correctly', (
      tester,
    ) async {
      await provideMockedNetworkImages(() async {
        // Given
        final ingredient = Ingredient(
          id: '1',
          name: 'Sugar',
          imageUrl: 'https://example.com/sugar.jpg',
          weight: 100.0,
        );

        // When
        await tester.pumpWidget(
          MaterialApp(home: IngredientItem(ingredient: ingredient)),
        );
        await tester.pump(); // Allow the image to "load"

        // Then
        expect(find.text('Sugar'), findsOneWidget);
        expect(find.text('100g'), findsOneWidget);
        expect(find.byIcon(Icons.image_not_supported), findsNothing);
      });
    });

    testWidgets('Given an ingredient with a decimal weight, '
        'When the widget is rendered, '
        'Then it should display the name and formatted weight correctly', (
      tester,
    ) async {
      await provideMockedNetworkImages(() async {
        // Given
        final ingredient = Ingredient(
          id: '2',
          name: 'Flour',
          imageUrl: 'https://example.com/flour.jpg',
          weight: 150.5,
        );

        // When
        await tester.pumpWidget(
          MaterialApp(home: IngredientItem(ingredient: ingredient)),
        );
        await tester.pump(); // Allow the image to "load"

        // Then
        expect(find.text('Flour'), findsOneWidget);
        expect(find.text('150.5g'), findsOneWidget);
        expect(find.byIcon(Icons.image_not_supported), findsNothing);
      });
    });
  });
}
