import 'package:flutter_recipe_app/01_stateless/data/model/detailed_recipe_fragment.dart';

abstract interface class RecipeDetailFragmentRepository{

  Future<DetailedRecipeFragment> getRecipeDetailFragmentById(int id);
}