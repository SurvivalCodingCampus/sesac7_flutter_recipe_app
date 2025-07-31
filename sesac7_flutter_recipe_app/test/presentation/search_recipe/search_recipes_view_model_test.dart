
import 'dart:async';

import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/enum/rating_type.dart';
import 'package:flutter_recipe_app/core/enum/search_recipe_filter_category_type.dart';
import 'package:flutter_recipe_app/core/enum/search_recipe_filter_time_type.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/usecase/add_recent_recipes_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recent_recipes_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/search_recipe_by_filter_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/search_recipe_by_keyword_use_case.dart';
import 'package:flutter_recipe_app/presentation/search_recipe/search_recipes_action.dart';
import 'package:flutter_recipe_app/presentation/search_recipe/search_recipes_event.dart';
import 'package:flutter_recipe_app/presentation/search_recipe/search_recipes_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

// Mock UseCases
class MockSearchRecipeByKeywordUseCase implements SearchRecipeByKeywordUseCase {
  final Result<List<Recipe>, NetworkError> _result;
  MockSearchRecipeByKeywordUseCase(this._result);
  @override
  Future<Result<List<Recipe>, NetworkError>> execute(String keyword) async => _result;
}

class MockSearchRecipeByFilterUseCase implements SearchRecipeByFilterUseCase {
  final Result<List<Recipe>, NetworkError> _result;
  MockSearchRecipeByFilterUseCase(this._result);
  @override
  Future<Result<List<Recipe>, NetworkError>> execute(
          SearchRecipeFilterTimeType? timeType,
          RatingType? ratingType,
          SearchRecipeFilterCategoryType? categoryType) async =>
      _result;
}

class MockGetRecentRecipesUseCase implements GetRecentRecipesUseCase {
  final Result<List<Recipe>, NetworkError> _result;
  MockGetRecentRecipesUseCase(this._result);
  @override
  Future<Result<List<Recipe>, NetworkError>> execute() async => _result;
}

class MockAddRecentRecipesUseCase implements AddRecentRecipesUseCase {
  final Result<List<Recipe>, NetworkError> _result;
  MockAddRecentRecipesUseCase(this._result);
  @override
  Future<Result<List<Recipe>, NetworkError>> execute(List<Recipe> recentRecipes) async => _result;
}

