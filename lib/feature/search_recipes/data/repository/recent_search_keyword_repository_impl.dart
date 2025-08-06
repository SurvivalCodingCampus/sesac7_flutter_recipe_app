import 'package:flutter_recipe_app/feature/search_recipes/data/data_source/recent_search_keyword_data_source.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/repository/recent_search_keyword_repository.dart';

class RecentSearchKeywordRepositoryImpl
    implements RecentSearchKeywordRepository {
  final RecentSearchKeywordDataSource _recentSearchKeywordDataSource;

  RecentSearchKeywordRepositoryImpl({
    required RecentSearchKeywordDataSource recentSearchKeywordDataSource,
  }) : _recentSearchKeywordDataSource = recentSearchKeywordDataSource;

  @override
  Future<String> fetchRecentSearchKeyword() async {
    return await _recentSearchKeywordDataSource.fetchRecentSearchKeyword() ??
        '';
  }

  @override
  Future<void> saveSearchKeyword(String value) async {
    await _recentSearchKeywordDataSource.saveSearchKeyword(value);
  }
}
