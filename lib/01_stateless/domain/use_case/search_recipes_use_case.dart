import '../../core/presentation/component/bottom_sheet/filter_search_state.dart';
import '../model/recipe.dart';
import 'filter_recipes_use_case.dart';

class SearchRecipesUseCase {
  final FilterRecipesUseCase _filterRecipesUseCase;

  const SearchRecipesUseCase({
    required FilterRecipesUseCase filterRecipesUseCase,
  }) : _filterRecipesUseCase = filterRecipesUseCase;

  List<Recipe> execute(
    List<Recipe> originalRecipes,
    String query,
    FilterSearchState filterSearchState,
  ) {
    final filteredRecipes = originalRecipes
        .where(
          (e) =>
              e.name.toLowerCase().contains(query.toLowerCase()) ||
              e.chef.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();

    return _filterRecipesUseCase.execute(filteredRecipes, filterSearchState);
  }
}
