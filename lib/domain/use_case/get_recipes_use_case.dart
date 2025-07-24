import 'package:flutter_recipe_app/data/repository/recipe_repository.dart';
import '../../data/model/recipe.dart';

class GetRecipesUseCase {
  final RecipeRepository _repository;

  GetRecipesUseCase(this._repository);

  Future<List<Recipe>> call() async {
    return await _repository.getRecipes();
  }
}
