import '../model/recipe.dart';

class GetRecipeByRecipeId {
  Recipe? getRecipeByRecipeId(String recipeId, List<Recipe> recipes) {
    if (isIntegerUsingTryParse(recipeId)) {
      final recipeIntId = int.parse(recipeId);
      return recipes.firstWhere((e) => e.id == recipeIntId);
    } else {
      return null;
    }
  }

  // 정수만 확인하고 싶을 경우
  bool isIntegerUsingTryParse(String str) {
    return int.tryParse(str) != null;
  }
}