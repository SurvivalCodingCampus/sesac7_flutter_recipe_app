import 'package:flutter_recipe_app/data/model/recipe/filter_category.dart';
import 'package:flutter_recipe_app/data/model/recipe/filter_rate.dart';
import 'package:flutter_recipe_app/data/model/recipe/filter_sort_by.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "search_recipe_state.freezed.dart";

@freezed
abstract class SearchRecipeState with _$SearchRecipeState {
  static const String recentSearch = 'Recent Search';
  static const String searchResult = 'Search Result';

  const factory SearchRecipeState({
    @Default(SearchRecipeState.recentSearch) String searchState,
    @Default('') String fieldValue,
    @Default(0) int resultCount,
    @Default(FilterSortBy.all) FilterSortBy filterSortBy,
    @Default(null) FilterRate? filterRate,
    @Default(FilterCategory.all) FilterCategory filterCategory,
    @Default(null) String? errorMessage,
    @Default(true) bool isLoading,
  }) = _SearchRecipeState;
}
