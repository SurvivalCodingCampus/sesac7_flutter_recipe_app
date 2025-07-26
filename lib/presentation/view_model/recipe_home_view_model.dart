import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/state_holder/recipe_home_state_holder.dart';

import '../../domain/model/recipe.dart';
import '../../domain/use_case/get_home_recipe_use_case.dart';
import '../screen/action/main_screen_action.dart';

class RecipeHomeViewModel with ChangeNotifier {
  final GetHomeRecipeUseCase _getHomeRecipeUseCase;

  RecipeHomeStateHolder _state;


  RecipeHomeViewModel({
    required GetHomeRecipeUseCase getHomeRecipeUseCase,
  }) : _getHomeRecipeUseCase = getHomeRecipeUseCase,
       _state = RecipeHomeStateHolder() {
    _loadRecipes();
  }

  // UI에서 접근할 상태 Getter들
  RecipeHomeStateHolder get state => _state; // 모든 상태를 한 번에 노출

  void onAction(MainScreenAction action) {
    switch (action) {
      case SelectCategory():
        _selectCategory(action.category);
        break;
      case ToggleFavorite():
        _toggleFavorite(action.recipe);
        break;
    }
  }

  // 레시피 데이터 로드
  Future<void> _loadRecipes() async {
    _updateState(isLoading: true, errorMessage: null); // 로딩 시작
    try {
      final List<Recipe> fetchedRecipes = await _getHomeRecipeUseCase.getRecipes();

      final Set<String> uniqueCategories = fetchedRecipes.map((e) => e.category).toSet();
      final List<String> categories = ['All', ...uniqueCategories];

      // 초기 필터링 (All 카테고리)
      final List<Recipe> initialFilteredRecipes = List.from(fetchedRecipes);

      _updateState(
        allRecipes: fetchedRecipes,
        categories: categories,
        filteredRecipes: initialFilteredRecipes,
        isLoading: false,
        selectedCategory: 'All',
      );
    } catch (e) {
      _updateState(
        isLoading: false,
        errorMessage: 'Failed to load recipes: $e',
      );
      print('Error loading recipes: $e');
    }
  }

  // 카테고리 변경 시 레시피 필터링
  void _selectCategory(String category) {
    if (_state.selectedCategory == category) return; // 동일 카테고리 선택 시 무시

    List<Recipe> newFilteredRecipes;
    if (category == 'All') {
      newFilteredRecipes = List.from(_state.allRecipes);
    } else {
      newFilteredRecipes = _state.allRecipes.where((recipe) => recipe.category == category).toList();
    }

    _updateState(
      selectedCategory: category,
      filteredRecipes: newFilteredRecipes,
    );
  }

  // 즐겨찾기 상태 토글
  Future<void> _toggleFavorite(Recipe recipe) async {
    final int index = _state.allRecipes.indexWhere((r) => r.id == recipe.id);
    if (index != -1) {
      // Optimistic Update: UI를 즉시 업데이트
      final List<Recipe> updatedAllRecipes = List.from(_state.allRecipes);
      updatedAllRecipes[index] = updatedAllRecipes[index].copyWith(isSaved: !updatedAllRecipes[index].isSaved);

      // 필터링된 목록도 업데이트 (새로운 카테고리에 맞춰 다시 필터링)
      final List<Recipe> newFilteredRecipes = _state.selectedCategory == 'All'
          ? List.from(updatedAllRecipes)
          : updatedAllRecipes.where((r) => r.category == _state.selectedCategory).toList();

      _updateState(
        allRecipes: updatedAllRecipes,
        filteredRecipes: newFilteredRecipes,
      );
    }
  }

  // 상태를 업데이트하고 UI에 알리는 private 헬퍼 메서드
  void _updateState({
    List<Recipe>? allRecipes,
    List<Recipe>? filteredRecipes,
    List<String>? categories,
    String? selectedCategory,
    bool? isLoading,
    String? errorMessage,
  }) {
    _state = _state.copyWith(
      allRecipes: allRecipes,
      filteredRecipes: filteredRecipes,
      categories: categories,
      selectedCategory: selectedCategory,
      isLoading: isLoading,
      errorMessage: errorMessage,
    );
    notifyListeners();
  }
}