import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/presentation/component/card/recipe_card.dart';
import 'package:flutter_recipe_app/presentation/component/title_bar/screen_title_bar.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_action.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_screen.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_recipe_app/presentation/component/button/bookmark_button.dart';
import 'package:flutter_recipe_app/domain/model/ingredients.dart';
import 'package:flutter_recipe_app/domain/model/ingredient.dart';

void main() {
  group('SavedRecipeScreen', () {
    final testRecipe = Recipe(
      id: 1,
      name: 'Delicious Saved Recipe',
      image: 'https://example.com/saved_image.jpg',
      category: 'Saved',
      chef: 'Saved Chef',
      time: '15 min',
      rating: 4.8,
      ingredients: [
        Ingredients(
          ingredient: Ingredient(id: 1, name: 'Saved Ing', image: 'saved.jpg'),
          amount: 50,
        ),
      ],
    );

    testWidgets('SavedRecipeScreen renders correctly with saved recipes', (
      tester,
    ) async {
      final SavedRecipeState initialState = SavedRecipeState(
        savedRecipes: [testRecipe],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: SavedRecipeScreen(
            savedRecipeState: initialState,
            onAction: (action) {},
          ),
        ),
      );

      expect(find.byType(ScreenTitleBar), findsOneWidget);
      expect(find.text('Saved recipes'), findsOneWidget);
      expect(find.byType(RecipeCard), findsOneWidget);
      expect(find.text(testRecipe.name), findsOneWidget);
    });

    testWidgets('onAction is called when RecipeCard is tapped', (tester) async {
      SavedRecipeAction? capturedAction;
      final SavedRecipeState initialState = SavedRecipeState(
        savedRecipes: [testRecipe],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: SavedRecipeScreen(
            savedRecipeState: initialState,
            onAction: (action) {
              capturedAction = action;
            },
          ),
        ),
      );

      await tester.tap(find.byType(RecipeCard));
      await tester.pump();

      expect(
        capturedAction,
        SavedRecipeAction.moveSavedRecipeIngredientScreen(testRecipe.id),
      );
    });

    testWidgets(
      'onAction is called when RecipeCard bookmark button is tapped',
      (tester) async {
        SavedRecipeAction? capturedAction;
        final SavedRecipeState initialState = SavedRecipeState(
          savedRecipes: [testRecipe],
        );

        await tester.pumpWidget(
          MaterialApp(
            home: SavedRecipeScreen(
              savedRecipeState: initialState,
              onAction: (action) {
                capturedAction = action;
              },
            ),
          ),
        );

        await tester.tap(find.byType(BookmarkButton));
        await tester.pump();

        expect(
          capturedAction,
          SavedRecipeAction.removeSavedRecipe(testRecipe.id),
        );
      },
    );
  });
}
