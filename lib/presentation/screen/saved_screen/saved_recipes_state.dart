// freezed 는 자동으로 List, Map, Set 을 Unmodifiable 하게 작성해 준다.
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/recipes.dart';

part 'saved_recipes_state.freezed.dart';

@freezed
abstract class SavedRecipesState with _$SavedRecipesState {
  const factory SavedRecipesState({
    @Default(true) bool isLoading,
    @Default([]) List<Recipes> savedRecipes,
    @Default('')String? errorMessage,
  }) = _SavedRecipesState;
}
