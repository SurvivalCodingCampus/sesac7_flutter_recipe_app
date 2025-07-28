import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/repository/search_history_repository.dart';

class SaveSearchKeywordUseCase {
  final SearchHistoryRepository _searchHistoryRepository;

  SaveSearchKeywordUseCase({
    required SearchHistoryRepository searchHistoryRepository,
  }) : _searchHistoryRepository = searchHistoryRepository;

  Future<Result<void, String>> execute(String value) async {
    try {
      await _searchHistoryRepository.saveSearchKeyword(value);

      return Result.success(null);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
