import '../../../core/data/recipe/dto/recipe_dto.dart';

abstract interface class MockBookmarkDataSource {
  List<RecipeDto> getSavedRecipes();
}
