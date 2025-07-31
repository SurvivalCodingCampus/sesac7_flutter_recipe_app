
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/usecase/get_bookmark_changed_stream_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/remove_saved_recipe_use_case.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_action.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../mock/mock_bookmark_repository.dart';
import '../../mock/mock_get_saved_recipes_use_case.dart';

void main() {
  group('SavedRecipeViewModel', () {
    late SavedRecipeViewModel viewModel;
    late MockGetSavedRecipesUseCase mockGetSavedRecipesUseCase;
    late MockBookmarkRepository mockBookmarkRepository;

    final testRecipes = [
      Recipe(
          id: 1,
          name: 'Recipe A',
          image: 'urlA',
          category: 'Category1',
          time: '10min',
          chef: 'Chef A',
          rating: 4.0,
          ingredients: []),
      Recipe(
          id: 2,
          name: 'Recipe B',
          image: 'urlB',
          category: 'Category2',
          time: '20min',
          chef: 'Chef B',
          rating: 3.5,
          ingredients: []),
    ];

    setUp(() {
      mockGetSavedRecipesUseCase = MockGetSavedRecipesUseCase(Result.success(testRecipes));
      mockBookmarkRepository = MockBookmarkRepository(
        addResult: const Result.success(null),
        removeResult: const Result.success(null),
        getIdsResult: const Result.success([]),
        bookmarkChangedStream: Stream.empty(),
      );

      viewModel = SavedRecipeViewModel(
        getSavedRecipesUseCase: mockGetSavedRecipesUseCase,
        removeSavedRecipeUseCase: RemoveSavedRecipeUseCase(bookmarkRepository: mockBookmarkRepository),
        getBookmarkChangedStreamUseCase: GetBookmarkChangedStreamUseCase(bookmarkRepository: mockBookmarkRepository),
      );
    });

    test('fetchSavedRecipes should update savedRecipes in state on success', () async {
      await viewModel.fetchSavedRecipes();
      expect(viewModel.value.savedRecipes, testRecipes);
    });

    test('fetchSavedRecipes should set savedRecipes to empty list on error', () async {
      mockGetSavedRecipesUseCase = MockGetSavedRecipesUseCase(const Result.error('error'));
      viewModel = SavedRecipeViewModel(
        getSavedRecipesUseCase: mockGetSavedRecipesUseCase,
        removeSavedRecipeUseCase: RemoveSavedRecipeUseCase(bookmarkRepository: mockBookmarkRepository),
        getBookmarkChangedStreamUseCase: GetBookmarkChangedStreamUseCase(bookmarkRepository: mockBookmarkRepository),
      );
      await viewModel.fetchSavedRecipes();
      expect(viewModel.value.savedRecipes, isEmpty);
    });

    test('onAction.removeSavedRecipe should remove recipe from state on success', () async {
      // Initial state with recipes
      viewModel.value = viewModel.value.copyWith(savedRecipes: testRecipes);

      // Mock remove success
      mockBookmarkRepository = MockBookmarkRepository(
        addResult: const Result.success(null),
        removeResult: const Result.success(null),
        getIdsResult: const Result.success([]),
        bookmarkChangedStream: Stream.empty(),
      );
      viewModel = SavedRecipeViewModel(
        getSavedRecipesUseCase: mockGetSavedRecipesUseCase,
        removeSavedRecipeUseCase: RemoveSavedRecipeUseCase(bookmarkRepository: mockBookmarkRepository),
        getBookmarkChangedStreamUseCase: GetBookmarkChangedStreamUseCase(bookmarkRepository: mockBookmarkRepository),
      );

      viewModel.onAction(const SavedRecipeAction.removeSavedRecipe(1));

      // Verify that the recipe with id 1 is removed
      expect(viewModel.value.savedRecipes.length, 1);
      expect(viewModel.value.savedRecipes[0].id, 2);
    });

    test('bookmarkChangedStream should return the stream from use case', () {
      final mockStream = Stream.fromIterable([null]);
      mockBookmarkRepository = MockBookmarkRepository(
        addResult: const Result.success(null),
        removeResult: const Result.success(null),
        getIdsResult: const Result.success([]),
        bookmarkChangedStream: mockStream,
      );
      viewModel = SavedRecipeViewModel(
        getSavedRecipesUseCase: mockGetSavedRecipesUseCase,
        removeSavedRecipeUseCase: RemoveSavedRecipeUseCase(bookmarkRepository: mockBookmarkRepository),
        getBookmarkChangedStreamUseCase: GetBookmarkChangedStreamUseCase(bookmarkRepository: mockBookmarkRepository),
      );
      expect(viewModel.bookmarkChangedStream, mockStream);
    });
  });
}
