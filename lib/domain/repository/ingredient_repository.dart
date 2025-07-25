
import '../../core/result.dart';
import '../model/recipe_ingredient.dart';

abstract interface class IngredientRepository {
  Future<Result<List<RecipeIngredient>, String>> getIngredients(String recipeId);
}