import 'package:flutter_recipe_app/data/data_source/recipe_data_source.dart';
import 'package:flutter_recipe_app/data/mock_data/json_recipes.dart';
import 'package:flutter_recipe_app/data/recipe_dto/recipe_dto.dart';
import 'package:http/http.dart' as http;

class MockRecipeDataSourceImpl implements RecipeDataSource {
  @override
  Future<List<RecipeDto>> getSavedRecipeDtos() async {
    return (jsonRecipes['recipes'] as List)
        .map((json) => RecipeDto.fromJson(json))
        .toList();
  }
}

