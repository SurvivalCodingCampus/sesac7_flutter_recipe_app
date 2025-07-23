import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/repository/bookmark_repository.dart';

class GetSavedRecipesUseCase {
  final BookmarkRepository _bookmarkRepository;

  GetSavedRecipesUseCase({
    required BookmarkRepository bookmarkRepository,
  }) : _bookmarkRepository = bookmarkRepository;

  Future<Result<List<Recipe>, String>> execute() async {
    final Result<List<Recipe>, String> result = await _bookmarkRepository.getBookmarkRecipes();
    return result;
  }
}
