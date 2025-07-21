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
    : _recipeRepository = recipeRepository {
    fetchRecipes();
  }

  void fetchRecipes() async {
    _state = state.copyWith(
      isLoading: true,
    );
    notifyListeners();

    _state = state.copyWith(
      recipes: await _recipeRepository.getRecipes(),
      isLoading: false,
    );
    notifyListeners();

    _state = state.copyWith(
      isLoading: false,
    );
    notifyListeners();
  }

  void fetchFilteredRecipes(
    FilterSearchBottomSheetState filterSearchState,
  ) async {
    _state = state.copyWith(
      filterSearchState: filterSearchState,
      isLoading: true,
    );
    notifyListeners();

    if (state.filterSearchState.selectedRatingFilter != null) {
      final result = state.recipes
          .where(
            (e) =>
                e.rating >= state.filterSearchState.selectedRatingFilter! &&
                e.rating < state.filterSearchState.selectedRatingFilter! + 1,
          )
          .toList();

      _state = state.copyWith(
        filteredRecipes: result,
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

  void fetchSearchedRecipes(String query) async {
    _state = state.copyWith(
      query: query,
      isLoading: true,
    );
    notifyListeners();

    final List<Recipe> recipesSearchedByName = await _recipeRepository
        .getRecipesByName(query);
    final List<Recipe> recipesSearchedByChef = await _recipeRepository
        .getRecipesByChef(query);

    _state = state.copyWith(
      recipesSearchedByName: recipesSearchedByName,
      recipesSearchedByChef: recipesSearchedByChef,
    );
    notifyListeners();

    final List<Recipe> searchedByNameAndChef = [
      ...state.recipesSearchedByChef,
      ...state.recipesSearchedByName,
    ];

    _state = state.copyWith(
      searchedResult: searchedByNameAndChef.toSet().toList(),
      isLoading: false,
    );
    notifyListeners();
  }
}
