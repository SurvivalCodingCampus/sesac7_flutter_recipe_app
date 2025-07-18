
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/presentation/component/list_item/recipe_card.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_recipes/saved_recipes_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_recipes/saved_recipes_view_model.dart';
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
    testWidgets('displays "No saved recipes found." message when there is no data', (tester) async {
      // Arrange
      when(mockViewModel.savedRecipes).thenReturn([]);
      when(mockViewModel.errorMessage).thenReturn(null);

      // Act
      await tester.pumpWidget(createWidget());

      // Assert
      expect(find.text('No saved recipes found.'), findsOneWidget);
      expect(find.byType(ListView), findsNothing);
    });

    testWidgets('displays an error message when there is an error', (tester) async {
      // Arrange
      const errorMessage = 'An error occurred';
      when(mockViewModel.savedRecipes).thenReturn([]);
      when(mockViewModel.errorMessage).thenReturn(errorMessage);

      // Act
      await tester.pumpWidget(createWidget());

      // Assert
      expect(find.text(errorMessage), findsOneWidget);
      expect(find.byType(ListView), findsNothing);
    });

    testWidgets('displays a list of RecipeCards when data is available', (tester) async {
      // Arrange
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
      when(mockViewModel.savedRecipes).thenReturn(recipes);
      when(mockViewModel.errorMessage).thenReturn(null);

      // Act
      await tester.pumpWidget(createWidget());

      // Assert
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(RecipeCard), findsOneWidget);
      expect(find.text('Test Recipe 1'), findsOneWidget);
    });
  });
}
