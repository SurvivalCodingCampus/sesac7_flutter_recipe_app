import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/repository/filter_search_state_repository.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/filter_search_state.dart';

class GetFilterSearchStateUseCase {
  final FilterSearchStateRepository _filterSearchStateRepository;

  GetFilterSearchStateUseCase({
    required FilterSearchStateRepository filterSearchStateRepository,
  }) : _filterSearchStateRepository = filterSearchStateRepository;

  Future<Result<FilterSearchState, String>> execute() async {
    try {
      final state = await _filterSearchStateRepository.findFilterSearchState();

      return Result.success(state);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
