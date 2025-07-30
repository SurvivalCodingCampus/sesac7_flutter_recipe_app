import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/repository/search_history_repository.dart';

class GetRecentSearchKeywordUseCase {
  final SearchHistoryRepository _searchHistoryRepository;

  GetRecentSearchKeywordUseCase({
    required SearchHistoryRepository searchHistoryRepository,
  }) : _searchHistoryRepository = searchHistoryRepository;

  Future<Result<String, String>> execute() async {
    try {
      final searchHistory = await _searchHistoryRepository.fetchSearchHistory();

      if (searchHistory.isEmpty) {
        return Result.success('');
      }

      return Result.success(searchHistory.last);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
