import 'package:flutter_recipe_app/feature/search_recipes/domain/repository/recent_search_keyword_repository.dart';

class SaveSearchKeywordUseCase {
  final RecentSearchKeywordRepository _searchHistoryRepository;

  SaveSearchKeywordUseCase({
    required RecentSearchKeywordRepository searchHistoryRepository,
  }) : _searchHistoryRepository = searchHistoryRepository;

  Future<void> execute(String value) async {
    try {
      await _searchHistoryRepository.saveSearchKeyword(value);
    } catch (e) {
      // TODO: log
    }
  }
}
