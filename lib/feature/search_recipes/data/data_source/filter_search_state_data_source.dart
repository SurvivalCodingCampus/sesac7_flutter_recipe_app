import 'package:flutter_recipe_app/feature/search_recipes/data/dto/filter_search_state_dto.dart';

abstract interface class FilterSearchStateDataSource {
  Future<FilterSearchStateDto?> findFilterSearchState();
  Future<void> saveFilterSeaerchState(FilterSearchStateDto dto);
}
