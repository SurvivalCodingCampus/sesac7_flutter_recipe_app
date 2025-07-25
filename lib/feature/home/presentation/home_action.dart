import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/feature/home/domain/model/home_recipe_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "home_action.freezed.dart";

@freezed
sealed class HomeAction with _$HomeAction {
  const factory HomeAction.searchValueChange(String value) = SearchValueChange;
  const factory HomeAction.tapFilterButton() = TapFilterButton;
  const factory HomeAction.selectCategory(HomeRecipeCategory category) =
      SelectCategory;
  const factory HomeAction.tapFavorite(Recipe recipe) = TapFavorite;
}
