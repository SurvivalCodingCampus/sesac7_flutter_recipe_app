import 'package:flutter_recipe_app/data/data_source/local/local_search_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;

class LocalSearchDataSourceImpl implements LocalSearchDataSource {
  static const String recentKeywordPrefKey = 'RecentKeyword';

  @override
  Future<bool> deleteRecentSearchKeyword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.remove(recentKeywordPrefKey);
  }

  @override
  Future<String?> getRecentSearchKeyword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(recentKeywordPrefKey);
  }

  @override
  Future<bool> saveRecentSearchKeyword(String keyword) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(recentKeywordPrefKey, keyword);
  }
}