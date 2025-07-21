import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/recipe.dart';

part 'search_recipes_state.freezed.dart';

@freezed
abstract class SearchRecipesState with _$SearchRecipesState {
  const factory SearchRecipesState({
    @Default('') String query,
    @Default('Recent Search') String searchLabel,
    @Default('') String resultLabel,
    @Default([]) List<Recipe> originalRecipes,
    @Default([]) List<Recipe> filteredRecipes,
    @Default(false) bool isLoading,
  }) = _SearchRecipesState;
}
