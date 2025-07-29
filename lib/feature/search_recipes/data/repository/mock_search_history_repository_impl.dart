import 'package:flutter_recipe_app/feature/search_recipes/domain/repository/search_history_repository.dart';

class MockSearchHistoryRepositoryImpl implements SearchHistoryRepository {
  final List<String> _searchHistory = [];

  @override
  Future<List<String>> fetchSearchHistory() async {
    return _searchHistory;
  }

  @override
  Future<void> saveSearchKeyword(String value) async {
    _searchHistory.add(value);
  }
}
