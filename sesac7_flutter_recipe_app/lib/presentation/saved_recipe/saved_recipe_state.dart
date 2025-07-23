import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_recipe_state.freezed.dart';

@freezed
abstract class SavedRecipeState with _$SavedRecipeState {
  const factory SavedRecipeState({
    @Default([]) List<Recipe> savedRecipes,
  }) = _SavedRecipeState;
}
