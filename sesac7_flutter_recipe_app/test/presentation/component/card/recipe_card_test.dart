import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/presentation/component/button/bookmark_button.dart';
import 'package:flutter_recipe_app/presentation/component/card/recipe_card.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_recipe_app/domain/model/ingredients.dart';
import 'package:flutter_recipe_app/domain/model/ingredient.dart';

final testRecipe = Recipe(
  id: 1,
  name: 'Delicious Test Recipe Name',
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

void main() {
  group('RecipeCard', () {
    testWidgets('RecipeCard renders correctly with recipe data', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RecipeCard(
              recipe: testRecipe,
              isBookmark: false,
              onTap: (id) {},
              onBookmarkClick: () {},
            ),
          ),
        ),
      );

      expect(find.text(testRecipe.name), findsOneWidget);
      expect(find.text('By ${testRecipe.chef}'), findsOneWidget);
      expect(find.text(testRecipe.time), findsOneWidget);
      expect(find.text(testRecipe.rating.toString()), findsOneWidget);
      expect(find.byType(BookmarkButton), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('onTap is called when RecipeCard is tapped', (tester) async {
      int tappedRecipeId = 0;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RecipeCard(
              recipe: testRecipe,
              isBookmark: false,
              onTap: (id) {
                tappedRecipeId = id;
              },
              onBookmarkClick: () {},
            ),
          ),
        ),
      );

      await tester.tap(find.byType(RecipeCard));
      await tester.pump();

      expect(tappedRecipeId, testRecipe.id);
    });

    testWidgets('onBookmarkClick is called when BookmarkButton is tapped', (
      tester,
    ) async {
      bool bookmarkClicked = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RecipeCard(
              recipe: testRecipe,
              isBookmark: false,
              onTap: (id) {},
              onBookmarkClick: () {
                bookmarkClicked = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BookmarkButton));
      await tester.pump();

      expect(bookmarkClicked, isTrue);
    });

    testWidgets('BookmarkButton is selected based on isBookmark prop', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RecipeCard(
              recipe: testRecipe,
              isBookmark: true,
              onTap: (id) {},
              onBookmarkClick: () {},
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
