import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/domain/use_case/remove_saved_recipe_use_case.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_action.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_event.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'saved_recipes_view_model_test.mocks.dart';

@GenerateMocks([GetSavedRecipesUseCase, RemoveSavedRecipeUseCase])
void main() {
  late SavedRecipesViewModel viewModel;
  late MockGetSavedRecipesUseCase mockGetSavedRecipesUseCase;
  late MockRemoveSavedRecipeUseCase mockRemoveSavedRecipeUseCase;

  setUpAll(() {
    provideDummy<Result<List<Recipe>, NetworkError>>(
      const Result.success([]),
    );
  });

  setUp(() {
    mockGetSavedRecipesUseCase = MockGetSavedRecipesUseCase();
    mockRemoveSavedRecipeUseCase = MockRemoveSavedRecipeUseCase();
    viewModel = SavedRecipesViewModel(
      getSavedRecipesUseCase: mockGetSavedRecipesUseCase,
      removeSavedRecipeUseCase: mockRemoveSavedRecipeUseCase,
    );
  });

  final mockRecipes = [
    Recipe.empty.copyWith(id: '1', name: 'Test Recipe 1'),
    Recipe.empty.copyWith(id: '2', name: 'Test Recipe 2'),
  ];

  group('init', () {
    test(
      'should load recipes successfully and update state',
      () async {
        // Given
        when(mockGetSavedRecipesUseCase.execute()).thenAnswer((_) async* {
          yield Result.success(mockRecipes);
        });

        // When
        await viewModel.init();

        // Then
        expect(viewModel.state.savedRecipes, mockRecipes);
        expect(viewModel.state.isLoading, false);
        verify(mockGetSavedRecipesUseCase.execute()).called(1);
      },
    );

    test('should handle error when fetching recipes', () async {
      // Given
      const networkError = NetworkError.unknown;
      when(
        mockGetSavedRecipesUseCase.execute(),
      ).thenAnswer((_) async* {
        yield const Result.error(networkError);
      });

      // Expect
      final future = expectLater(
        viewModel.eventStream,
        emits(SavedRecipesEvent.showErrorDialog(networkError.toString())),
      );

      // When
      await viewModel.init();

      // Then
      await future; // Wait for the event
      expect(viewModel.state.savedRecipes, isEmpty);
      expect(viewModel.state.isLoading, false);
      verify(mockGetSavedRecipesUseCase.execute()).called(1);
    });
  });

  group('onAction', () {
    test(
      'should remove recipe successfully when TapRecipeBookmark is called',
      () async {
        // Given
        when(
          mockGetSavedRecipesUseCase.execute(),
        ).thenAnswer((_) async* {
          yield Result.success(mockRecipes);
        });
        await viewModel.init();

        final recipeToRemove = mockRecipes.first;
        final updatedRecipes = mockRecipes.sublist(1);

        when(
          mockRemoveSavedRecipeUseCase.execute(
            any,
            recipeToRemove.id,
          ),
        ).thenAnswer((_) async => Result.success(updatedRecipes));

        // When
        await viewModel.onAction(TapRecipeBookmark(recipeToRemove.id));

        // Then
        expect(viewModel.state.savedRecipes, updatedRecipes);
        expect(viewModel.state.isLoading, false);
        verify(
          mockRemoveSavedRecipeUseCase.execute(
            any,
            recipeToRemove.id,
          ),
        ).called(1);
      },
    );

    test('should handle error when removing recipe fails', () async {
      // Given
      when(
        mockGetSavedRecipesUseCase.execute(),
      ).thenAnswer((_) async* {
        yield Result.success(mockRecipes);
      });
      await viewModel.init();

      final recipeToRemove = mockRecipes.first;
      const networkError = NetworkError.unknown;

      when(
        mockRemoveSavedRecipeUseCase.execute(
          any,
          recipeToRemove.id,
        ),
      ).thenAnswer((_) async => const Result.error(networkError));

      // Expect
      final future = expectLater(
        viewModel.eventStream,
        emits(SavedRecipesEvent.showErrorDialog(networkError.toString())),
      );

      // When
      await viewModel.onAction(TapRecipeBookmark(recipeToRemove.id));

      // Then
      await future; // Wait for the event
      expect(viewModel.state.savedRecipes, mockRecipes);
      expect(viewModel.state.isLoading, false);
      verify(
        mockRemoveSavedRecipeUseCase.execute(
          any,
          recipeToRemove.id,
        ),
      ).called(1);
    });
  });
}
