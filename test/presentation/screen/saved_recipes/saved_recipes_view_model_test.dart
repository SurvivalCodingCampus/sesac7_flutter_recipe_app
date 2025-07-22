import 'package:flutter_recipe_app/core/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/data/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/data/repository/recipe/recipe_repository.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_recipes/saved_recipes_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'saved_recipes_view_model_test.mocks.dart';

// Mock listener to verify notifyListeners is called
class MockListener extends Mock {
  void call();
}

@GenerateMocks([RecipeRepository])
void main() {
  late SavedRecipesViewModel viewModel;
  late MockRecipeRepository mockRecipeRepository;
  late MockListener listener;

  setUpAll(() {
    provideDummy<Result<List<Recipe>, NetworkError>>(
      Result.success([]),
    );
  });

  setUp(() {
    mockRecipeRepository = MockRecipeRepository();
    viewModel = SavedRecipesViewModel(recipeRepository: mockRecipeRepository);
    listener = MockListener();
    viewModel.addListener(listener.call);
  });

  tearDown(() {
    viewModel.removeListener(listener.call);
  });

  group('fetchSavedRecipes', () {
    final mockRecipes = [
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
      Recipe(
        id: '2',
        name: 'Test Recipe 2',
        category: 'Test',
        creator: 'Chef',
        imageUrl: '',
        cookingTime: '20 min',
        rating: 4.5,
        ingredients: [],
      ),
    ];

    test(
      'Success case: When recipes are fetched successfully, savedRecipes is updated and errorMessage is null',
      () async {
        // Arrange
        final successResult = Result<List<Recipe>, NetworkError>.success(
          mockRecipes,
        );
        when(
          mockRecipeRepository.fetchAllRecipes(),
        ).thenAnswer((_) async => successResult);

        // Act
        await viewModel.fetchSavedRecipes();

        // Assert
        expect(viewModel.state.savedRecipes, mockRecipes);
        expect(viewModel.state.errorMessage, isNull);
        verify(mockRecipeRepository.fetchAllRecipes()).called(1);
        verify(listener.call()).called(1);
      },
    );

    test(
      'Failure case: When fetching recipes fails, errorMessage is updated and savedRecipes is empty',
      () async {
        // Arrange
        final errorResult = Result<List<Recipe>, NetworkError>.error(
          NetworkError.unknown,
        );
        when(
          mockRecipeRepository.fetchAllRecipes(),
        ).thenAnswer((_) async => errorResult);

        // Act
        await viewModel.fetchSavedRecipes();

        // Assert
        expect(viewModel.state.savedRecipes, isEmpty);
        expect(viewModel.state.errorMessage, isNotNull);
        expect(
          viewModel.state.errorMessage,
          'Failed to fetch saved recipes with error: ${NetworkError.unknown}',
        );
        verify(mockRecipeRepository.fetchAllRecipes()).called(1);
        verify(listener.call()).called(1);
      },
    );
  });
}
