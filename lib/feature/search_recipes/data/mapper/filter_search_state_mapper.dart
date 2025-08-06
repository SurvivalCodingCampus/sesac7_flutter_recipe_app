import 'package:flutter_recipe_app/feature/search_recipes/data/dto/filter_search_state_dto.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/filter_category.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/filter_rate.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/filter_sort_by.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/filter_search_state.dart';

extension FilterSearchStateDtoToModel on FilterSearchStateDto {
  FilterSearchState toModel() {
    return FilterSearchState(
      filterSortBy: _filterSortBy(),
      filterRate: _filterRate(),
      filterCategory: _filterCategory(),
    );
  }

  FilterSortBy _filterSortBy() {
    if (filterSortBy == null) return FilterSortBy.all;
    return FilterSortBy.fromString(filterSortBy!);
  }

  FilterRate? _filterRate() {
    if (filterRate == null) return null;
    return FilterRate.fromInt(filterRate!);
  }

  FilterCategory _filterCategory() {
    if (filterCategory == null) return FilterCategory.all;
    return FilterCategory.fromString(filterCategory!);
  }
}

extension FilterSearchStateToDto on FilterSearchState {
  FilterSearchStateDto toDto() {
    return FilterSearchStateDto(
      filterSortBy: filterSortBy.toString(),
      filterRate: filterRate?.toInt(),
      filterCategory: filterCategory.toString(),
    );
  }
}
