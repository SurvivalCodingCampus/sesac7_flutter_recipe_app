import 'package:flutter_recipe_app/data/model/recipe/filter_category.dart';
import 'package:flutter_recipe_app/data/model/recipe/filter_rate.dart';
import 'package:flutter_recipe_app/data/model/recipe/filter_sort_by.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "filter_search_state.freezed.dart";

@freezed
abstract class FilterSearchState with _$FilterSearchState {
  const factory FilterSearchState({
    @Default(FilterSortBy.all) FilterSortBy filterSortBy,
    @Default(null) FilterRate? filterRate,
    @Default(FilterCategory.all) FilterCategory filterCategory,
  }) = _FilterSearchState;
}
