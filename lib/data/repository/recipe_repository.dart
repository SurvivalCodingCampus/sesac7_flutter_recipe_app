import '../../data/model/recipe.dart';

abstract class RecipeRepository {
  Future<List<Recipe>> getRecipes();
}
