import '../../presentation/saved_recipes_state.dart';

class UnsavedRecipeUseCase {

  SavedRecipesState execute(SavedRecipesState state, int recipeId) {
    final updateIds = {...state.bookmarkedIds};

    if (updateIds.contains(recipeId)) {
      updateIds.remove(recipeId);
    } else {
      updateIds.add(recipeId);
    }

    return state.copyWith(bookmarkedIds: updateIds);
  }
}