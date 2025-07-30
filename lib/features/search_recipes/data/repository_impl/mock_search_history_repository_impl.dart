import 'package:flutter_recipe_app/core/data/recipe/domain/model/recipe.dart';

import '../domain/repository/mock_search_history_repository.dart';

class MockSearchHistoryRepositoryImpl implements MockSearchHistoryRepository {
  final List<Recipe> _searchHistory = [];

  @override
  void addSearchHistory(List<Recipe> searchHistories) {
    for (int i = 0; i < searchHistories.length; i++) {
      if (!_searchHistory.contains(searchHistories[i])) {
        _searchHistory.add(searchHistories[i]);
      }
    }
  }

  @override
  List<Recipe> getSearchHistories() {
    return _searchHistory;
  }
}
