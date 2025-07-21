import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/model/recipe/ingredient.dart';
import 'package:flutter_recipe_app/presentation/component/list_item/ingredient_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  mockNetworkImagesFor(() {
    group('IngredientItem', () {
      testWidgets('displays ingredient name and whole number weight', (tester) async {
        final ingredient = Ingredient(
          id: '1',
          name: 'Sugar',
          imageUrl: 'https://example.com/sugar.jpg',
          weight: 100.0,
        );

        await tester.pumpWidget(MaterialApp(home: IngredientItem(ingredient: ingredient)));

        expect(find.text('Sugar'), findsOneWidget);
        expect(find.text('100g'), findsOneWidget);
        // We cannot reliably test Image.network loading in widget tests without mocking
        // so we will only check for the absence of the error icon.
        expect(find.byIcon(Icons.image_not_supported), findsNothing);
      });

      testWidgets('displays ingredient name and decimal weight', (tester) async {
        final ingredient = Ingredient(
          id: '2',
          name: 'Flour',
          imageUrl: 'https://example.com/flour.jpg',
          weight: 150.5,
        );

        await tester.pumpWidget(MaterialApp(home: IngredientItem(ingredient: ingredient)));

        expect(find.text('Flour'), findsOneWidget);
        expect(find.text('150.5g'), findsOneWidget);
        expect(find.byIcon(Icons.image_not_supported), findsNothing);
      });

      testWidgets('displays error icon when image fails to load', (tester) async {
        final ingredient = Ingredient(
          id: '3',
          name: 'Salt',
          imageUrl: '', // Invalid URL to trigger errorBuilder
          weight: 10.0,
        );

        await tester.pumpWidget(MaterialApp(home: IngredientItem(ingredient: ingredient)));
        await tester.pumpAndSettle(); // Wait for image to load/fail

        expect(find.text('Salt'), findsOneWidget);
        expect(find.text('10g'), findsOneWidget);
        expect(find.byIcon(Icons.image_not_supported), findsOneWidget);
      });

      testWidgets('does not display CircularProgressIndicator as image loads instantly', (tester) async {
        final ingredient = Ingredient(
          id: '4',
          name: 'Water',
          imageUrl: 'https://example.com/water.jpg',
          weight: 200.0,
        );

        await tester.pumpWidget(MaterialApp(home: IngredientItem(ingredient: ingredient)));

        // With mockNetworkImagesFor, the image loads instantly, so the indicator should not be visible
        expect(find.byType(CircularProgressIndicator), findsNothing);
        expect(find.byIcon(Icons.image_not_supported), findsNothing);
      });
    });
  });
}