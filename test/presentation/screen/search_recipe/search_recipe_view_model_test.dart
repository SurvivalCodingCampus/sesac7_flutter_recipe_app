import 'package:flutter_recipe_app/core/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/data/model/recipe/filter_category.dart';
import 'package:flutter_recipe_app/data/model/recipe/filter_rate.dart';
import 'package:flutter_recipe_app/data/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/data/model/recipe/search_state_type.dart';
import 'package:flutter_recipe_app/data/repository/recipe/recipe_repository.dart';
import 'package:flutter_recipe_app/presentation/screen/search_recipe/filter_search_state.dart';
import 'package:flutter_recipe_app/presentation/screen/search_recipe/search_recipe_state.dart';
import 'package:flutter_recipe_app/presentation/screen/search_recipe/search_recipe_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../saved_recipes/saved_recipes_view_model_test.mocks.dart';

@GenerateNiceMocks([MockSpec<RecipeRepository>()])
void main() {
  final List<Recipe> mockRecipes = [
    Recipe(
      id: '1',
      name: 'Spicy Chicken',
      creator: 'John Doe',
      rating: 4.5,
      category: 'Dinner',
      imageUrl: '',
      cookingTime: '30 min',
      ingredients: [],
    ),
    Recipe(
      id: '2',
      name: 'Vegetable Soup',
      creator: 'Jane Smith',
      rating: 3.0,
      category: 'Soup',
      imageUrl: '',
      cookingTime: '20 min',
      ingredients: [],
    ),
    Recipe(
      id: '3',
      name: 'Chocolate Cake',
      creator: 'John Doe',
      rating: 5.0,
      category: 'Dessert',
      imageUrl: '',
      cookingTime: '60 min',
      ingredients: [],
    ),
  ];

  setUpAll(() {
    provideDummy(Result<List<Recipe>, NetworkError>.success([]));
  });

  test('SearchRecipeViewModel initial state is correct', () {
    final mockRecipeRepository = MockRecipeRepository();
    final viewModel = SearchRecipeViewModel(
      recipeRepository: mockRecipeRepository,
    );
    expect(viewModel.state, SearchRecipeState());
  });

  test(
    'SearchRecipeViewModel fetchRecipe updates state with recipes on success',
    () async {
      final mockRecipeRepository = MockRecipeRepository();
      final viewModel = SearchRecipeViewModel(
        recipeRepository: mockRecipeRepository,
      );

      when(mockRecipeRepository.fetchAllRecipes()).thenAnswer(
        (_) async => Result<List<Recipe>, NetworkError>.success(mockRecipes),
      );

      await viewModel.fetchRecipe();

      expect(viewModel.state.isLoading, false);
      expect(viewModel.state.allRecipes, mockRecipes);
      expect(viewModel.state.filteredRecipes, mockRecipes);
      expect(viewModel.state.resultCount, mockRecipes.length);
      expect(viewModel.state.searchState, SearchStateType.recentSearch);
      expect(viewModel.state.errorMessage, isNull);
      verify(mockRecipeRepository.fetchAllRecipes()).called(1);
    },
  );

  test(
    'SearchRecipeViewModel fetchRecipe updates state with error message on failure',
    () async {
      final mockRecipeRepository = MockRecipeRepository();
      final viewModel = SearchRecipeViewModel(
        recipeRepository: mockRecipeRepository,
      );

      final networkError = NetworkError.unknown;
      when(
        mockRecipeRepository.fetchAllRecipes(),
      ).thenAnswer(
        (_) async => Error<List<Recipe>, NetworkError>(networkError),
      );

      await viewModel.fetchRecipe();

      expect(viewModel.state.isLoading, false);
      expect(viewModel.state.allRecipes, isEmpty);
      expect(viewModel.state.filteredRecipes, isEmpty);
      expect(viewModel.state.resultCount, 0);
      expect(viewModel.state.searchState, SearchStateType.recentSearch);
      expect(viewModel.state.errorMessage, contains('NetworkError.unknown'));
      verify(mockRecipeRepository.fetchAllRecipes()).called(1);
    },
  );

  test(
    'SearchRecipeViewModel searchRecipe returns all recipes when keyword is empty',
    () async {
      final mockRecipeRepository = MockRecipeRepository();
      final viewModel = SearchRecipeViewModel(
        recipeRepository: mockRecipeRepository,
      );

      when(mockRecipeRepository.fetchAllRecipes()).thenAnswer(
        (_) async => Success<List<Recipe>, NetworkError>(mockRecipes),
      );
      await viewModel.fetchRecipe();

      viewModel.searchRecipe('');

      expect(viewModel.state.filteredRecipes, mockRecipes);
      expect(viewModel.state.resultCount, mockRecipes.length);
      expect(viewModel.state.searchFieldValue, '');
      expect(viewModel.state.searchState, SearchStateType.recentSearch);
    },
  );

  test(
    'SearchRecipeViewModel searchRecipe filters recipes by name or creator',
    () async {
      final mockRecipeRepository = MockRecipeRepository();
      final viewModel = SearchRecipeViewModel(
        recipeRepository: mockRecipeRepository,
      );

      when(mockRecipeRepository.fetchAllRecipes()).thenAnswer(
        (_) async => Success<List<Recipe>, NetworkError>(mockRecipes),
      );
      await viewModel.fetchRecipe();

      viewModel.searchRecipe('john');

      expect(viewModel.state.filteredRecipes.length, 2);
      expect(viewModel.state.filteredRecipes[0].name, 'Spicy Chicken');
      expect(viewModel.state.filteredRecipes[1].name, 'Chocolate Cake');
      expect(viewModel.state.resultCount, 2);
      expect(viewModel.state.searchFieldValue, 'john');
      expect(viewModel.state.searchState, SearchStateType.searchResult);
    },
  );

  test(
    'SearchRecipeViewModel searchRecipe returns empty list if no match found',
    () async {
      final mockRecipeRepository = MockRecipeRepository();
      final viewModel = SearchRecipeViewModel(
        recipeRepository: mockRecipeRepository,
      );

      when(mockRecipeRepository.fetchAllRecipes()).thenAnswer(
        (_) async => Success<List<Recipe>, NetworkError>(mockRecipes),
      );
      await viewModel.fetchRecipe();

      viewModel.searchRecipe('nonexistent');

      expect(viewModel.state.filteredRecipes, isEmpty);
      expect(viewModel.state.resultCount, 0);
      expect(viewModel.state.searchFieldValue, 'nonexistent');
      expect(viewModel.state.searchState, SearchStateType.searchResult);
    },
  );

  test(
    'SearchRecipeViewModel selectFilter filters by rate (e.g., 5 stars)',
    () async {
      final mockRecipeRepository = MockRecipeRepository();
      final viewModel = SearchRecipeViewModel(
        recipeRepository: mockRecipeRepository,
      );

      when(mockRecipeRepository.fetchAllRecipes()).thenAnswer(
        (_) async => Success<List<Recipe>, NetworkError>(mockRecipes),
      );
      await viewModel.fetchRecipe();

      final filterState = FilterSearchState(filterRate: FilterRate.five);
      viewModel.selectFilter(filterState);

      expect(viewModel.state.filteredRecipes.length, 1);
      expect(viewModel.state.filteredRecipes[0].name, 'Chocolate Cake');
      expect(viewModel.state.resultCount, 1);
      expect(viewModel.state.searchState, SearchStateType.searchResult);
      expect(viewModel.state.filterState, filterState);
    },
  );

  test(
    'SearchRecipeViewModel selectFilter filters by rate (e.g., 3 stars)',
    () async {
      final mockRecipeRepository = MockRecipeRepository();
      final viewModel = SearchRecipeViewModel(
        recipeRepository: mockRecipeRepository,
      );

      when(mockRecipeRepository.fetchAllRecipes()).thenAnswer(
        (_) async => Success<List<Recipe>, NetworkError>(mockRecipes),
      );
      await viewModel.fetchRecipe();

      final filterState = FilterSearchState(filterRate: FilterRate.three);
      viewModel.selectFilter(filterState);

      expect(viewModel.state.filteredRecipes.length, 1);
      expect(viewModel.state.filteredRecipes[0].name, 'Vegetable Soup');
      expect(viewModel.state.resultCount, 1);
      expect(viewModel.state.searchState, SearchStateType.searchResult);
      expect(viewModel.state.filterState, filterState);
    },
  );

  test(
    'SearchRecipeViewModel selectFilter filters by category (e.g., Dinner)',
    () async {
      final mockRecipeRepository = MockRecipeRepository();
      final viewModel = SearchRecipeViewModel(
        recipeRepository: mockRecipeRepository,
      );

      when(mockRecipeRepository.fetchAllRecipes()).thenAnswer(
        (_) async => Success<List<Recipe>, NetworkError>(mockRecipes),
      );
      await viewModel.fetchRecipe();

      final filterState = FilterSearchState(
        filterCategory: FilterCategory.dinner,
      );
      viewModel.selectFilter(filterState);

      expect(viewModel.state.filteredRecipes.length, 1);
      expect(viewModel.state.filteredRecipes[0].name, 'Spicy Chicken');
      expect(viewModel.state.resultCount, 1);
      expect(viewModel.state.searchState, SearchStateType.searchResult);
      expect(viewModel.state.filterState, filterState);
    },
  );

  test(
    'SearchRecipeViewModel selectFilter filters by category and result count 0 (e.g., Fruit)',
    () async {
      final mockRecipeRepository = MockRecipeRepository();
      final viewModel = SearchRecipeViewModel(
        recipeRepository: mockRecipeRepository,
      );

      when(mockRecipeRepository.fetchAllRecipes()).thenAnswer(
        (_) async => Success<List<Recipe>, NetworkError>(mockRecipes),
      );
      await viewModel.fetchRecipe();

      final filterState = FilterSearchState(
        filterCategory: FilterCategory.fruit,
      );
      viewModel.selectFilter(filterState);

      expect(viewModel.state.filteredRecipes.length, 0);
      expect(viewModel.state.resultCount, 0);
      expect(viewModel.state.searchState, SearchStateType.searchResult);
      expect(viewModel.state.filterState, filterState);
    },
  );

  test(
    'SearchRecipeViewModel selectFilter filters by multiple criteria (rate and category)',
    () async {
      final mockRecipeRepository = MockRecipeRepository();
      final viewModel = SearchRecipeViewModel(
        recipeRepository: mockRecipeRepository,
      );

      when(mockRecipeRepository.fetchAllRecipes()).thenAnswer(
        (_) async => Success<List<Recipe>, NetworkError>(mockRecipes),
      );
      await viewModel.fetchRecipe();

      final filterState = FilterSearchState(
        filterRate: FilterRate.four,
        filterCategory: FilterCategory.dinner,
      );
      viewModel.selectFilter(filterState);

      expect(viewModel.state.filteredRecipes.length, 1);
      expect(viewModel.state.filteredRecipes[0].name, 'Spicy Chicken');
      expect(viewModel.state.resultCount, 1);
      expect(viewModel.state.searchState, SearchStateType.searchResult);
      expect(viewModel.state.filterState, filterState);
    },
  );
}
