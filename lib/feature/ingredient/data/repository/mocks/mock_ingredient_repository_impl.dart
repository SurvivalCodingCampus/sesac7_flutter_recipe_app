import 'package:flutter_recipe_app/core/domain/model/recipe/ingredient.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/repository/ingredient_repository.dart';

class MockIngredientRepositoryImpl implements IngredientRepository {
  @override
  Future<List<Ingredient>> fetchAllIngredient(String recipeId) {
    // TODO: implement fetchAllIngredient
    throw UnimplementedError();
  }
}
