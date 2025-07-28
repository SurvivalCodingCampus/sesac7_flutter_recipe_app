import '../../../core/domain/repository/recipes_repository.dart';
import '../../../core/network_error.dart';
import '../../../core/result.dart';
import '../../presentation/search_recipes_state.dart';

class SearchRecipesUseCase {

  final RecipeRepository _recipeRepository;

  SearchRecipesUseCase({
    required RecipeRepository recipeRepository
  }): _recipeRepository = recipeRepository;

  Future<Result<SearchRecipesState, NetworkError>> execute({
    required String query,
    required SearchRecipesState searchRecipesState,
  }) async {
    try {
      final result = await _recipeRepository.fetchRecipes();

      return result.when(
          success: (recipes) {
            final filteredRecipes = searchRecipesState.originalRecipes
                .where((e) => e.name.toLowerCase().contains(query.toLowerCase()) ||
                  e.chef.toLowerCase().contains(query.toLowerCase()),
            ).toList();

            final newState = searchRecipesState.copyWith(
              query: query,
              searchLabel: searchRecipesState.originalRecipes.length == filteredRecipes.length
                  ? 'Recent Search'
                  : 'Search Result',
              filteredRecipes: filteredRecipes,
              resultLabel: '${filteredRecipes.length} results',
            );

            return Result.success(newState);
          },
          failure: (NetworkError error) {
            return Result.failure(error);
          }
      );
    } catch (e) {
      return Result.failure(NetworkError.unknown);
    }
  }
}
