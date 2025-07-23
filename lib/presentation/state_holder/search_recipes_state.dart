
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/recipe.dart';
import 'filter_search_state.dart';

part 'search_recipes_state.freezed.dart';

@freezed
abstract class SearchRecipesState with _$SearchRecipesState {
  const SearchRecipesState._();
  const factory SearchRecipesState({
    @Default([]) List<Recipe> orgRecipes,
    @Default([]) List<Recipe> recipes,
    @Default(false) bool isLoading,
    @Default('') String keyword,
    FilterSearchState? filterSearchState,
  }) = _SearchRecipesState;

  bool get isOrgRecipesEmpty => orgRecipes.isEmpty;
}
