import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/model/recipe.dart';
import '../../../core/presentation/component/bottom_sheet/filter_search_state.dart';

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
    @Default(FilterSearchState()) FilterSearchState filterSearchState,
  }) = _SearchRecipesState;
}
