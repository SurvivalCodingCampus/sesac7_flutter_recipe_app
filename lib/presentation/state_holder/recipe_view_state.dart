import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/recipe.dart';

part 'recipe_view_state.freezed.dart';

@freezed
abstract class RecipeViewState with _$RecipeViewState {
  const factory RecipeViewState({
    @Default([]) List<Recipe> recipes,
    @Default(false) bool isLoading,
  }) = _RecipeViewState;

}
