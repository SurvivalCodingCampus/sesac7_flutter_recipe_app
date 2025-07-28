import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/enum/rating_type.dart';
import 'package:flutter_recipe_app/core/enum/search_recipe_filter_category_type.dart';
import 'package:flutter_recipe_app/core/enum/search_recipe_filter_time_type.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/repository/recipe_repository.dart';

class SearchRecipeByFilterUseCase {
  final RecipeRepository _recipeRepository;

  SearchRecipeByFilterUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<Result<List<Recipe>, NetworkError>> execute(
    SearchRecipeFilterTimeType? timeType,
    RatingType? ratingType,
    SearchRecipeFilterCategoryType? categoryType,
  ) async {
    final Result<List<Recipe>, NetworkError> result = await _recipeRepository
        .searchRecipes(null, timeType, ratingType, categoryType);
    switch (result) {
      case Success<List<Recipe>, NetworkError>():
        return Success(result.data);
      case Error<List<Recipe>, NetworkError>():
        return Error(result.error);
    }
  }
}
