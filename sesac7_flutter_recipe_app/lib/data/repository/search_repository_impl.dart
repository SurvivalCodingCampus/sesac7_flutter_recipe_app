import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/data/data_source/local/local_search_data_source.dart';
import 'package:flutter_recipe_app/domain/repository/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final LocalSearchDataSource _localSearchDataSource;

  const SearchRepositoryImpl({
    required LocalSearchDataSource localSearchDataSource,
  }) : _localSearchDataSource = localSearchDataSource;

  @override
  Future<Result<void, void>> saveRecentSearchKeyword(String keyword) async {
    final bool result = await _localSearchDataSource.saveRecentSearchKeyword(
      keyword,
    );
    return result ? Success(null) : Error(null);
  }

  @override
  Future<Result<void, void>> deleteRecentSearchKeyword() async {
    final bool result = await _localSearchDataSource
        .deleteRecentSearchKeyword();
    return result ? Success(null) : Error(null);
  }

  @override
  Future<Result<String, void>> getRecentSearchKeyword() async {
    final String? result = await _localSearchDataSource
        .getRecentSearchKeyword();
    return result != null ? Success(result) : Error(null);
  }
}