void main() {
  group('SearchRecipesViewModel', () {
    late SearchRecipesViewModel viewModel;
    late MockSearchRecipeByKeywordUseCase mockSearchRecipeByKeywordUseCase;
    late MockSearchRecipeByFilterUseCase mockSearchRecipeByFilterUseCase;
    late MockGetRecentRecipesUseCase mockGetRecentRecipesUseCase;
    late MockAddRecentRecipesUseCase mockAddRecentRecipesUseCase;

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
    ];

    setUp(() {
      mockSearchRecipeByKeywordUseCase = MockSearchRecipeByKeywordUseCase(Result.success(testRecipes));
      mockSearchRecipeByFilterUseCase = MockSearchRecipeByFilterUseCase(Result.success(testRecipes));
      mockGetRecentRecipesUseCase = MockGetRecentRecipesUseCase(Result.success(testRecipes));
      mockAddRecentRecipesUseCase = MockAddRecentRecipesUseCase(Result.success(testRecipes));

      viewModel = SearchRecipesViewModel(
        searchRecipeByKeywordUseCase: mockSearchRecipeByKeywordUseCase,
        searchRecipeByFilterUseCase: mockSearchRecipeByFilterUseCase,
        getRecentRecipesUseCase: mockGetRecentRecipesUseCase,
        addRecentRecipesUseCase: mockAddRecentRecipesUseCase,
      );
    });

    tearDown(() {
      viewModel.dispose();
    });

    test('fetchRecentRecipes should update recentRecipes on success', () async {
      await viewModel.fetchRecentRecipes();
      expect(viewModel.value.recentRecipes, testRecipes);
      expect(viewModel.value.isLoading, false);
    });

    test('fetchRecentRecipes should set recentRecipes to empty list on error', () async {
      mockGetRecentRecipesUseCase = MockGetRecentRecipesUseCase(Result.error(NetworkError.unKnown));
      viewModel = SearchRecipesViewModel(
        searchRecipeByKeywordUseCase: mockSearchRecipeByKeywordUseCase,
        searchRecipeByFilterUseCase: mockSearchRecipeByFilterUseCase,
        getRecentRecipesUseCase: mockGetRecentRecipesUseCase,
        addRecentRecipesUseCase: mockAddRecentRecipesUseCase,
      );
      await viewModel.fetchRecentRecipes();
      expect(viewModel.value.recentRecipes, isEmpty);
      expect(viewModel.value.isLoading, false);
    });

    test('_fetchSearchResultRecipes (keyword) should update searchResultRecipes on success', () async {
      viewModel.onAction(const SearchRecipesAction.changeKeyword('test'));
      // Debounce time, so we need to wait
      await Future.delayed(const Duration(milliseconds: 550));
      expect(viewModel.value.searchResultRecipes, testRecipes);
      expect(viewModel.value.isLoading, false);
      expect(viewModel.value.searchKeyword, 'test');
      expect(viewModel.value.isCategorySearch, false);
    });

    test('_fetchSearchResultRecipes (keyword) should emit showEmptyResultError when no results', () async {
      mockSearchRecipeByKeywordUseCase = MockSearchRecipeByKeywordUseCase(const Result.success([]));
      viewModel = SearchRecipesViewModel(
        searchRecipeByKeywordUseCase: mockSearchRecipeByKeywordUseCase,
        searchRecipeByFilterUseCase: mockSearchRecipeByFilterUseCase,
        getRecentRecipesUseCase: mockGetRecentRecipesUseCase,
        addRecentRecipesUseCase: mockAddRecentRecipesUseCase,
      );

      final completer = Completer<SearchRecipesEvent>();
      viewModel.eventStream.listen(completer.complete);

      viewModel.onAction(const SearchRecipesAction.changeKeyword('no_results'));
      await Future.delayed(const Duration(milliseconds: 550)); // Debounce

      expect(await completer.future, const SearchRecipesEvent.showEmptyResultError());
      expect(viewModel.value.searchResultRecipes, isEmpty);
      expect(viewModel.value.isLoading, false);
    });

    test('_fetchSearchResultRecipes (keyword) should emit showNetworkErrorDialog on error', () async {
      mockSearchRecipeByKeywordUseCase = MockSearchRecipeByKeywordUseCase(Result.error(NetworkError.serverError));
      viewModel = SearchRecipesViewModel(
        searchRecipeByKeywordUseCase: mockSearchRecipeByKeywordUseCase,
        searchRecipeByFilterUseCase: mockSearchRecipeByFilterUseCase,
        getRecentRecipesUseCase: mockGetRecentRecipesUseCase,
        addRecentRecipesUseCase: mockAddRecentRecipesUseCase,
      );

      final completer = Completer<SearchRecipesEvent>();
      viewModel.eventStream.listen(completer.complete);

      viewModel.onAction(const SearchRecipesAction.changeKeyword('error'));
      await Future.delayed(const Duration(milliseconds: 550)); // Debounce

      expect(await completer.future, const SearchRecipesEvent.showNetworkErrorDialog(NetworkError.serverError));
      expect(viewModel.value.searchResultRecipes, isEmpty);
      expect(viewModel.value.isLoading, false);
    });

    test('_fetchSearchResultRecipes (filter) should update searchResultRecipes on success', () async {
      viewModel.onAction(const SearchRecipesAction.searchFilteredRecipe(
        SearchRecipeFilterTimeType.all,
        RatingType.gradeFive,
        SearchRecipeFilterCategoryType.all,
      ));
      expect(viewModel.value.searchResultRecipes, testRecipes);
      expect(viewModel.value.isLoading, false);
      expect(viewModel.value.isCategorySearch, true);
    });

    test('_fetchSearchResultRecipes (filter) should emit showEmptyResultError when no results', () async {
      mockSearchRecipeByFilterUseCase = MockSearchRecipeByFilterUseCase(const Result.success([]));
      viewModel = SearchRecipesViewModel(
        searchRecipeByKeywordUseCase: mockSearchRecipeByKeywordUseCase,
        searchRecipeByFilterUseCase: mockSearchRecipeByFilterUseCase,
        getRecentRecipesUseCase: mockGetRecentRecipesUseCase,
        addRecentRecipesUseCase: mockAddRecentRecipesUseCase,
      );

      final completer = Completer<SearchRecipesEvent>();
      viewModel.eventStream.listen(completer.complete);

      viewModel.onAction(const SearchRecipesAction.searchFilteredRecipe(
        SearchRecipeFilterTimeType.all,
        RatingType.gradeFive,
        SearchRecipeFilterCategoryType.all,
      ));

      expect(await completer.future, const SearchRecipesEvent.showEmptyResultError());
      expect(viewModel.value.searchResultRecipes, isEmpty);
      expect(viewModel.value.isLoading, false);
    });

    test('_fetchSearchResultRecipes (filter) should emit showNetworkErrorDialog on error', () async {
      mockSearchRecipeByFilterUseCase = MockSearchRecipeByFilterUseCase(Result.error(NetworkError.notFound));
      viewModel = SearchRecipesViewModel(
        searchRecipeByKeywordUseCase: mockSearchRecipeByKeywordUseCase,
        searchRecipeByFilterUseCase: mockSearchRecipeByFilterUseCase,
        getRecentRecipesUseCase: mockGetRecentRecipesUseCase,
        addRecentRecipesUseCase: mockAddRecentRecipesUseCase,
      );

      final completer = Completer<SearchRecipesEvent>();
      viewModel.eventStream.listen(completer.complete);

      viewModel.onAction(const SearchRecipesAction.searchFilteredRecipe(
        SearchRecipeFilterTimeType.all,
        RatingType.gradeFive,
        SearchRecipeFilterCategoryType.all,
      ));

      expect(await completer.future, const SearchRecipesEvent.showNetworkErrorDialog(NetworkError.notFound));
      expect(viewModel.value.searchResultRecipes, isEmpty);
      expect(viewModel.value.isLoading, false);
    });

    test('onAction.changeKeyword with empty keyword should clear results and fetch recent recipes', () async {
      viewModel.value = viewModel.value.copyWith(
        searchKeyword: 'some_keyword',
        searchResultRecipes: testRecipes,
      );
      viewModel.onAction(const SearchRecipesAction.changeKeyword(''));
      expect(viewModel.value.searchKeyword, '');
      expect(viewModel.value.searchResultRecipes, isEmpty);
      expect(viewModel.value.recentRecipes, testRecipes); // Should re-fetch recent recipes
    });

    test('onAction.showFilterBottomSheet should not change state', () {
      final initialState = viewModel.value;
      viewModel.onAction(const SearchRecipesAction.showFilterBottomSheet());
      expect(viewModel.value, initialState); // No state change expected
    });

    test('onAction.changeKeyword with empty keyword should clear results and fetch recent recipes', () async {
      viewModel.value = viewModel.value.copyWith(
        searchKeyword: 'test',
        searchResultRecipes: testRecipes,
        isCategorySearch: true,
      );
      viewModel.onAction(const SearchRecipesAction.changeKeyword(''));
      expect(viewModel.value.searchKeyword, '');
      expect(viewModel.value.searchResultRecipes, isEmpty);
      expect(viewModel.value.isCategorySearch, false);
      expect(viewModel.value.recentRecipes, testRecipes); // Should re-fetch recent recipes
    });
  });
}
