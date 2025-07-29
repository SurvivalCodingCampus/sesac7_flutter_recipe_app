import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/repository/bookmark_repository.dart';

class AddSavedRecipeUseCase {
  final BookmarkRepository _bookmarkRepository;

  AddSavedRecipeUseCase({required BookmarkRepository bookmarkRepository})
    : _bookmarkRepository = bookmarkRepository;

  Future<Result<void, String>> execute(int recipeId) async {
    final Result<void, String> result = await _bookmarkRepository
        .addBookmarkRecipe(recipeId);
    return result;
  }
}
