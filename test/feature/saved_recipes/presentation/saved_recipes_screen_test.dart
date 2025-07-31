import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/presentation/component/list_item/recipe_card.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_action.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_screen.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'saved_recipes_screen_test.mocks.dart';

// Because mockito cannot mock a function type directly (void Function(SavedRecipesAction)),
// we create an abstract class to represent the function and mock it.
abstract class OnAction {
  void call(SavedRecipesAction action);
}

@GenerateMocks([OnAction])
void main() {
  late MockOnAction mockOnAction;

  setUp(() {
    mockOnAction = MockOnAction();
  });

  Widget createWidget({required SavedRecipesState state}) {
    return MaterialApp(
      home: SavedRecipesScreen(
        state: state,
        onAction: mockOnAction.call,
      ),
    );
  }

  group('SavedRecipesScreen', () {
    testWidgets('displays CircularProgressIndicator when loading', (
      tester,
    ) async {
      // Given
      const state = SavedRecipesState(isLoading: true);

      // When
      await tester.pumpWidget(createWidget(state: state));

      // Then
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets(
      'displays "No saved recipes found." message when the list is empty and not loading',
      (tester) async {
        // Given
        const state = SavedRecipesState(savedRecipes: [], isLoading: false);

        // When
        await tester.pumpWidget(createWidget(state: state));

        // Then
        expect(find.text('No saved recipes found.'), findsOneWidget);
        expect(find.byType(ListView), findsNothing);
      },
    );

    testWidgets('displays a list of RecipeCards when data is available', (
      tester,
    ) async {
      // Given
      final recipes = <Recipe>[
        const Recipe(
          id: '1',
          name: 'Test Recipe 1',
          category: 'Test',
          creator: 'Chef',
          imageUrl: '',
          imageWithoutBackground: '',
          cookingTime: '10 min',
          rating: 5.0,
          reviewCount: 10,
          serve: 2,
          isSaved: false,
        ),
      ];
      final state = SavedRecipesState(savedRecipes: recipes, isLoading: false);

      // When
      await tester.pumpWidget(createWidget(state: state));

      // Then
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(RecipeCard), findsOneWidget);
      expect(find.text('Test Recipe 1'), findsOneWidget);
    });

    testWidgets(
      'calls onAction with TapRecipeCard when a recipe card is tapped',
      (tester) async {
        // Given
        final recipes = <Recipe>[
          const Recipe(
            id: '1',
            name: 'Test Recipe 1',
            category: 'Test',
            creator: 'Chef',
            imageUrl: '',
            imageWithoutBackground: '',
            cookingTime: '10 min',
            rating: 5.0,
            reviewCount: 10,
            serve: 2,
            isSaved: false,
          ),
        ];
        final state = SavedRecipesState(
          savedRecipes: recipes,
          isLoading: false,
        );
        await tester.pumpWidget(createWidget(state: state));

        // When
        await tester.tap(find.byType(RecipeCard));
        await tester.pump();

        // Then
        verify(mockOnAction(const TapRecipeCard('1'))).called(1);
      },
    );

    testWidgets(
      'calls onAction with TapRecipeBookmark when a bookmark is tapped',
      (tester) async {
        // Given
        final recipes = <Recipe>[
          const Recipe(
            id: '1',
            name: 'Test Recipe 1',
            category: 'Test',
            creator: 'Chef',
            imageUrl: '',
            imageWithoutBackground: '',
            cookingTime: '10 min',
            rating: 5.0,
            reviewCount: 10,
            serve: 2,
            isSaved: false,
          ),
        ];
        final state = SavedRecipesState(
          savedRecipes: recipes,
          isLoading: false,
        );
        await tester.pumpWidget(createWidget(state: state));

        // When
        // The bookmark button is an Icon within an InkWell.
        await tester.tap(find.byIcon(Icons.bookmark_outline));
        await tester.pump();

        // Then
        verify(mockOnAction(const TapRecipeBookmark('1'))).called(1);
      },
    );
  });
}
