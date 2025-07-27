import '../../../../../core/data/recipe/domain/model/recipe.dart';
import '../../../presentation/screen/search_recipes_screen_state.dart';

class SearchRecipesUseCase {
  List<Recipe> execute(
    SearchRecipesScreenState state,
    String query,
  ) {
    final searchedResult = state.recipes
        .where(
          (e) =>
              e.name.toLowerCase().replaceAll(' ', '').contains(query) ||
              e.chef.toLowerCase().replaceAll(' ', '').contains(query),
        )
        .toList();

    return searchedResult;
  }
}
