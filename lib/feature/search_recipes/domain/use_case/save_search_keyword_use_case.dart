import 'package:flutter_recipe_app/feature/search_recipes/domain/repository/search_history_repository.dart';

class SaveSearchKeywordUseCase {
  final SearchHistoryRepository _searchHistoryRepository;

  SaveSearchKeywordUseCase({
    required SearchHistoryRepository searchHistoryRepository,
  }) : _searchHistoryRepository = searchHistoryRepository;

  Future<void> execute(String value) async {
    try {
      await _searchHistoryRepository.saveSearchKeyword(value);
    } catch (e) {
      // TODO: log
    }
  }
}
