import 'package:flutter_recipe_app/core/response.dart';
import 'package:flutter_recipe_app/data/dto/recipe/category_dto.dart';
import 'package:flutter_recipe_app/data/dto/recipe/recipe_dto.dart';

abstract interface class RecipeDataSource {
  Future<Response<List<RecipeDto>>> getRecipes();

  Future<Response<List<CategoryDto>>> getCategory();

}