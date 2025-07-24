import '../model/recipe_ingredient.dart';

abstract interface class IngridentRepository {
  List<RecipeIngredient> getIngredients();
}