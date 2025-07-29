import 'dart:async';

import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/home/domain/model/home_recipe_category.dart';
import 'package:flutter_recipe_app/core/domain/use_case/fetch_all_recipes_use_case.dart';
import 'package:flutter_recipe_app/feature/home/domain/use_case/filter_home_recipe_category_use_case.dart';
import 'package:flutter_recipe_app/feature/home/domain/use_case/remove_bookmark_use_case.dart';
import 'package:flutter_recipe_app/feature/home/domain/use_case/save_bookmark_use_case.dart';
import 'package:flutter_recipe_app/feature/home/presentation/home_action.dart';
import 'package:flutter_recipe_app/feature/home/presentation/home_event.dart';
import 'package:flutter_recipe_app/feature/home/presentation/home_state.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/domain/use_case/get_saved_recipes_use_case.dart';

class HomeViewModel {
  final FetchAllRecipesUseCase _fetchAllRecipesUseCase;
  final FilterHomeRecipeCategoryUseCase _filterHomeRecipeCategoryUseCase;
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;
  final RemoveBookmarkUseCase _removeBookmarkUseCase;
  final SaveBookmarkUseCase _saveBookmarkUseCase;
  final StreamController<HomeState> _stateController = StreamController();
  final StreamController<HomeEvent> _eventController = StreamController();

  late final StreamSubscription<Result<List<Recipe>, NetworkError>>
  _savedRecipesSubscription;

  HomeState _state = HomeState();

  HomeViewModel({
    required FetchAllRecipesUseCase fetchAllRecipesUseCase,
    required FilterHomeRecipeCategoryUseCase filterHomeRecipeCategoryUseCase,
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
    required RemoveBookmarkUseCase removeBookmarkUseCase,
    required SaveBookmarkUseCase saveBookmarkUseCase,
  }) : _fetchAllRecipesUseCase = fetchAllRecipesUseCase,
       _filterHomeRecipeCategoryUseCase = filterHomeRecipeCategoryUseCase,
       _getSavedRecipesUseCase = getSavedRecipesUseCase,
       _removeBookmarkUseCase = removeBookmarkUseCase,
       _saveBookmarkUseCase = saveBookmarkUseCase;

  Stream<HomeState> get state => _stateController.stream;
  Stream<HomeEvent> get eventStream => _eventController.stream;

  void init() async {
    _loadingState();

    final result = await _fetchAllRecipesUseCase.execute();

    switch (result) {
      case Success<List<Recipe>, NetworkError>():
        _state = _state.copyWith(
          allRecipes: result.data,
          filteredRecipes: result.data,
          isLoading: false,
        );

        _notify();
      case Error<List<Recipe>, NetworkError>():
        _errorState(result.error.toString());
        return;
    }

    _savedRecipesSubscription = _getSavedRecipesUseCase.execute().listen((
      result,
    ) {
      switch (result) {
        case Success<List<Recipe>, NetworkError>():
          final allRecipes = _state.allRecipes.map((recipe) {
            final isSaved = result.data.any((savedRecipe) => savedRecipe.id == recipe.id);
            return recipe.copyWith(isSaved: isSaved);
          }).toList();

          final filteredRecipes = _state.filteredRecipes.map((recipe) {
            final isSaved = result.data.any((savedRecipe) => savedRecipe.id == recipe.id);
            return recipe.copyWith(isSaved: isSaved);
          }).toList();

          _state = _state.copyWith(
            allRecipes: allRecipes,
            filteredRecipes: filteredRecipes,
          );

          _notify();
        case Error<List<Recipe>, NetworkError>():
          _errorState(result.error.toString());
          return;
      }
    });
  }

  void dispose() {
    _stateController.close();
    _eventController.close();
    _savedRecipesSubscription.cancel();
  }

  void onAction(HomeAction action) {
    switch (action) {
      case SearchValueChange():
        // TODO: Handle this case.
        print(action);
      case TapFilterButton():
        // TODO: Handle this case.
        print(action);
      case SelectCategory():
        _filterHomeRecipeCategory(action.category);
      case TapFavorite():
        final recipe = action.recipe;

        if (recipe.isSaved) {
          _removeBookmarkUseCase.execute(recipe.id);
          print('remove');
        } else {
          _saveBookmarkUseCase.execute(recipe.id);
          print('save');
        }
    }
  }

  void _filterHomeRecipeCategory(HomeRecipeCategory category) {
    final filteredRecipes = _filterHomeRecipeCategoryUseCase.execute(
      recipes: _state.allRecipes,
      category: category,
    );
    _state = _state.copyWith(
      filteredRecipes: filteredRecipes,
      selectedCategory: category,
    );

    _notify();
  }

  void _loadingState() {
    _state = _state.copyWith(isLoading: true);

    _notify();
  }

  void _errorState(String message) {
    _state = _state.copyWith(
      isLoading: false,
    );
    _eventController.add(HomeEvent.showErrorDialog(message));

    _notify();
  }

  void _notify() {
    _stateController.add(_state);
  }
}
