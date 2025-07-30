import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/repository/bookmark_repository.dart';

class GetSavedRecipeIdsUseCase {
  final BookmarkRepository _bookmarkRepository;

  GetSavedRecipeIdsUseCase({
    required BookmarkRepository bookmarkRepository,
  }) : _bookmarkRepository = bookmarkRepository;

  Future<Result<List<int>, String>> execute() async {
    final Result<List<int>, String> bookmarkRecipeIdsResult =
        await _bookmarkRepository.getBookmarkRecipesId();

    switch (bookmarkRecipeIdsResult) {
      case Success<List<int>, String>():
        return Success(bookmarkRecipeIdsResult.data);
      case Error<List<int>, String>():
        return Success([]);
    }
  }
}
