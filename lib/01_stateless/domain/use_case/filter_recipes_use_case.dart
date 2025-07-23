import 'package:collection/collection.dart';

import '../../core/presentation/component/bottom_sheet/filter_search_state.dart';
import '../model/recipe.dart';

class FilterRecipesUseCase {
  List<Recipe> execute(
    List<Recipe> originalRecipes,
    FilterSearchState filterSearchState,
  ) {
    List<Recipe> recipes = originalRecipes
        .where((e) => e.rating.toInt() == filterSearchState.rate)
        .toList();

    switch (filterSearchState.time) {
      case 'All':
        break;
      case 'Newest':
        recipes = recipes.sorted(
          (a, b) => b.createdAt.compareTo(a.createdAt),
        );
        break;
      case 'Oldest':
        recipes = recipes.sorted(
          (b, a) => b.createdAt.compareTo(a.createdAt),
        );
        break;
      case 'Popularity':
        break;
    }

    return recipes;
  }
}
