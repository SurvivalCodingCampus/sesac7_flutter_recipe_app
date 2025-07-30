import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_recipe_action.freezed.dart';

@freezed
sealed class SavedRecipeAction with _$SavedRecipeAction {
  const factory SavedRecipeAction.moveSavedRecipeIngredientScreen(int id) =
      MoveSavedRecipeIngredientScreen;

  const factory SavedRecipeAction.removeSavedRecipe(int id) = RemoveSavedRecipe;
}
