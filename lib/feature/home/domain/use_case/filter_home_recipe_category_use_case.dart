import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/feature/home/domain/model/home_recipe_category.dart';

class FilterHomeRecipeCategoryUseCase {
  List<Recipe> execute({
    required List<Recipe> recipes,
    required HomeRecipeCategory category,
  }) {
    if (category == HomeRecipeCategory.all) {
      return recipes;
    }

    return recipes.where((e) => e.category == category.toString()).toList();
  }
}
