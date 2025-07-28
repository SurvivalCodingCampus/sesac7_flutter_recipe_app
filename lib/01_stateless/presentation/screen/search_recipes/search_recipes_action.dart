import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/presentation/component/bottom_sheet/filter_search_state.dart';
import '../../../domain/model/recipe.dart';

part 'search_recipes_action.freezed.dart';

@freezed
sealed class SearchRecipesAction with _$SearchRecipesAction {
  const factory SearchRecipesAction.changeQuery(String query) = ChangeQuery;

  const factory SearchRecipesAction.clickFilterButton() = ClickFilterButton;

  const factory SearchRecipesAction.applyFilter(FilterSearchState state) =
      ApplyFilter;

  const factory SearchRecipesAction.clickRecipeItem(Recipe recipe) =
      ClickRecipeItem;

  const factory SearchRecipesAction.clickTitle() = ClickTitle;
}
