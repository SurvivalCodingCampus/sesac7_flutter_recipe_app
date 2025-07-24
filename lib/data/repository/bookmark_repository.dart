import '../model/recipe.dart';

abstract interface class BookmarkRepository {
  Future<List<Recipe>> getSavedRecipes();
}
