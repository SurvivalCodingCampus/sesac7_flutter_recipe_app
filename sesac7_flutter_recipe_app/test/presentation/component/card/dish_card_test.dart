import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/presentation/component/card/dish_card.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_recipe_app/presentation/component/button/bookmark_button.dart';
import 'package:flutter_recipe_app/domain/model/ingredients.dart';
import 'package:flutter_recipe_app/domain/model/ingredient.dart';

void main() {
  group('DishCard', () {
    final testRecipe = Recipe(
      id: 1,
      name: 'Delicious Test Dish Name',
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

    testWidgets('DishCard renders correctly with recipe data', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DishCard(
              recipe: testRecipe,
              isBookmark: false,
              onTapBookmark: (id) {},
            ),
          ),
        ),
      );

      expect(find.text(testRecipe.name), findsOneWidget);
      expect(find.text(testRecipe.time), findsOneWidget);
      expect(find.text(testRecipe.rating.toString()), findsOneWidget);
      expect(find.byType(BookmarkButton), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('onTapBookmark is called when BookmarkButton is tapped', (
      tester,
    ) async {
      int tappedRecipeId = 0;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DishCard(
              recipe: testRecipe,
              isBookmark: false,
              onTapBookmark: (id) {
                tappedRecipeId = id;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BookmarkButton));
      await tester.pump();

      expect(tappedRecipeId, testRecipe.id);
    });

    testWidgets('BookmarkButton is selected based on isBookmark prop', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DishCard(
              recipe: testRecipe,
              isBookmark: true,
              onTapBookmark: (id) {},
            ),
          ),
        ),
      );

      final BookmarkButton bookmarkButton = tester.widget(
        find.byType(BookmarkButton),
      );
      expect(bookmarkButton.isSelected, isTrue);
    });
  });
}
