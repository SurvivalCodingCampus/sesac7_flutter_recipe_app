import 'package:flutter/cupertino.dart';
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
      recipes: await _recipeRepository.getRecipes(),
      isLoading: true,
    );
    notifyListeners();

    _state = state.copyWith(
      isLoading: false,
    );
    notifyListeners();
  }

  Future<void> filterRecipes(
    FilterSearchBottomSheetState filterSearchState,
  ) async {
    _state = state.copyWith(
      filterSearchState: filterSearchState,
      isLoading: true,
    );
    notifyListeners();

    if (state.filterSearchState.selectedRatingFilter != null) {
      // final result = state.recipes
      //     .where(
      //       (e) =>
      //           e.rating >= state.filterSearchState.selectedRatingFilter! &&
      //           e.rating < state.filterSearchState.selectedRatingFilter! + 1,
      //     )
      //     .toList();

      _state = state.copyWith(
        filteredRecipes: state.recipes
            .where(
              (e) =>
                  e.rating >= state.filterSearchState.selectedRatingFilter! &&
                  e.rating < state.filterSearchState.selectedRatingFilter! + 1,
            )
            .toList(),
        isLoading: false,
      );
      notifyListeners();
    } else {
      _state = state.copyWith(
        filteredRecipes: [],
        isLoading: false,
      );
      notifyListeners();
    }
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
      searchLabel: (state.recipes.length == searchedResult.length)
          ? 'Recent Search'
          : 'Search Result',
      countingLabel: (state.recipes.length == searchedResult.length)
          ? ''
          : '${searchedResult.length} recipes',
    );
    notifyListeners();
  }
}
