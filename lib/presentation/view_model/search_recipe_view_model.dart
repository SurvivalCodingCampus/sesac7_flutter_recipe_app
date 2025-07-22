import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/data/model/recipe.dart';

import '../../data/repository/recipe_repository.dart';
import '../state_holder/filter_search_state.dart';
import '../state_holder/search_recipes_state.dart';

class SearchRecipeViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SearchRecipesState _searchRecipesState = const SearchRecipesState();

  SearchRecipesState get searchRecipesState => _searchRecipesState;

  SearchRecipeViewModel({
    required RecipeRepository recipeRepository,
    SearchRecipesState? initialState, // 초기 상태를 주입받을 수 있도록 변경
  }) : _recipeRepository = recipeRepository,
       _searchRecipesState = initialState ?? const SearchRecipesState();

  Future<void> fetchRecipes() async {
    _searchRecipesState = searchRecipesState.copyWith(isLoading: true);
    notifyListeners();
    try {
      final response = await _recipeRepository.getRecipes();

      switch (response) {

        case Success<List<Recipe>, String>():
          if(response.value.isNotEmpty){
            _searchRecipesState = searchRecipesState.copyWith(
              orgRecipes: searchRecipesState.isOrgRecipesEmpty ? response.value : _searchRecipesState.orgRecipes,
              recipes: response.value,
            );
          } else {
            _searchRecipesState = searchRecipesState.copyWith(recipes: []);
          }
          break;
        case Failure<List<Recipe>, String>():
      }
    } catch (e) {
      print('Error fetching recipes: $e');
    }

    _searchRecipesState = searchRecipesState.copyWith(isLoading: false);
    notifyListeners();
  }

  Future<void> searchRecipes(String keyword) async {
    try {
      _searchRecipesState = searchRecipesState.copyWith(keyword: keyword);

      if (!_searchRecipesState.isOrgRecipesEmpty) {
        final filteredRecipes = _searchRecipesState.orgRecipes.where((recipe) {
          bool isTimeMatch = true;
          bool isRateMatch = true;
          bool isCategoryMatch = true;

          if (_searchRecipesState.filterSearchState != null) {
            isTimeMatch =
                recipe.time == _searchRecipesState.filterSearchState?.time ||
                _searchRecipesState.filterSearchState?.time == 'All';
            isRateMatch =
                recipe.rating >=
                (_searchRecipesState.filterSearchState?.rate ?? 0);
            isCategoryMatch =
                recipe.category ==
                    _searchRecipesState.filterSearchState?.category ||
                _searchRecipesState.filterSearchState?.category == 'All';
          }

          return (recipe.name.toLowerCase().contains(keyword.toLowerCase()) ||
                  recipe.chef.toLowerCase().contains(keyword.toLowerCase())) &&
              isTimeMatch &&
              isRateMatch &&
              isCategoryMatch;
        }).toList();
        if (filteredRecipes.isNotEmpty) {
          _searchRecipesState = searchRecipesState.copyWith(
            recipes: filteredRecipes,
          );
        } else {
          _searchRecipesState = searchRecipesState.copyWith(
            recipes: [],
          );
        }
        notifyListeners();
      }
    } catch (e) {
      print('Error fetching recipes: $e');
    }
  }

  void updateSearchFilterOptions(FilterSearchState filterSearchState) {

    try {
      _searchRecipesState = _searchRecipesState.copyWith(
        filterSearchState: filterSearchState,
      );

      if (!_searchRecipesState.isOrgRecipesEmpty) {
        final filteredRecipes = _searchRecipesState.orgRecipes.where((recipe) {
          bool isTimeMatch = true;
          bool isRateMatch = true;
          bool isCategoryMatch = true;

          if (_searchRecipesState.filterSearchState != null) {
            isTimeMatch =
                recipe.time == _searchRecipesState.filterSearchState?.time ||
                _searchRecipesState.filterSearchState?.time == 'All';
            // isRateMatch는 _searchRecipesState.filterSearchState?.rate 값이 null이면 true로 설정
            // 이외에는 _searchRecipesState.filterSearchState?.rate 값보다 크고 _searchRecipesState.filterSearchState?.rate + 1 값보다 작은지 확인
            isRateMatch = (_searchRecipesState.filterSearchState?.rate ?? 0) == 0 ? true :
                recipe.rating >=
                (_searchRecipesState.filterSearchState?.rate ?? 0) &&
                recipe.rating <
                    (_searchRecipesState.filterSearchState?.rate ?? 0) + 1;
            isCategoryMatch =
                recipe.category ==
                    _searchRecipesState.filterSearchState?.category ||
                _searchRecipesState.filterSearchState?.category == 'All';
          }

          return isTimeMatch && isRateMatch && isCategoryMatch;
        }).toList();
        if (filteredRecipes.isNotEmpty) {
          _searchRecipesState = searchRecipesState.copyWith(
            recipes: filteredRecipes,
          );
        } else {
          _searchRecipesState = searchRecipesState.copyWith(
            recipes: [],
          );
        }
        notifyListeners();
      }
    } catch (e) {
      print('Error fetching recipes: $e');
    }
  }
}
