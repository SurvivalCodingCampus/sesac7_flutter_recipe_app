import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_recipes_state.freezed.dart';

@freezed
abstract class SavedRecipesState with _$SavedRecipesState {
  const factory SavedRecipesState({
    @Default([]) List<Recipe> recipes,
    @Default(false) bool isLoading,
  }) = _SavedRecipesState;

}