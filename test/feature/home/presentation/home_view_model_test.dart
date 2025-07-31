import 'dart:async';

import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/domain/use_case/get_all_recipes_use_case.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/home/domain/model/home_recipe_category.dart';
import 'package:flutter_recipe_app/feature/home/domain/use_case/filter_home_recipe_category_use_case.dart';
import 'package:flutter_recipe_app/feature/home/domain/use_case/remove_bookmark_use_case.dart';
import 'package:flutter_recipe_app/feature/home/domain/use_case/save_bookmark_use_case.dart';
import 'package:flutter_recipe_app/feature/home/presentation/home_action.dart';
import 'package:flutter_recipe_app/feature/home/presentation/home_event.dart';
import 'package:flutter_recipe_app/feature/home/presentation/home_view_model.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_view_model_test.mocks.dart';

@GenerateMocks([
  GetAllRecipesUseCase,
  GetSavedRecipesUseCase,
  RemoveBookmarkUseCase,
  SaveBookmarkUseCase,
])
void main() {
  group('HomeViewModel', () {
    late MockGetAllRecipesUseCase mockGetAllRecipesUseCase;
    late MockGetSavedRecipesUseCase mockGetSavedRecipesUseCase;
    late MockRemoveBookmarkUseCase mockRemoveBookmarkUseCase;
    late MockSaveBookmarkUseCase mockSaveBookmarkUseCase;
    late FilterHomeRecipeCategoryUseCase filterHomeRecipeCategoryUseCase;

    provideDummy(Result<List<Recipe>, NetworkError>.success([]));

    setUp(() {
      mockGetAllRecipesUseCase = MockGetAllRecipesUseCase();
      mockGetSavedRecipesUseCase = MockGetSavedRecipesUseCase();
      mockRemoveBookmarkUseCase = MockRemoveBookmarkUseCase();
      mockSaveBookmarkUseCase = MockSaveBookmarkUseCase();
      filterHomeRecipeCategoryUseCase = FilterHomeRecipeCategoryUseCase();
    });

    final allRecipes = [
      const Recipe(
        id: '1',
        name: 'Pasta',
        category: 'Italian',
        isSaved: false,
        creator: '',
        cookingTime: '',
        rating: 0,
        reviewCount: 0,
        serve: 0,
        imageUrl: '',
        imageWithoutBackground: '',
      ),
      const Recipe(
        id: '2',
        name: 'Curry',
        category: 'Indian',
        isSaved: false,
        creator: '',
        cookingTime: '',
        rating: 0,
        reviewCount: 0,
        serve: 0,
        imageUrl: '',
        imageWithoutBackground: '',
      ),
    ];

    // Helper to wait for the view model to finish its initial loading.
    Future<void> awaitViewModelInit(HomeViewModel vm) async {
      final completer = Completer<void>();
      vm.addListener(() {
        if (!vm.state.isLoading) {
          if (!completer.isCompleted) completer.complete();
        }
      });
      await completer.future;
    }

    test(
      'Given use cases are successful, '
      'When init is called, '
      'Then it should load all recipes and update saved status from stream',
      () async {
        // Setup
        final savedRecipesController =
            StreamController<Result<List<Recipe>, NetworkError>>.broadcast();
        when(
          mockGetSavedRecipesUseCase.execute(),
        ).thenAnswer((_) => savedRecipesController.stream);
        when(
          mockGetAllRecipesUseCase.execute(),
        ).thenAnswer((_) async => Result.success(allRecipes));

        final viewModel = HomeViewModel(
          fetchAllRecipesUseCase: mockGetAllRecipesUseCase,
          filterHomeRecipeCategoryUseCase: filterHomeRecipeCategoryUseCase,
          getSavedRecipesUseCase: mockGetSavedRecipesUseCase,
          removeBookmarkUseCase: mockRemoveBookmarkUseCase,
          saveBookmarkUseCase: mockSaveBookmarkUseCase,
        );

        // When
        viewModel.init();
        await awaitViewModelInit(viewModel);

        // Then: Initial load is complete
        expect(viewModel.state.isLoading, isFalse);
        expect(viewModel.state.allRecipes.length, 2);
        expect(viewModel.state.allRecipes.every((r) => !r.isSaved), isTrue);

        // When: Bookmarks stream emits an update
        final savedRecipe = allRecipes.first.copyWith(isSaved: true);
        savedRecipesController.add(Result.success([savedRecipe]));
        await Future.microtask(() {}); // Allow stream to be processed

        // Then: The recipe's saved status should be updated
        expect(viewModel.state.allRecipes.first.isSaved, isTrue);
        expect(viewModel.state.filteredRecipes.first.isSaved, isTrue);

        // Cleanup
        viewModel.dispose();
        await savedRecipesController.close();
      },
    );

    test('Given fetching all recipes fails, '
        'When init is called, '
        'Then it should emit an error event', () async {
      // Setup
      final savedRecipesController =
          StreamController<Result<List<Recipe>, NetworkError>>.broadcast();
      when(
        mockGetSavedRecipesUseCase.execute(),
      ).thenAnswer((_) => savedRecipesController.stream);
      when(
        mockGetAllRecipesUseCase.execute(),
      ).thenAnswer((_) async => const Result.error(NetworkError.serverError));

      final viewModel = HomeViewModel(
        fetchAllRecipesUseCase: mockGetAllRecipesUseCase,
        filterHomeRecipeCategoryUseCase: filterHomeRecipeCategoryUseCase,
        getSavedRecipesUseCase: mockGetSavedRecipesUseCase,
        removeBookmarkUseCase: mockRemoveBookmarkUseCase,
        saveBookmarkUseCase: mockSaveBookmarkUseCase,
      );

      // Then
      expectLater(viewModel.eventStream, emits(isA<ShowErrorDialog>()));

      // When
      viewModel.init();
      await awaitViewModelInit(viewModel);
      expect(viewModel.state.isLoading, isFalse);

      // Cleanup
      viewModel.dispose();
      await savedRecipesController.close();
    });

    test('Given a category is selected, '
        'When onAction(SelectCategory) is called, '
        'Then it should filter the recipes', () async {
      // Setup
      final savedRecipesController =
          StreamController<Result<List<Recipe>, NetworkError>>.broadcast();
      when(
        mockGetSavedRecipesUseCase.execute(),
      ).thenAnswer((_) => savedRecipesController.stream);
      when(
        mockGetAllRecipesUseCase.execute(),
      ).thenAnswer((_) async => Result.success(allRecipes));

      final viewModel = HomeViewModel(
        fetchAllRecipesUseCase: mockGetAllRecipesUseCase,
        filterHomeRecipeCategoryUseCase: filterHomeRecipeCategoryUseCase,
        getSavedRecipesUseCase: mockGetSavedRecipesUseCase,
        removeBookmarkUseCase: mockRemoveBookmarkUseCase,
        saveBookmarkUseCase: mockSaveBookmarkUseCase,
      );
      viewModel.init();
      await awaitViewModelInit(viewModel);

      // When
      viewModel.onAction(
        const HomeAction.selectCategory(HomeRecipeCategory.italian),
      );

      // Then
      expect(viewModel.state.selectedCategory, HomeRecipeCategory.italian);
      expect(viewModel.state.filteredRecipes.length, 1);
      expect(viewModel.state.filteredRecipes.first.name, 'Pasta');

      // Cleanup
      viewModel.dispose();
      await savedRecipesController.close();
    });

    test('Given a recipe is not saved, '
        'When onAction(TapFavorite) is called, '
        'Then it should call SaveBookmarkUseCase', () async {
      // Setup
      final savedRecipesController =
          StreamController<Result<List<Recipe>, NetworkError>>.broadcast();
      when(
        mockGetSavedRecipesUseCase.execute(),
      ).thenAnswer((_) => savedRecipesController.stream);
      when(
        mockGetAllRecipesUseCase.execute(),
      ).thenAnswer((_) async => Result.success(allRecipes));

      final viewModel = HomeViewModel(
        fetchAllRecipesUseCase: mockGetAllRecipesUseCase,
        filterHomeRecipeCategoryUseCase: filterHomeRecipeCategoryUseCase,
        getSavedRecipesUseCase: mockGetSavedRecipesUseCase,
        removeBookmarkUseCase: mockRemoveBookmarkUseCase,
        saveBookmarkUseCase: mockSaveBookmarkUseCase,
      );
      viewModel.init();
      await awaitViewModelInit(viewModel);
      final recipe = viewModel.state.allRecipes.first.copyWith(isSaved: false);

      // When
      viewModel.onAction(HomeAction.tapFavorite(recipe));

      // Then
      verify(mockSaveBookmarkUseCase.execute(recipe.id)).called(1);
      verifyNever(mockRemoveBookmarkUseCase.execute(any));

      // Cleanup
      viewModel.dispose();
      await savedRecipesController.close();
    });

    test('Given a recipe is already saved, '
        'When onAction(TapFavorite) is called, '
        'Then it should call RemoveBookmarkUseCase', () async {
      // Setup
      final savedRecipesController =
          StreamController<Result<List<Recipe>, NetworkError>>.broadcast();
      when(
        mockGetSavedRecipesUseCase.execute(),
      ).thenAnswer((_) => savedRecipesController.stream);
      when(
        mockGetAllRecipesUseCase.execute(),
      ).thenAnswer((_) async => Result.success(allRecipes));

      final viewModel = HomeViewModel(
        fetchAllRecipesUseCase: mockGetAllRecipesUseCase,
        filterHomeRecipeCategoryUseCase: filterHomeRecipeCategoryUseCase,
        getSavedRecipesUseCase: mockGetSavedRecipesUseCase,
        removeBookmarkUseCase: mockRemoveBookmarkUseCase,
        saveBookmarkUseCase: mockSaveBookmarkUseCase,
      );
      viewModel.init();
      await awaitViewModelInit(viewModel);
      final recipe = viewModel.state.allRecipes.first.copyWith(isSaved: true);

      // When
      viewModel.onAction(HomeAction.tapFavorite(recipe));

      // Then
      verify(mockRemoveBookmarkUseCase.execute(recipe.id)).called(1);
      verifyNever(mockSaveBookmarkUseCase.execute(any));

      // Cleanup
      viewModel.dispose();
      await savedRecipesController.close();
    });

    test(
      'When dispose is called, Then it should cancel the stream subscription',
      () async {
        // Setup
        final savedRecipesController =
            StreamController<Result<List<Recipe>, NetworkError>>.broadcast();
        when(
          mockGetSavedRecipesUseCase.execute(),
        ).thenAnswer((_) => savedRecipesController.stream);
        when(
          mockGetAllRecipesUseCase.execute(),
        ).thenAnswer((_) async => Result.success(allRecipes));

        final viewModel = HomeViewModel(
          fetchAllRecipesUseCase: mockGetAllRecipesUseCase,
          filterHomeRecipeCategoryUseCase: filterHomeRecipeCategoryUseCase,
          getSavedRecipesUseCase: mockGetSavedRecipesUseCase,
          removeBookmarkUseCase: mockRemoveBookmarkUseCase,
          saveBookmarkUseCase: mockSaveBookmarkUseCase,
        );
        viewModel.init();
        await awaitViewModelInit(viewModel);

        // When
        viewModel.dispose();

        // Then: The stream controller should have no more listeners
        expect(savedRecipesController.hasListener, isFalse);

        // Cleanup
        await savedRecipesController.close();
      },
    );
  });
}
