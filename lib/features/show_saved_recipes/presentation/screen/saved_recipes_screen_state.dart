import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/recipe/domain/model/recipe.dart';

part 'saved_recipes_screen_state.freezed.dart';

@freezed
abstract class SavedRecipesScreenState with _$SavedRecipesScreenState {
  const factory SavedRecipesScreenState({
    @Default(false) bool isLoading,
    @Default([]) List<Recipe> recipes,
  }) = _SavedRecipesScreenState;
}
