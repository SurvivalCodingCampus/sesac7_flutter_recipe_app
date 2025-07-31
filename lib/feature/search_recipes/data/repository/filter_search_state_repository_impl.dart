import 'package:flutter_recipe_app/feature/search_recipes/data/data_source/filter_search_state_data_source.dart';
import 'package:flutter_recipe_app/feature/search_recipes/data/mapper/filter_search_state_mapper.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/repository/filter_search_state_repository.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/filter_search_state.dart';

class FilterSearchStateRepositoryImpl implements FilterSearchStateRepository {
  final FilterSearchStateDataSource _filterSearchStateDataSource;

  FilterSearchStateRepositoryImpl({
    required FilterSearchStateDataSource filterSearchStateDataSource,
  }) : _filterSearchStateDataSource = filterSearchStateDataSource;

  @override
  Future<FilterSearchState> findFilterSearchState() async {
    final dto = await _filterSearchStateDataSource.findFilterSearchState();

    return dto.toModel();
  }

  @override
  Future<void> saveFilterSearchState(FilterSearchState state) async {
    await _filterSearchStateDataSource.saveFilterSeaerchState(state.toDto());
  }
}
