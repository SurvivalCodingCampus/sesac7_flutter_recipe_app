import '../../core/routing/response.dart';

abstract interface class RecipeDataSource {
  Future<Response<RecipesResultDto>> getRecipes();
}
