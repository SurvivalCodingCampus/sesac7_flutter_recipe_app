import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_detail_action.freezed.dart';

@freezed
sealed class RecipeDetailAction with _$RecipeDetailAction {
  const factory RecipeDetailAction.clickOnBookmark(int recipeId) = ClickOnBookmark;
  const factory RecipeDetailAction.clickOnShare(int recipeId) = ClickOnShare;
  const factory RecipeDetailAction.clickOnReview(int recipeId) = ClickOnReview;
  const factory RecipeDetailAction.clickOnRate(int recipeId) = ClickOnRate;

}