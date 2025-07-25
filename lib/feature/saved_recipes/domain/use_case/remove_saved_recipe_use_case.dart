import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/domain/repository/bookmark_repository.dart';

class RemoveSavedRecipeUseCase {
  final BookmarkRepository _bookmarkRepository;

  RemoveSavedRecipeUseCase({required BookmarkRepository bookmarkRepository})
    : _bookmarkRepository = bookmarkRepository;

  List<Recipe> execute(List<Recipe> recipes, String recipeId) {
    _bookmarkRepository.removeBookmarks(recipeId);

    return recipes.where((e) => e.id != recipeId).toList();
  }
}
