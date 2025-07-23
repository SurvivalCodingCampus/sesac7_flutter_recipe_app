import 'package:flutter_recipe_app/core/domain/model/recipe/ingredient.dart';

abstract interface class IngredientRepository {
  Future<List<Ingredient>> fetchAllIngredient(String recipeId);
}
