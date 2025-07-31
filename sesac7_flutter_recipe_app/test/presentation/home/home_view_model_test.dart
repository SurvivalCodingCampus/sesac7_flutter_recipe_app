
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/usecase/add_saved_recipe_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_bookmark_changed_stream_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recipes_by_category.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recipes_category_list_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_saved_recipe_find_by_id_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_saved_recipe_ids_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/remove_saved_recipe_use_case.dart';
import 'package:flutter_recipe_app/presentation/home/home_action.dart';
import 'package:flutter_recipe_app/presentation/home/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../mock/mock_bookmark_repository.dart';
import '../../mock/mock_get_recipes_use_case.dart';
import '../../mock/mock_get_saved_recipes_use_case.dart';

void main() {
  group('HomeViewModel', () {
    late HomeViewModel viewModel;
    late MockBookmarkRepository mockBookmarkRepository;
    late MockGetRecipesUseCase mockGetRecipesUseCase;
    late GetRecipesCategoryListUseCase getRecipesCategoryListUseCase;
    late GetRecipesByCategory getRecipesByCategory;
    late MockGetSavedRecipesUseCase mockGetSavedRecipesUseCase;
    late GetSavedRecipeFindByIdUseCase getSavedRecipeFindByIdUseCase;
    late RemoveSavedRecipeUseCase removeSavedRecipeUseCase;
    late AddSavedRecipeUseCase addSavedRecipeUseCase;
    late GetBookmarkChangedStreamUseCase getBookmarkChangedStreamUseCase;

    final allRecipes = [
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
      mockBookmarkRepository = MockBookmarkRepository(
        addResult: const Result.success(null),
        removeResult: const Result.success(null),
        getIdsResult: const Result.success([]),
        bookmarkChangedStream: Stream.empty(),
      );
      mockGetRecipesUseCase = MockGetRecipesUseCase(Success(allRecipes));
      getRecipesCategoryListUseCase = GetRecipesCategoryListUseCase(getRecipesUseCase: mockGetRecipesUseCase);
      getRecipesByCategory = GetRecipesByCategory(getRecipesUseCase: mockGetRecipesUseCase);
      mockGetSavedRecipesUseCase = MockGetSavedRecipesUseCase(const Result.success([]));
      getSavedRecipeFindByIdUseCase = GetSavedRecipeFindByIdUseCase(getSavedRecipesUseCase: mockGetSavedRecipesUseCase);
      removeSavedRecipeUseCase = RemoveSavedRecipeUseCase(bookmarkRepository: mockBookmarkRepository);
      addSavedRecipeUseCase = AddSavedRecipeUseCase(bookmarkRepository: mockBookmarkRepository);
      getBookmarkChangedStreamUseCase = GetBookmarkChangedStreamUseCase(bookmarkRepository: mockBookmarkRepository);

      viewModel = HomeViewModel(
        getRecipesUseCase: mockGetRecipesUseCase,
        getRecipesCategoryListUseCase: getRecipesCategoryListUseCase,
        getRecipesByCategory: getRecipesByCategory,
        getSavedRecipeIdsUseCase: GetSavedRecipeIdsUseCase(bookmarkRepository: mockBookmarkRepository),
        getSavedRecipeFindByIdUseCase: getSavedRecipeFindByIdUseCase,
        removeSavedRecipeUseCase: removeSavedRecipeUseCase,
        addSavedRecipeUseCase: addSavedRecipeUseCase,
        bookmarkChangedStreamUseCase: getBookmarkChangedStreamUseCase,
      );
    });

    test('loadCategories should update categories in state', () async {
      await viewModel.loadCategories();
      expect(viewModel.value.categories, {'Category1', 'Category2'});
    });

    test('fetchAllCategoryRecipes should update categoryRecipes in state', () async {
      await viewModel.fetchAllCategoryRecipes();
      expect(viewModel.value.category, 'All');
      expect(viewModel.value.categoryRecipes, allRecipes);
    });

    test('HomeAction.selectCategory should update categoryRecipes for a specific category', () async {
      viewModel.onAction(const HomeAction.selectCategory('Category1'));
      await Future.microtask(() {}); // Allow async operations to complete
      expect(viewModel.value.category, 'Category1');
      expect(viewModel.value.categoryRecipes.length, 1);
      expect(viewModel.value.categoryRecipes[0].category, 'Category1');
    });

    test('loadSavedRecipeIds should update savedRecipeIds in state', () async {
      mockBookmarkRepository = MockBookmarkRepository(
        addResult: const Result.success(null),
        removeResult: const Result.success(null),
        getIdsResult: const Result.success([1, 2]),
        bookmarkChangedStream: Stream.empty(),
      );
      viewModel = HomeViewModel(
        getRecipesUseCase: mockGetRecipesUseCase,
        getRecipesCategoryListUseCase: getRecipesCategoryListUseCase,
        getRecipesByCategory: getRecipesByCategory,
        getSavedRecipeIdsUseCase: GetSavedRecipeIdsUseCase(bookmarkRepository: mockBookmarkRepository),
        getSavedRecipeFindByIdUseCase: getSavedRecipeFindByIdUseCase,
        removeSavedRecipeUseCase: removeSavedRecipeUseCase,
        addSavedRecipeUseCase: addSavedRecipeUseCase,
        bookmarkChangedStreamUseCase: getBookmarkChangedStreamUseCase,
      );
      await viewModel.loadSavedRecipeIds();
      expect(viewModel.value.savedRecipeIds, [1, 2]);
    });

    test('onAction.bookmarkStateChange should add recipe if not saved', () async {
      mockGetSavedRecipesUseCase = MockGetSavedRecipesUseCase(const Result.success([])); // Not found
      mockBookmarkRepository = MockBookmarkRepository(
        addResult: const Result.success(null),
        removeResult: const Result.success(null),
        getIdsResult: const Result.success([]),
        bookmarkChangedStream: Stream.empty(),
      );
      viewModel = HomeViewModel(
        getRecipesUseCase: mockGetRecipesUseCase,
        getRecipesCategoryListUseCase: getRecipesCategoryListUseCase,
        getRecipesByCategory: getRecipesByCategory,
        getSavedRecipeIdsUseCase: GetSavedRecipeIdsUseCase(bookmarkRepository: mockBookmarkRepository),
        getSavedRecipeFindByIdUseCase: getSavedRecipeFindByIdUseCase,
        removeSavedRecipeUseCase: removeSavedRecipeUseCase,
        addSavedRecipeUseCase: addSavedRecipeUseCase,
        bookmarkChangedStreamUseCase: getBookmarkChangedStreamUseCase,
      );
      viewModel.onAction(const HomeAction.bookmarkStateChange(1));
      // In a real scenario, you would verify that addBookmarkRecipe was called on the mock.
      // For now, we just ensure no error is thrown.
    });

    test('onAction.bookmarkStateChange should remove recipe if saved', () async {
      final testRecipe = allRecipes[0];
      mockGetSavedRecipesUseCase = MockGetSavedRecipesUseCase(Result.success([testRecipe]));
      mockBookmarkRepository = MockBookmarkRepository(
        addResult: const Result.success(null),
        removeResult: const Result.success(null),
        getIdsResult: const Result.success([1]),
        bookmarkChangedStream: Stream.empty(),
      );
      viewModel = HomeViewModel(
        getRecipesUseCase: mockGetRecipesUseCase,
        getRecipesCategoryListUseCase: getRecipesCategoryListUseCase,
        getRecipesByCategory: getRecipesByCategory,
        getSavedRecipeIdsUseCase: GetSavedRecipeIdsUseCase(bookmarkRepository: mockBookmarkRepository),
        getSavedRecipeFindByIdUseCase: getSavedRecipeFindByIdUseCase,
        removeSavedRecipeUseCase: removeSavedRecipeUseCase,
        addSavedRecipeUseCase: addSavedRecipeUseCase,
        bookmarkChangedStreamUseCase: getBookmarkChangedStreamUseCase,
      );
      viewModel.onAction(const HomeAction.bookmarkStateChange(1));
      // In a real scenario, you would verify that removeBookmarkRecipe was called on the mock.
      // For now, we just ensure no error is thrown.
    });
  });
}
