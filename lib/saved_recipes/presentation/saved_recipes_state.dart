import 'package:flutter_recipe_app/core/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_recipes_state.freezed.dart';

@freezed
abstract class SavedRecipesState with _$SavedRecipesState {
  const factory SavedRecipesState({
    @Default([]) final List<Recipe> recipes,
    @Default(<int>{}) final Set<int> bookmarkedIds,
    @Default(false) bool isBookmarked,
    @Default(false) final bool isLoading,
  }) = _SavedRecipesState;
}