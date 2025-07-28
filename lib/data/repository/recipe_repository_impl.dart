import 'package:flutter_app/data/core/network_error.dart';
import 'package:flutter_app/data/core/result.dart';
import 'package:flutter_app/data/data_source/recipe_data_source.dart';
import 'package:flutter_app/data/mapper/recipes_mapper.dart';
import 'package:flutter_app/data/model/recipe.dart';
import 'package:flutter_app/data/repository/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _datasource;

  RecipeRepositoryImpl(this._datasource);

  @override
  Future<Result<List<Recipe>, NetworkError>> getRecipes() async {
    try {
      final response = await _datasource.getRecipes();

      return switch (response.statusCode) {
        >= 200 && < 300 => Result.success(
          // recipesDto 이름 명의 혼돈에 따른 실수 발생함
          response.body.recipes?.map((resipeDto) => resipeDto.toModel()).toList() ?? [],
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
