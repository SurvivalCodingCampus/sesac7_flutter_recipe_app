import 'package:flutter_recipe_app/feature/search_recipes/data/data_source/recent_search_keyword_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecentSearchKeywordDataSourceImpl
    implements RecentSearchKeywordDataSource {
  static const String key = 'recentSearch';

  final SharedPreferencesAsync _sharedPreferencesAsync;

  RecentSearchKeywordDataSourceImpl({
    required SharedPreferencesAsync sharedPreferencesAsync,
  }) : _sharedPreferencesAsync = sharedPreferencesAsync;

  @override
  Future<String?> fetchRecentSearchKeyword() async {
    return await _sharedPreferencesAsync.getString(key);
  }

  @override
  Future<void> saveSearchKeyword(String value) async {
    await _sharedPreferencesAsync.setString(key, value);
  }
}
