import 'package:flutter_recipe_app/core/handle_response.dart';
import 'package:flutter_recipe_app/core/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/data/data_source/recipe/recipe_data_source.dart';
import 'package:flutter_recipe_app/data/dto/recipe/recipe_dto.dart';
import 'package:flutter_recipe_app/data/mapper/recipe/recipe_mapper.dart';
import 'package:flutter_recipe_app/data/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/data/repository/recipe/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _dataSource;

  RecipeRepositoryImpl(this._dataSource);

  @override
  Future<Result<List<Recipe>, NetworkError>> getRecipes() async {
    try {
      final response = await _dataSource.getRecipes();

      return handleResponse<List<Recipe>, List<RecipeDto>>(
        response,
            (List<RecipeDto> dtoList) {
          return dtoList.map((dto) => RecipeMapper.fromDto(dto)).toList();
        },
      );
    } catch (e) {
      return handleRepositoryException<List<Recipe>>(e);
    }
  }
}