import 'package:flutter_recipe_app/core/domain/repository/recipes_repository.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/recipe_ingredients/domain/repository/ingredient_repository.dart';

import '../../../core/domain/model/ingredient.dart';

class IngredientRepositoryImpl implements IngredientRepository {

  final RecipeRepository _recipeRepository;

  IngredientRepositoryImpl(this._recipeRepository);

  @override
  Future<List<Ingredient>> fetchIngredients(int recipeId) async {
    final result = await _recipeRepository.fetchRecipeById(recipeId);
    return result.when(
      success: (recipe) => recipe.ingredients,
      failure: (error) => [],
    );

    // final response = await http.get(
    //   Uri.parse(
    //     'https://raw.githubusercontent.com/junsuk5/mock_json/refs/heads/main/recipe/ingredients.json',
    //   ),
    // );
    //
    // if (response.statusCode == 200) {
    //   final decoded = json.decode(response.body)['ingredients'];
    //   final List<dynamic> ingredients = decoded;
    //
    //   return ingredients.map((e) => Ingredient.fromJson(e)).toList();
    // } else {
    //   throw Exception('Failed to load ingredients');
    // }
  }
}
