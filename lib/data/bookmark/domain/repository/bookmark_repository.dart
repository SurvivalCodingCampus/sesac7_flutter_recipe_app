import '../../../../core/data/recipe/domain/model/recipe.dart';

abstract interface class BookmarkRepository {
  Future<List<Recipe>> getSavedRecipes();
}
