import 'package:collection/collection.dart';

import '../../../core/domain/model/recipe.dart';
import '../../../core/network_error.dart';
import '../../../core/presentation/component/bottom_sheet/filter_search_state.dart';
import '../../../core/result.dart';
import '../../presentation/search_recipes_state.dart';

class FilterRecipesUseCase {
  FilterRecipesUseCase();

  Future<Result<SearchRecipesState, NetworkError>> execute({
    required FilterSearchState filterSearchState,
    required SearchRecipesState currentState,
  }) async {
    try {
      List<Recipe> filtered = currentState.originalRecipes;

      // filteredRecipes를 사용해서 필터링을 누적하는 방식
      filtered = filtered.where((e) => e.rating.toInt() == filterSearchState.rate).toList();
      // filtered = filtered.where((e) => e.time == filterSearchState.time).toList();
      // filtered = filtered.where((e) => e.category == filterSearchState.category).toList();

      if(filterSearchState.filterApplied) {
        final newState = currentState.copyWith(
          filteredRecipes: filtered,
          filterSearchState: filterSearchState,
          resultLabel: '${filtered.length} results',
          searchLabel: 'Search Result',
        );
        print('필터된 값 리스트 : $newState');
        print('[DEBUG] filteredRecipes: ${newState.filteredRecipes.length}');
        return Result.success(newState);
      }
      return Result.failure(NetworkError.unknown);
    } catch (e) {
      return Result.failure(NetworkError.unknown);
    }
  }
}