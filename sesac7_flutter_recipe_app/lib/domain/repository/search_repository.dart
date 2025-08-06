import 'package:flutter_recipe_app/core/result.dart';

abstract interface class SearchRepository {
  Future<Result<String, void>> getRecentSearchKeyword();
  Future<Result<void, void>> saveRecentSearchKeyword(String keyword);
  Future<Result<void, void>> deleteRecentSearchKeyword();
}