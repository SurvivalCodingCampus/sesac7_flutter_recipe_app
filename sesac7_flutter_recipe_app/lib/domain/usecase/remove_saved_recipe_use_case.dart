import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/repository/bookmark_repository.dart';

class RemoveSavedRecipeUseCase {
  final BookmarkRepository _bookmarkRepository;

  RemoveSavedRecipeUseCase({required BookmarkRepository bookmarkRepository})
    : _bookmarkRepository = bookmarkRepository;

  Future<Result<void, String>> execute(int id) async {
    final Result<void, String> result = await _bookmarkRepository.removeBookmarkRecipe(id);
    return result;
  }
}
