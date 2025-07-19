import 'dart:async';

import 'package:flutter_recipe_app/core/network_error.dart';
import 'package:flutter_recipe_app/core/network_validator_mixin.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/data/data_source/recipe/recipe_data_source.dart';
import 'package:flutter_recipe_app/data/mapper/recipe/recipe_mapper.dart';
import 'package:flutter_recipe_app/data/model/recipe/filter_category.dart';
import 'package:flutter_recipe_app/data/model/recipe/filter_rate.dart';
import 'package:flutter_recipe_app/data/model/recipe/filter_sort_by.dart';
import 'package:flutter_recipe_app/data/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/data/repository/recipe/recipe_repository.dart';

class RecipeRepositoryImpl
    with NetworkValidatorMixin
    implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  RecipeRepositoryImpl({required RecipeDataSource recipeDataSource})
    : _recipeDataSource = recipeDataSource;

  @override
  Future<Result<List<Recipe>, NetworkError>> fetchAllRecipes() async {
    try {
      final response = await _recipeDataSource.fetchAllRecipes();
      final error = checkStatusCodeError(response.statusCode);

      if (error != null) {
        return Result.error(error);
      }

      return Result.success(
        response.body
            .map((e) => e.toModel())
            .where((e) => e.id != Recipe.invalidId)
            .toList(),
      );
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    } on FormatException {
      return Result.error(NetworkError.parseError);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }

  @override
  Future<Result<List<Recipe>, NetworkError>> filterRecipes({
    required String keyword,
    FilterSortBy? filterSortBy,
    FilterRate? filterRate,
    FilterCategory? filterCategory,
  }) async {
    final result = await searchRecipes(keyword);

    switch (result) {
      case Success<List<Recipe>, NetworkError>():
        var recipes = result.data;

        if (filterSortBy != null) {
          recipes = _filterRecipesSortedBy(recipes, filterSortBy);
        }
        if (filterRate != null) {
          recipes = _filterRecipesByRate(recipes, filterRate);
        }
        if (filterCategory != null) {
          recipes = _filterRecipesByCategory(recipes, filterCategory);
        }

        return Result.success(recipes);
      case Error<List<Recipe>, NetworkError>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<List<Recipe>, NetworkError>> searchRecipes(
    String keyword,
  ) async {
    final result = await fetchAllRecipes();

    switch (result) {
      case Success<List<Recipe>, NetworkError>():
        return Result.success(
          result.data
              .where(
                (e) => e.name.contains(keyword) || e.creator.contains(keyword),
              )
              .toList(),
        );
      case Error<List<Recipe>, NetworkError>():
        return Result.error(result.error);
    }
  }

  List<Recipe> _filterRecipesSortedBy(
    List<Recipe> recipes,
    FilterSortBy sortBy,
  ) {
    return switch (sortBy) {
      FilterSortBy.all => recipes,
      FilterSortBy.newest => recipes,
      FilterSortBy.oldest => recipes,
      FilterSortBy.popularity => recipes,
    };
  }

  List<Recipe> _filterRecipesByRate(
    List<Recipe> recipes,
    FilterRate filterRate,
  ) {
    return switch (filterRate) {
      FilterRate.one => recipes.where((e) => e.rating < 2).toList(),
      FilterRate.two =>
        recipes.where((e) => e.rating >= 2 && e.rating < 3).toList(),
      FilterRate.three =>
        recipes.where((e) => e.rating >= 3 && e.rating < 4).toList(),
      FilterRate.four =>
        recipes.where((e) => e.rating >= 4 && e.rating < 5).toList(),
      FilterRate.five => recipes.where((e) => e.rating >= 5).toList(),
    };
  }

  List<Recipe> _filterRecipesByCategory(
    List<Recipe> recipes,
    FilterCategory filterCategory,
  ) {
    if (filterCategory == FilterCategory.all) {
      return recipes;
    }

    return recipes
        .where((e) => e.category == filterCategory.toString())
        .toList();
  }
}
