import 'package:flutter_recipe_app/01_stateless/data/model/detailed_recipe.dart';
import 'package:flutter_recipe_app/01_stateless/data/model/detailed_recipe_fragment.dart';
import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';
import 'package:flutter_recipe_app/01_stateless/data/model/user.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/recipe_detail_fragment_repository.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/recipe_repository.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/user_repository.dart';

class GetRecipeDetailByIdUseCase {
  final UserRepository _userRepository;
  final RecipeRepository _recipeRepository;
  final RecipeDetailFragmentRepository _recipeDetailFragmentRepository;

  GetRecipeDetailByIdUseCase({
    required UserRepository userRepository,
    required RecipeRepository recipeRepository,
    required RecipeDetailFragmentRepository recipeDetailFragmentRepository,
  }) :
    _userRepository = userRepository,
    _recipeRepository = recipeRepository,
    _recipeDetailFragmentRepository = recipeDetailFragmentRepository;




  Future<DetailedRecipe> execute(int id) async {
    DetailedRecipeFragment recipeFragment = await _recipeDetailFragmentRepository
        .getRecipeDetailFragmentById(id);
    Recipe recipe = await _recipeRepository.getRecipeById(id);
    User author = await _userRepository.getUserById(recipeFragment.authorId);

    DetailedRecipe detailedRecipe = DetailedRecipe(
      id: id,
      recipe: recipe,
      author: author,
      procedures: recipeFragment.procedures,
      ingredients: recipeFragment.ingredients,
      reviewCount: recipeFragment.reviewCount,
    );

    return detailedRecipe;
  }
}
