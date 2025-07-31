import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_recipes_action.freezed.dart';

@freezed
sealed class SearchRecipesAction with _$SearchRecipesAction {
  const factory SearchRecipesAction.typeOnTextField(String text) = TypeOnTextField;
  const factory SearchRecipesAction.bringBottomSheet() = BringBottomSheet;
  const factory SearchRecipesAction.clickOnRecipe(int recipeId) = ClickOnRecipe;
  const factory SearchRecipesAction.clickOnBackspace() = ClickOnBackspace;
}