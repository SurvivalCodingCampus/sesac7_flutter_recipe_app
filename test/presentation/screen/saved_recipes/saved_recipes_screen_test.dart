import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/presentation/component/list_item/recipe_card.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_screen.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_state.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'saved_recipes_screen_test.mocks.dart';

@GenerateMocks([SavedRecipesViewModel])
void main() {
  late MockSavedRecipesViewModel mockViewModel;

  setUp(() {
    mockViewModel = MockSavedRecipesViewModel();
  });

  Widget createWidget() {
    return MaterialApp(
      home: SavedRecipesScreen(viewModel: mockViewModel),
    );
  }

  group('SavedRecipesScreen', () {
    testWidgets(
      'displays "No saved recipes found." message when there is no data',
      (tester) async {
        // Given
        when(
          mockViewModel.state,
        ).thenReturn(
          SavedRecipesState(
            savedRecipes: [],
            errorMessage: null,
          ),
        );

        // When
        await tester.pumpWidget(createWidget());

        // Then
        expect(find.text('No saved recipes found.'), findsOneWidget);
        expect(find.byType(ListView), findsNothing);
      },
    );

    testWidgets('displays an error message when there is an error', (
      tester,
    ) async {
      // Given
      const errorMessage = 'An error occurred';
      when(mockViewModel.state).thenReturn(
        SavedRecipesState(
          savedRecipes: [],
          errorMessage: errorMessage,
        ),
      );

      // When
      await tester.pumpWidget(createWidget());

      // Then
      expect(find.text(errorMessage), findsOneWidget);
      expect(find.byType(ListView), findsNothing);
    });

    testWidgets('displays a list of RecipeCards when data is available', (
      tester,
    ) async {
      // Given
      final recipes = [
        Recipe(
          id: '1',
          name: 'Test Recipe 1',
          category: 'Test',
          creator: 'Chef',
          imageUrl: '',
          cookingTime: '10 min',
          rating: 5.0,
          ingredients: [],
        ),
      ];
      when(mockViewModel.state).thenReturn(
        SavedRecipesState(
          savedRecipes: recipes,
          errorMessage: null,
        ),
      );

      // When
      await tester.pumpWidget(createWidget());

      // Then
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(RecipeCard), findsOneWidget);
      expect(find.text('Test Recipe 1'), findsOneWidget);
    });
  });
}
