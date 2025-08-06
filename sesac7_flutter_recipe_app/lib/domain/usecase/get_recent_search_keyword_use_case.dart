import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/repository/search_repository.dart';

class GetRecentSearchKeywordUseCase {
  final SearchRepository _searchRepository;

  const GetRecentSearchKeywordUseCase({
    required SearchRepository searchRepository,
  }) : _searchRepository = searchRepository;

  Future<Result<String, void>> execute() async {
    final Result<String, void> result = await _searchRepository
        .getRecentSearchKeyword();
    return result;
  }
}
