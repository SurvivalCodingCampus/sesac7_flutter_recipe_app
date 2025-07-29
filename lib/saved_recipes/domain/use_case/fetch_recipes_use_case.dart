import '../../../core/domain/model/recipe.dart';
import '../../../core/domain/repository/recipes_repository.dart';
import '../../../core/network_error.dart';
import '../../../core/result.dart';
import 'package:flutter_recipe_app/saved_recipes/presentation/saved_recipes_state.dart';

class FetchRecipesUseCase {
  final RecipeRepository _recipeRepository;
  final SavedRecipesState _state;

  const FetchRecipesUseCase({
    required RecipeRepository recipeRepository,
    required SavedRecipesState state,
  }): _recipeRepository = recipeRepository,
        _state = state;


  // ? use case 에서 result 가 network_repository.dart error 타입까지 가질 필요가 있는지?

  Future<Result<SavedRecipesState, NetworkError>> execute() async {

    // await Future.delayed(const Duration(seconds: 2));
    final result = await _recipeRepository.fetchRecipes();
    return result.when(
      success: (recipes) {
        final updatedRecipes = <Recipe>[];
        final bookmarkedIds = <int>{};

        for (final e in recipes) {
          final updated = e.copyWith(isBookmarked: true);
          updatedRecipes.add(updated);
          bookmarkedIds.add(updated.id);
        }

        final state = SavedRecipesState(
          recipes: updatedRecipes,
          bookmarkedIds: bookmarkedIds,
          isLoading: false,
        );

        return Result.success(state);
      },
      failure: (error) => Result.failure(error),
    );
  }
}