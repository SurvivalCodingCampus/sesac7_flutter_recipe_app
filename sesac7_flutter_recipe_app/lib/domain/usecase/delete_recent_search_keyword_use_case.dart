import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/repository/search_repository.dart';

class DeleteRecentSearchKeywordUseCase {
  final SearchRepository _searchRepository;

  const DeleteRecentSearchKeywordUseCase({
    required SearchRepository searchRepository,
  }) : _searchRepository = searchRepository;

  Future<Result<void, void>> execute() async {
    final Result<void, void> result = await _searchRepository
        .deleteRecentSearchKeyword();
    return result;
  }
}
