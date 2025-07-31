import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/presentation/component/card/search_recipe_card.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_recipe_app/domain/model/ingredients.dart';
import 'package:flutter_recipe_app/domain/model/ingredient.dart';

void main() {
  final testRecipe = Recipe(
    id: 1,
    name: 'Delicious Search Recipe Name',
    image: 'assets/home_category_image_sample.jpg',
    category: 'Test',
    chef: 'Test Chef',
    time: '30 min',
    rating: 4.5,
    ingredients: [
      Ingredients(
        ingredient: Ingredient(id: 1, name: 'Test Ing', image: 'test.jpg'),
        amount: 100,
      ),
    ],
  );

  group('SearchRecipeCard', () {
    testWidgets('SearchRecipeCard renders correctly with recipe data', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SearchRecipeCard(
              recipe: testRecipe,
            ),
          ),
        ),
      );

      expect(find.text(testRecipe.name), findsOneWidget);
      expect(find.text('By ${testRecipe.chef}'), findsOneWidget);
      expect(find.text(testRecipe.rating.toString()), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });
  });
}
