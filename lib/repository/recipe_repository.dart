

import '../core/api_response.dart';
import '../data/model/recipe.dart';

abstract interface class RecipeRepository {
  Future<ApiResponse<List<Recipe>>> getRecipes();
}