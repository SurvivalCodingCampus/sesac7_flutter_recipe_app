import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/recipe_repository.dart';

class FilterRecipesByKeywordUseCase {
  final RecipeRepository _recipeRepository;

  FilterRecipesByKeywordUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<List<Recipe>> execute(String keyword, Set<String> categories, int ratings) async {
    List<Recipe> recipes = await _recipeRepository.getRecipes();
    List<Recipe> filteredRecipes = recipes.where((e) => e.name.toLowerCase().contains(keyword.toLowerCase()) || e.author.toLowerCase().contains(keyword.toLowerCase())).toList();
    filteredRecipes = filteredRecipes.where((e) => e.rating >= ratings).toList();
    if(categories.isEmpty) {
      return filteredRecipes;
    } else{
      filteredRecipes = filteredRecipes.where((e) => e.categories.intersection(categories).isNotEmpty).toList();
      return filteredRecipes;
    }

  }
}