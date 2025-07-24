import '../../data/model/recipe.dart';

class ToggleBookmarkUseCase {
  List<Recipe> call(List<Recipe> recipes, String recipeId) {
    return recipes.map((recipe) {
      if (recipe.id == recipeId) {
        return recipe.copyWith(isBookmarked: !recipe.isBookmarked);
      }
      return recipe;
    }).toList();
  }
}
