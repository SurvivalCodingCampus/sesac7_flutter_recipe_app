import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/response.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/data/data_source/recipe_data_source/recipe_data_source.dart';
import 'package:flutter_recipe_app/data/dto/recipe_dto.dart';
import 'package:flutter_recipe_app/data/mapper/recipe_mapper.dart';
import 'package:flutter_recipe_app/data/model/recipe.dart';
import 'package:flutter_recipe_app/data/repository/recipe_repository/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _dataSource;

  RecipeRepositoryImpl(RecipeDataSource dataSource) : _dataSource = dataSource;

  @override
  Future<Result<List<Recipe>, NetworkError>> getRecipes() async {
    try {
      final Response<List<RecipeDto>> response = await _dataSource.getRecipes();
      final NetworkError? networkErrorType = response.statusCode.statusCodeToNetworkErrorType();

      if (networkErrorType == null) {
        return Success(response.body.map((dto) => dto.toModel()).toList());
      } else {
        return Error(networkErrorType);
      }
    } on FormatException {
      return Error(NetworkError.jsonParsingError);
    } catch (e) {
      return Error(NetworkError.unKnown);
    }
  }
}
