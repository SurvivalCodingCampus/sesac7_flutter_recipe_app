import '../dto/recipe_dto.dart';

abstract interface class BookmarkDataSource {
  Future<List<RecipeDto>> getSavedRecipes();
}
