import 'package:flutter_recipe_app/core/domain/model/recipe/ingredient.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/repository/ingredient_repository.dart';

class MockIngredientRepositoryImpl implements IngredientRepository {
  @override
  Future<List<Ingredient>> fetchAllIngredient(String recipeId) async {
    return [
      Ingredient(id: '1', name: 'Tomatos', imageUrl: '', weight: 500),
      Ingredient(id: '2', name: 'Cabbage', imageUrl: '', weight: 300),
      Ingredient(id: '3', name: 'Taco', imageUrl: '', weight: 300),
      Ingredient(id: '4', name: 'Slice Bread', imageUrl: '', weight: 300),
    ];
  }
}
