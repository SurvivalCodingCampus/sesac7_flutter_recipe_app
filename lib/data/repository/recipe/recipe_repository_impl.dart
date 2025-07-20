import 'package:flutter_recipe_app/core/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/core/response.dart';

import 'package:flutter_recipe_app/data/data_source/recipe/recipe_data_source.dart';
import 'package:flutter_recipe_app/data/dto/recipe/category_dto.dart';
import 'package:flutter_recipe_app/data/dto/recipe/recipe_dto.dart';
import 'package:flutter_recipe_app/data/mapper/recipe/category_mapper.dart';
import 'package:flutter_recipe_app/data/mapper/recipe/recipe_mapper.dart';
import 'package:flutter_recipe_app/data/model/recipe/category.dart';
import 'package:flutter_recipe_app/data/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/data/repository/recipe/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _dataSource;

  RecipeRepositoryImpl({required RecipeDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<Result<List<Recipe>, NetworkError>> getRecipes() async {
    try {
      final response = await _dataSource.getRecipes();

      final int statusCode = response.statusCode;

      if (statusCode >= 200 && statusCode < 300) {
        try {
          final List<RecipeDto> dtoList = response.body;
          final List<Recipe> data = dtoList.map((dto) => RecipeMapper.fromDto(dto)).toList();
          return Result.success(data);
        } catch (e) {
          print("파싱 에러 : $e");
          return Result.error(NetworkError.parseError);
        }
      } else {
        switch (statusCode) {
          case 401:
            return Result.error(NetworkError.unauthorized);
          case 404:
            return Result.error(NetworkError.notFound);
          case 504:
            return Result.error(NetworkError.requestTimeout);
          case int code when code >= 500 && code < 600:
            return Result.error(NetworkError.serverError);
          default:
            return Result.error(NetworkError.unknown);
        }
      }
    } catch (e) {
      print("레시피 가져오기 중 예외 발생: $e");
      if (e is FormatException) {
        return Result.error(NetworkError.parseError);
      }
      return Result.error(NetworkError.unknown);
    }
  }

  @override
  Future<Result<List<Category>, NetworkError>> getCategory() async {
    try {
      final response = await _dataSource.getCategory();

      final int statusCode = response.statusCode;

      if (statusCode >= 200 && statusCode < 300) {

        try {
          final List<CategoryDto> dtoList = response.body;
          final List<Category> data = dtoList.map((dto) => CategoryMapper.fromDto(dto)).toList();
          return Result.success(data);
        } catch (e) {
          print("파싱 에러 $e");
          return Result.error(NetworkError.parseError);
        }
      } else {
        switch (statusCode) {
          case 401:
            return Result.error(NetworkError.unauthorized);
          case 404:
            return Result.error(NetworkError.notFound);
          case 504:
            return Result.error(NetworkError.requestTimeout);
          case int code when code >= 500 && code < 600:
            return Result.error(NetworkError.serverError);
          default:
            return Result.error(NetworkError.unknown);
        }
      }
    } catch (e) {
      print("파싱 에러 : $e");
      if (e is FormatException) {
        return Result.error(NetworkError.parseError);
      }
      return Result.error(NetworkError.unknown);
    }
  }
}