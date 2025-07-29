import 'package:flutter_recipe_app/data/model/recipes.dart';

import '../../core/routing/network_error.dart';
import '../../core/routing/result.dart';

abstract interface class RecipeRepository {
  Future<Result<List<Recipes>, NetworkError>> getRecipes();
}
