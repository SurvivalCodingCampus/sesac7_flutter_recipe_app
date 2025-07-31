import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/recipes.dart';

part 'search_recipes_state.freezed.dart';

@freezed
abstract class SearchRecipesState with _$SearchRecipesState {
  const factory SearchRecipesState({
    @Default([]) List<Recipes> filteredRecipes,
    @Default([]) List<Recipes> originalRecipes,
    @Default('') String searchQuery,
    @Default('Recent Search') String searchLabel,
    @Default('') String resultLabel,
    @Default(true) bool isLoading,
    @Default('') String? errorMessage,
  }) = _SearchRecipesState;
}
