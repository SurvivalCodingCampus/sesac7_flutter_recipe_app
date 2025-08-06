import 'package:flutter_recipe_app/feature/search_recipes/domain/repository/filter_search_state_repository.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/filter_search_state.dart';

class SaveFilterSearchStateUseCase {
  final FilterSearchStateRepository _filterSearchStateRepository;

  SaveFilterSearchStateUseCase({
    required FilterSearchStateRepository filterSearchStateRepository,
  }) : _filterSearchStateRepository = filterSearchStateRepository;

  Future<void> execute(FilterSearchState state) async {
    try {
      await _filterSearchStateRepository.saveFilterSearchState(state);
    } catch (e) {
      // TODO: logging
    }
  }
}
