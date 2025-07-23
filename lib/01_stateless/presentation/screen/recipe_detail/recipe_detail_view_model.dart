import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/01_stateless/data/model/detailed_recipe.dart';
import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';
import 'package:flutter_recipe_app/01_stateless/data/model/user.dart';
import 'package:flutter_recipe_app/01_stateless/usecase/get_recipe_detail_by_id_use_case.dart';

class RecipeDetailViewModel with ChangeNotifier {
  final GetRecipeDetailByIdUseCase _getRecipeDetailByIdUseCase;
  final int id;

  RecipeDetailViewModel({
    required this.id,
    required GetRecipeDetailByIdUseCase getRecipeDetailByIdUseCase,
  }) : _getRecipeDetailByIdUseCase = getRecipeDetailByIdUseCase;

  DetailedRecipe currentRecipe = DetailedRecipe(
    id: 0,
    recipe: Recipe(
      name: "error",
      author: "error",
      image: "error",
      duration: 0,
      rating: 0.0,
      id: 0,
    ),
    author: User(
      id: 0,
      name: "error",
      image: "error",
      address: "error",
    ),
    procedures: [],
    ingredients: [],
    reviewCount: 0,
  );

  void getRecipeDetailData() async {
    currentRecipe = await _getRecipeDetailByIdUseCase.execute(id);
    notifyListeners();
  }
}
