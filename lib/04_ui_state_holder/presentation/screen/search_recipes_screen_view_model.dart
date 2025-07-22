import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/02_stateful_widget/data/model/recipe.dart';
import 'package:flutter_recipe_app/03_mvvm/data/repository/recipe_repository.dart';
import 'package:flutter_recipe_app/04_ui_state_holder/presentation/screen/filter_search_bottom_sheet_state.dart';
import 'package:flutter_recipe_app/04_ui_state_holder/presentation/screen/search_recipes_screen_state.dart';

class SearchRecipesScreenViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SearchRecipesScreenState _state = const SearchRecipesScreenState();

  SearchRecipesScreenState get state => _state;

  SearchRecipesScreenViewModel({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<void> fetchRecipes() async {
    _state = state.copyWith(
      isLoading: true,
      isInit: true,
    );
    notifyListeners();

    final List<Recipe> recipes = await _recipeRepository.getRecipes();

    _state = state.copyWith(
      recipes: recipes,
      filteredResult: recipes,
      isLoading: false,
    );
    notifyListeners();
  }

  Future<void> filterRecipes(
    FilterSearchBottomSheetState filterSearchState,
  ) async {
    _state = state.copyWith(
      filterSearchState: filterSearchState,
    );
    notifyListeners();

    if (state.searchedResult.isNotEmpty) {
      _state = state.copyWith(
        isInit: false,
      );
    }

    final List<Recipe> baseList = (state.isInit)
        ? state.recipes
        : state.searchedResult;
    List<Recipe> filteredList = baseList;

    // rating 필터만 일단 적용
    if (state.filterSearchState.selectedRatingFilter != null) {
      filteredList = baseList
          .where(
            (e) =>
                e.rating >= state.filterSearchState.selectedRatingFilter! &&
                e.rating < state.filterSearchState.selectedRatingFilter! + 1,
          )
          .toList();
    }

    _state = state.copyWith(
      filteredResult: filteredList,
      searchLabel:
          (state.recipes.length == filteredList.length && state.query.isEmpty)
          ? 'Recent Search'
          : 'Search Result',
      countingLabel:
          (state.query.isEmpty &&
              state.filterSearchState.selectedRatingFilter == null)
          ? ''
          : '${filteredList.length} recipes',
    );
    notifyListeners();
  }

  Future<void> search(String query) async {
    final searchedResult = state.recipes
        .where(
          (e) =>
              e.name.toLowerCase().replaceAll(' ', '').contains(query) ||
              e.chef.toLowerCase().replaceAll(' ', '').contains(query),
        )
        .toList();

    _state = state.copyWith(
      query: query,
      searchedResult: searchedResult,
    );
    notifyListeners();

    filterRecipes(state.filterSearchState);
  }
}
