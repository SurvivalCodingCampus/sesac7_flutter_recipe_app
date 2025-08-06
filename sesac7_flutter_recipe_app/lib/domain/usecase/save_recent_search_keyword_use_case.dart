import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/repository/search_repository.dart';

class SaveRecentSearchKeywordUseCase {
  final SearchRepository _searchRepository;

  const SaveRecentSearchKeywordUseCase({
    required SearchRepository searchRepository,
  }) : _searchRepository = searchRepository;

  Future<Result<void, void>> execute(String keyword) async {
    final Result<void, void> result = await _searchRepository.saveRecentSearchKeyword(keyword);
    return result;
  }
}