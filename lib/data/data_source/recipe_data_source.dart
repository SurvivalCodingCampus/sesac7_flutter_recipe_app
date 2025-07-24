import '../dto/recipe_dto.dart';

abstract interface class RecipeDataSource {
  Future<List<RecipeDto>> getAllRecipes();
}
