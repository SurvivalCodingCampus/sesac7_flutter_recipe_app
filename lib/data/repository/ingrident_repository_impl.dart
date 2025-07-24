import 'package:flutter_recipe_app/domain/repository/ingrident_repository.dart';

import '../../domain/model/recipe.dart';
import '../../domain/model/recipe_ingredient.dart';

class IngridentRepositoryImpl implements IngridentRepository {

  Recipe _recipe;

  IngridentRepositoryImpl(this._recipe);

  @override
  List<RecipeIngredient> getIngredients() {
    return _recipe.ingredients;
  }
}