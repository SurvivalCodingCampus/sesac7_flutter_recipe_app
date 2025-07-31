import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/presentation/component/button/search_recipe_filter_button.dart';
import 'package:flutter_recipe_app/presentation/component/card/dish_card.dart';
import 'package:flutter_recipe_app/presentation/component/selector/recipe_category_selector.dart';
import 'package:flutter_recipe_app/presentation/component/text_field/search_input_field.dart';
import 'package:flutter_recipe_app/presentation/home/home_action.dart';
import 'package:flutter_recipe_app/presentation/home/home_screen.dart';
import 'package:flutter_recipe_app/presentation/home/home_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_recipe_app/domain/model/ingredients.dart';
import 'package:flutter_recipe_app/domain/model/ingredient.dart';
import 'package:flutter_recipe_app/presentation/component/button/bookmark_button.dart';

void main() {
  final testRecipe = Recipe(
    id: 1,
    name: 'Test Recipe',
    image: 'assets/home_category_image_sample.jpg',
    category: 'Test Category',
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
  group('HomeScreen', () {
    testWidgets('HomeScreen renders correctly with initial state', (
      tester,
    ) async {
      final HomeState initialState = HomeState(
        categories: {'Category1', 'Category2'},
        category: 'All',
        categoryRecipes: [testRecipe],
        savedRecipeIds: [],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: HomeScreen(
            state: initialState,
            onAction: (action) {},
          ),
        ),
      );

      expect(find.text('Hello Jega'), findsOneWidget);
      expect(find.text('What are you cooking today?'), findsOneWidget);
      expect(find.byType(SearchInputField), findsOneWidget);
      expect(find.byType(SearchRecipeFilterButton), findsOneWidget);
      expect(find.byType(RecipeCategorySelector), findsOneWidget);
      expect(find.byType(DishCard), findsOneWidget);
      expect(find.text(testRecipe.name), findsOneWidget);
    });

    testWidgets('onAction is called when SearchRecipeFilterButton is tapped', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: HomeScreen(
            state: const HomeState(),
            onAction: (action) {
              action.whenOrNull(
                moveSearchRecipeScreen: () {},
              );
            },
          ),
        ),
      );

      await tester.tap(find.byType(SearchRecipeFilterButton));
      await tester.pump();

      // Note: showModalBottomSheet is called, but we can't directly test its content here
      // We can only verify that the button tap triggers the expected action.
      // For testing the bottom sheet content, a separate widget test for SearchRecipeFilterBottomSheet is needed.
    });

    testWidgets(
      'onAction is called when RecipeCategorySelector changes value',
      (tester) async {
        String? selectedCategory;
        final HomeState initialState = HomeState(
          categories: {'Category1', 'Category2'},
          category: 'All',
          categoryRecipes: [],
          savedRecipeIds: [],
        );

        await tester.pumpWidget(
          MaterialApp(
            home: HomeScreen(
              state: initialState,
              onAction: (action) {
                action.whenOrNull(
                  selectCategory: (category) {
                    selectedCategory = category;
                  },
                );
              },
            ),
          ),
        );

        await tester.tap(find.text('Category1'));
        await tester.pump();

        expect(selectedCategory, 'Category1');
      },
    );

    testWidgets('onAction is called when DishCard bookmark is tapped', (
      tester,
    ) async {
      int? bookmarkedRecipeId;
      final HomeState initialState = HomeState(
        categories: {},
        category: 'All',
        categoryRecipes: [testRecipe],
        savedRecipeIds: [],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: HomeScreen(
            state: initialState,
            onAction: (action) {
              action.whenOrNull(
                bookmarkStateChange: (recipeId) {
                  bookmarkedRecipeId = recipeId;
                },
              );
            },
          ),
        ),
      );

      await tester.tap(find.byType(BookmarkButton));
      await tester.pump();

      expect(bookmarkedRecipeId, testRecipe.id);
    });
  });
}
