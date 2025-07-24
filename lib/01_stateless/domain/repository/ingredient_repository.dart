import 'package:flutter_recipe_app/01_stateless/domain/model/ingredient.dart';

abstract interface class IngredientRepository {
  Future<List<Ingredient>> getIngredients(int recipeId);
}
