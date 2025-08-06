import 'package:flutter_recipe_app/feature/search_recipes/presentation/filter_search_state.dart';

abstract interface class FilterSearchStateRepository {
  Future<FilterSearchState> findFilterSearchState();
  Future<void> saveFilterSearchState(FilterSearchState state);
}
