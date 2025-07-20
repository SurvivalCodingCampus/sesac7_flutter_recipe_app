import 'package:flutter/material.dart';

import '../../../model/recipe.dart';
import '../../../repository/recipes_repository.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _repository;
  List<Recipe> _allRecipes = [];
  List<Recipe> get allRecipes => List.unmodifiable(_allRecipes);
  // SearchRecipesState _state = SearchRecipesState.initial();
  // SearchRecipesState get state => _state;

  SearchRecipesViewModel(this._repository);

  List<String> get allCategories {
    final categories = _allRecipes.map((e) => e.category).toSet().toList();
    categories.sort();
    return ['All', ...categories];
  }

  Future<void> loadRecipes() async {
    _allRecipes = await _repository.fetchRecipes();
    notifyListeners();
  }

  // 검색어 변경
  void updateSearchText(String text) {
    _state = _state.copyWith(searchText: text);
    _applyFilters();
  }

  // 포커스 변경
  void setFocus(bool isFocused) {
    _state = _state.copyWith(isFocused: isFocused);
    notifyListeners();
  }

  // 비활성화 설정
  void setDisabled(bool isDisabled) {
    _state = _state.copyWith(isDisabled: isDisabled);
    notifyListeners();
  }

  // 필터 업데이트 (한 번에 전달)
  void updateFilters({TimeFilter? time, RateFilter? rate, String? category}) {
    final newFilter = _state.filter.copyWith(
      time: time,
      rate: rate,
      category: category,
    );
    _state = _state.copyWith(filter: newFilter);
    _applyFilters();
  }

  // 필터 적용
  void _applyFilters() {
    final keyword = _state.searchText.toLowerCase();
    final filter = _state.filter;

    List<Recipe> filtered = _allRecipes.where((recipe) {
      final matchesKeyword = keyword.isEmpty || recipe.name.toLowerCase().contains(keyword);
      final matchesCategory = filter.category == 'All' || recipe.category == filter.category;
      final matchesRate = filter.rate == null || recipe.rating.floor() == filter.rate!.index + 1;
      // 시간 정렬은 이후 정렬 단계에서 처리
      return matchesKeyword && matchesCategory && matchesRate;
    }).toList();

    switch (filter.time) {
      case TimeFilter.newest:
        filtered.sort((a, b) => b.id.compareTo(a.id));
        break;
      case TimeFilter.oldest:
        filtered.sort((a, b) => a.id.compareTo(b.id));
        break;
      case TimeFilter.popularity:
        filtered.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case TimeFilter.all:
        break;
    }

    _state = _state.copyWith(results: filtered);
    notifyListeners();
  }


}
