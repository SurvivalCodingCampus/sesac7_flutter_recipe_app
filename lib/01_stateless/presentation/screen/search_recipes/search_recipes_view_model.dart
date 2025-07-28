import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/core/presentation/component/bottom_sheet/filter_search_state.dart';
import 'package:flutter_recipe_app/01_stateless/core/result.dart';
import 'package:flutter_recipe_app/01_stateless/domain/use_case/fetch_recipes_use_case.dart';
import 'package:flutter_recipe_app/01_stateless/domain/use_case/search_recipes_use_case.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_action.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_event.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_state.dart';

import '../../../domain/model/recipe.dart';

class SearchRecipesViewModel extends ValueNotifier<SearchRecipesState> {
  final GetRecipesUseCase _getRecipesUseCase;
  final SearchRecipesUseCase _searchRecipesUseCase;

  SearchRecipesState get state => value;

  final _eventController = StreamController<SearchRecipesEvent>();

  Stream<SearchRecipesEvent> get eventStream => _eventController.stream;

  SearchRecipesViewModel({
    required GetRecipesUseCase getRecipesUseCase,
    required SearchRecipesUseCase searchRecipesUseCase,
  }) : _getRecipesUseCase = getRecipesUseCase,
       _searchRecipesUseCase = searchRecipesUseCase,
       super(SearchRecipesState());

  void onAction(SearchRecipesAction action) {
    switch (action) {
      case ChangeQuery():
        _search(action.query);
      case ClickFilterButton():
        _eventController.add(SearchRecipesEvent.openDialog());
      case ClickRecipeItem():
        print(action.recipe);
      case ApplyFilter():
        _filter(action.state);
      case ClickTitle():
        _eventController.add(SearchRecipesEvent.showErrorMessage('에러!!!!!!'));
    }
    notifyListeners();
  }

  void fetchRecipes() async {
    value = value.copyWith(isLoading: true);
    notifyListeners();

    final result = await _getRecipesUseCase.execute();
    switch (result) {
      case Success<List<Recipe>>():
        value = value.copyWith(
          originalRecipes: result.data,
          filteredRecipes: result.data,
          isLoading: false,
        );
        notifyListeners();
      case Error<List<Recipe>>():
        // TODO: Handle this case.
        throw UnimplementedError();
    }

    _filter(value.filterSearchState);
  }

  void _searchWithFilter(String query, FilterSearchState filterSearchState) {
    final searchedRecipes = _searchRecipesUseCase.execute(
      value.originalRecipes,
      query,
      filterSearchState,
    );

    value = value.copyWith(
      query: query,
      searchLabel: value.originalRecipes.length == searchedRecipes.length
          ? 'Recent Search'
          : 'Search Result',
      filteredRecipes: searchedRecipes,
      filterSearchState: filterSearchState,
      resultLabel: query.isEmpty ? '' : '${searchedRecipes.length} results',
    );

    notifyListeners();
  }

  void _search(String query) {
    _searchWithFilter(query, value.filterSearchState);
  }

  void _filter(FilterSearchState filterSearchState) {
    _searchWithFilter(value.query, filterSearchState);
  }
}

void main() {
  final person = Person();
  print(person(10));
}

class Person {
  String name = 'aaa';

  String call(int age) {
    return '$name $age';
  }
}
