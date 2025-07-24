
import '../model/recipe.dart';

class GetRecipesRemoveByRecipeId {

  List<Recipe> getRecipesRemoveByRecipeId(String recipeId, List<Recipe> recipes) {
    if (isIntegerUsingTryParse(recipeId)) {
      final recipeIntId = int.parse(recipeId);
      return recipes.where((e) => e.id != recipeIntId).toList();
    } else {
      return [];
    }
  }

  // 정수만 확인하고 싶을 경우
  bool isIntegerUsingTryParse(String str) {
    return int.tryParse(str) != null;
  }
}
