import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/enum/rating_type.dart';
import 'package:flutter_recipe_app/core/enum/search_recipe_filter_category_type.dart';
import 'package:flutter_recipe_app/core/enum/search_recipe_filter_time_type.dart';
import 'package:flutter_recipe_app/core/response.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/data/data_source/recipe_data_source/recipe_data_source.dart';
import 'package:flutter_recipe_app/data/dto/recipes_dto.dart';
import 'package:flutter_recipe_app/data/mapper/recipes_mapper.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/repository/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  RecipeRepositoryImpl({
    required RecipeDataSource recipeDataSource,
  }) : _recipeDataSource = recipeDataSource;

  @override
  Future<Result<List<Recipe>, NetworkError>> getRecipes() async {
    try {
      final Response<RecipesDto> response = await _recipeDataSource
          .getRecipes();
      final NetworkError? networkErrorType = response.statusCode
          .statusCodeToNetworkErrorType();

      if (networkErrorType == null) {
        return Success(response.body.toModel().recipes);
      } else {
        return Error(networkErrorType);
      }
    } on FormatException {
      return Error(NetworkError.jsonParsingError);
    } catch (e) {
      return Error(NetworkError.unKnown);
    }
  }

  // fixme 임시로 전체 레시피 갖고 오도록 처리
  @override
  Future<Result<List<Recipe>, NetworkError>> getRecentRecipes() async {
    try {
      final Response<RecipesDto> response = await _recipeDataSource
          .getRecipes();
      final NetworkError? networkErrorType = response.statusCode
          .statusCodeToNetworkErrorType();

      if (networkErrorType == null) {
        return Success(response.body.toModel().recipes);
      } else {
        return Error(networkErrorType);
      }
    } on FormatException {
      return Error(NetworkError.jsonParsingError);
    } catch (e) {
      return Error(NetworkError.unKnown);
    }
  }

  // fixme 임시로 전체 레시피 갖고 오도록 처리
  @override
  Future<Result<List<Recipe>, NetworkError>> searchRecipes(
    String? keyword,
    SearchRecipeFilterTimeType? timeType,
    RatingType? ratingType,
    SearchRecipeFilterCategoryType? categoryType,
  ) async {
    try {
      final Response<RecipesDto> response = await _recipeDataSource
          .getRecipes();
      final NetworkError? networkErrorType = response.statusCode
          .statusCodeToNetworkErrorType();

      if (networkErrorType == null) {
        final result = response.body.toModel();
        return Success(
          result.recipes.where((recipe) {
            final bool matchesKeyword =
                keyword == null ||
                recipe.name.toLowerCase().contains(keyword.toLowerCase());

            // final bool matchesTimeType =
            //     timeType == null || recipe.time == timeType.value;

            final bool matchesRatingType =
                ratingType == null ||
                (ratingType == RatingType.gradeFive && recipe.rating == 5.0) ||
                (ratingType == RatingType.gradeFour &&
                    recipe.rating >= 4.0 &&
                    recipe.rating < 5.0) ||
                (ratingType == RatingType.gradeThree &&
                    recipe.rating >= 3.0 &&
                    recipe.rating < 4.0) ||
                (ratingType == RatingType.gradeTwo &&
                    recipe.rating >= 2.0 &&
                    recipe.rating < 3.0) ||
                (ratingType == RatingType.gradeOne &&
                    recipe.rating >= 1.0 &&
                    recipe.rating < 2.0);

            final bool matchesCategoryType =
                categoryType == null || recipe.category == categoryType.value;
            return matchesKeyword &&
                // matchesTimeType &&
                matchesRatingType &&
                matchesCategoryType;
          }).toList(),
        );
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
