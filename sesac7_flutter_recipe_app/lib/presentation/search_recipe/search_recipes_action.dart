import 'package:flutter_recipe_app/core/enum/rating_type.dart';
import 'package:flutter_recipe_app/core/enum/search_recipe_filter_category_type.dart';
import 'package:flutter_recipe_app/core/enum/search_recipe_filter_time_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_recipes_action.freezed.dart';

@freezed
sealed class SearchRecipesAction with _$SearchRecipesAction {
  const factory SearchRecipesAction.changeKeyword(String keyword) =
      ChangeKeyword;

  const factory SearchRecipesAction.showFilterBottomSheet() =
      ShowFilterBottomSheet;

  const factory SearchRecipesAction.searchFilteredRecipe(
    SearchRecipeFilterTimeType? timeType,
    RatingType? ratingType,
    SearchRecipeFilterCategoryType? categoryType,
  ) = SearchFilteredRecipe;
}
