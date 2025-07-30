import '../../../../core/data/recipe/domain/model/recipe.dart';

abstract interface class MockBookmarkRepository {
  List<Recipe> getAllRecipes();

  List<Recipe> getSavedRecipes();

  // void addRecipe(Recipe recipe);

  void deleteRecipe(int id);
}
