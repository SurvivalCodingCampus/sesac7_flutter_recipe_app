import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_action.freezed.dart';

@freezed
sealed class MainAction with _$MainAction {
  const factory MainAction.clickCategoryTab(int index) = ClickCategoryTab;
  const factory MainAction.clickOnRecipe(int recipeId) = ClickOnRecipe;
  const factory MainAction.clickOnBookmark(int recipeId) = ClickOnBookmark;
  const factory MainAction.clickOnSearch() = ClickOnSearch;
}


