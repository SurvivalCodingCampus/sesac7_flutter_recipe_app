import '../../../../../core/data/recipe/domain/model/recipe.dart';
import '../../../presentation/screen/search_recipes_screen_state.dart';

class FilterRecipesUseCase {
  List<Recipe> execute(
    SearchRecipesScreenState state,
    List<Recipe> baseList,
  ) {
    List<Recipe> filteredList = baseList;

    // rating 필터만 일단 적용
    if (state.filterSearchState.selectedRatingFilter != null) {
      filteredList = baseList
          .where(
            (e) =>
                e.rating >= state.filterSearchState.selectedRatingFilter! &&
                e.rating < state.filterSearchState.selectedRatingFilter! + 1,
          )
          .toList();
    }

    return filteredList;
  }
}
