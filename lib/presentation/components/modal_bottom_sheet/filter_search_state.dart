import 'package:flutter_recipe_app/presentation/components/modal_bottom_sheet/search_filter_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_search_state.freezed.dart';

@freezed
class FilterSearchState with _$FilterSearchState{
  @override
  final Set<TimeFilter> timeFilters;
  @override
  final Set<RatingFilter> ratingFilters;
  @override
  final Set<CategoryFilter> categoryFilters;

  const FilterSearchState({
    this.timeFilters = const {},
    this.ratingFilters = const {},
    this.categoryFilters = const {},
  });
}