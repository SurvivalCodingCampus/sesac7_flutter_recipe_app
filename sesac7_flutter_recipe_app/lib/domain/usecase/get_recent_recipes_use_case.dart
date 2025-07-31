import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/repository/recipe_repository.dart';
import 'package:flutter_recipe_app/domain/repository/search_repository.dart';

class GetRecentRecipesUseCase {
  final RecipeRepository _recipeRepository;
  final SearchRepository _searchRepository;

  GetRecentRecipesUseCase({
    required RecipeRepository recipeRepository,
    required SearchRepository searchRepository,
  }) : _recipeRepository = recipeRepository,
       _searchRepository = searchRepository;

  Future<Result<List<Recipe>, void>> execute() async {
    final Result<String?, void> recentKeywordResult = await _searchRepository
        .getRecentSearchKeyword();
    switch (recentKeywordResult) {
      case Success<String?, void>():
        if (recentKeywordResult.data == null) {
          return Error(null);
        } else {
          final Result<List<Recipe>, NetworkError> searchResult =
              await _recipeRepository.searchRecipes(
                recentKeywordResult.data,
              );
          switch (searchResult) {
            case Success<List<Recipe>, NetworkError>():
              return Success(searchResult.data);
            case Error<List<Recipe>, NetworkError>():
              return Error(null);
          }
        }
      case Error<String?, void>():
        return Error(null);
    }
  }
}
