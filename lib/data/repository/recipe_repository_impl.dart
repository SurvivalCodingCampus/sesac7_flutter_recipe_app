import 'package:flutter_recipe_app/data/mapper/recipe_mapper.dart';
import 'package:flutter_recipe_app/data/model/recipes.dart';
import 'package:flutter_recipe_app/data/repository/recipe_repository.dart';

import '../../core/routing/network_error.dart';
import '../../core/routing/result.dart';
import '../data_source/recipe_data_source.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _datasource;

  RecipeRepositoryImpl(this._datasource);

  @override
  Future<Result<List<Recipes>, NetworkError>> getRecipes() async {
    try {
      final response = await _datasource.getRecipes();

      return switch (response.statusCode) {
        >= 200 && < 300 => Result.success(
          response.body.recipes
                  ?.map((recipeDto) => recipeDto.toModel())
                  .toList() ??
              [],
        ),
        401 => Result.error(NetworkError.unauthorized),
        404 => Result.error(NetworkError.notFound),
        >= 500 && <= 599 => Result.error(NetworkError.serverError),
        _ => Result.error(NetworkError.unknown),
      };
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }
}
