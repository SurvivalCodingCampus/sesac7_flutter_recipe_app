import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/02_stateful_widget/data/model/ingredient.dart';
import 'package:flutter_recipe_app/02_stateful_widget/data/model/recipe.dart';
import 'package:flutter_recipe_app/02_stateful_widget/presentation/component/recipe_card.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('RecipeCard renders correctly', (tester) async {
    await mockNetworkImagesFor(() async {
      // given
      final Ingredient ingredient = Ingredient(
        id: 1,
        name: 'Tomatos',
        image:
            'https://cdn.pixabay.com/photo/2017/10/06/17/17/tomato-2823826_1280.jpg',
      );

      final Recipe recipe = Recipe(
        category: 'Indian',
        id: 1,
        name: 'Traditional spare ribs\nbaked',
        image:
            'https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg',
        chef: 'Chef John',
        cookingTime: '20 min',
        rating: 4.0,
        ingredients: [ingredient],
      );

      final testKey = 'testKeyRecipeCard';

      await tester.pumpWidget(
        MaterialApp(
          key: Key(testKey),
          home: RecipeCard(
            recipe: recipe,
            onClick: () {
              print('북마크되었습니다.');
            },
          ),
        ),
      );

      // when & then
      expect(find.byType(RecipeCard), findsOneWidget);
      expect(find.byKey(Key(testKey)), findsOneWidget);

      expect(find.text(recipe.name), findsOneWidget);
      expect(find.text('By ${recipe.chef}'), findsOneWidget);
      expect(find.text('${recipe.rating}'), findsOneWidget);
      expect(find.text(recipe.cookingTime), findsOneWidget);
    });
  });
}
