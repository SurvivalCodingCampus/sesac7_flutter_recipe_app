import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/presentation/screen/search_recipes_screen_state.dart';

import '../../data/model/recipe.dart';
import '../../data/repository/recipe_repository.dart';
import 'filter_search_bottom_sheet_state.dart';

class SearchRecipesScreenViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SearchRecipesScreenState _state = const SearchRecipesScreenState();

  SearchRecipesScreenState get state => _state;

  SearchRecipesScreenViewModel({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  void fetchRecipes() async {
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

  void filterRecipes(
    FilterSearchBottomSheetState filterSearchState,
  ) async {
    _state = state.copyWith(
      filterSearchState: filterSearchState,
    );
    notifyListeners();

    // 검색이 한 번이라도 실행되었으면 Init 스위치를 끈다
    if (state.searchedResult.isNotEmpty) {
      _state = state.copyWith(
        isInit: false,
      );
    }

    // 첫 검색 전까지는 전체 목록으로 필터링한다
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

  void search(String query) async {
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
