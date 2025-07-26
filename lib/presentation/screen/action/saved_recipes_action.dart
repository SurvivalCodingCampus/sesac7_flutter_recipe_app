import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_recipes_action.freezed.dart';

@freezed
sealed class SavedRecipesAction with _$SavedRecipesAction {
  const factory SavedRecipesAction.onCallRecipeDetailScreen(String recipeId) = callRecipeDetailScreen;
  const factory SavedRecipesAction.onSavedRecipe(String recipeId) = savedRecipe;
}