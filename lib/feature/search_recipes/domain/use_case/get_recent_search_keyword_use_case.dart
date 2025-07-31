import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/repository/recent_search_keyword_repository.dart';

class GetRecentSearchKeywordUseCase {
  final RecentSearchKeywordRepository _searchHistoryRepository;

  GetRecentSearchKeywordUseCase({
    required RecentSearchKeywordRepository searchHistoryRepository,
  }) : _searchHistoryRepository = searchHistoryRepository;

  Future<Result<String, String>> execute() async {
    try {
      final recentSearchKeyword = await _searchHistoryRepository
          .fetchRecentSearchKeyword();

      return Result.success(recentSearchKeyword);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
