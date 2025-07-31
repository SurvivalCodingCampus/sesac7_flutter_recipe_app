import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/presentation/component/button/search_recipe_filter_button.dart';
import 'package:flutter_recipe_app/presentation/component/card/search_recipe_card.dart';
import 'package:flutter_recipe_app/presentation/component/text_field/search_input_field.dart';
import 'package:flutter_recipe_app/presentation/component/title_bar/screen_title_bar.dart';
import 'package:flutter_recipe_app/presentation/search_recipe/search_recipes_action.dart';
import 'package:flutter_recipe_app/presentation/search_recipe/search_recipes_screen.dart';
import 'package:flutter_recipe_app/presentation/search_recipe/search_recipes_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_recipe_app/domain/model/ingredients.dart';
import 'package:flutter_recipe_app/domain/model/ingredient.dart';

final testRecipe = Recipe(
  id: 1,
  name: 'Test Recipe',
  image: 'https://example.com/test.jpg',
  category: 'Test',
  chef: 'Test Chef',
  time: '10min',
  rating: 4.0,
  ingredients: [
    Ingredients(
      ingredient: Ingredient(id: 1, name: 'Test Ing', image: 'test.jpg'),
      amount: 100,
    ),
  ],
);

void main() {
  group('SearchRecipesScreen', () {
    testWidgets('SearchRecipesScreen renders correctly with recent recipes', (
      tester,
    ) async {
      final SearchRecipesState initialState = SearchRecipesState(
        recentRecipes: [testRecipe],
        searchKeyword: '',
        isCategorySearch: false,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: SearchRecipesScreen(
            searchRecipesState: initialState,
            onAction: (action) {},
          ),
        ),
      );

      expect(find.byType(ScreenTitleBar), findsOneWidget);
      expect(find.text('Search recipes'), findsOneWidget);
      expect(find.byType(SearchInputField), findsOneWidget);
      expect(find.byType(SearchRecipeFilterButton), findsOneWidget);
      expect(find.text('Recent Search'), findsOneWidget);
      expect(find.byType(SearchRecipeCard), findsOneWidget);
      expect(find.text(testRecipe.name), findsOneWidget);
    });

    testWidgets('SearchRecipesScreen renders correctly with search results', (
      tester,
    ) async {
      final SearchRecipesState initialState = SearchRecipesState(
        searchResultRecipes: [testRecipe],
        searchKeyword: 'pizza',
        isCategorySearch: false,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: SearchRecipesScreen(
            searchRecipesState: initialState,
            onAction: (action) {},
          ),
        ),
      );

      expect(find.text('Search Result'), findsOneWidget);
      expect(find.text('1 result'), findsOneWidget);
      expect(find.byType(SearchRecipeCard), findsOneWidget);
      expect(find.text(testRecipe.name), findsOneWidget);
    });

    testWidgets('onAction is called when SearchInputField changes keyword', (
      tester,
    ) async {
      String? capturedKeyword;
      await tester.pumpWidget(
        MaterialApp(
          home: SearchRecipesScreen(
            searchRecipesState: const SearchRecipesState(),
            onAction: (action) {
              action.whenOrNull(
                changeKeyword: (keyword) {
                  capturedKeyword = keyword;
                },
              );
            },
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'new keyword');
      await tester.pump();

      expect(capturedKeyword, 'new keyword');
    });

    testWidgets('onAction is called when SearchRecipeFilterButton is tapped', (
      tester,
    ) async {
      SearchRecipesAction? capturedAction;
      await tester.pumpWidget(
        MaterialApp(
          home: SearchRecipesScreen(
            searchRecipesState: const SearchRecipesState(),
            onAction: (action) {
              capturedAction = action;
            },
          ),
        ),
      );

      await tester.tap(find.byType(SearchRecipeFilterButton));
      await tester.pump();

      expect(capturedAction, SearchRecipesAction.showFilterBottomSheet());
    });
  });
}
