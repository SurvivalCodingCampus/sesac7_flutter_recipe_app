import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/presentation/component/bottom_sheet/filter_search_state.dart';

part 'search_recipes_action.freezed.dart';

@freezed
sealed class SearchRecipesAction with _$SearchRecipesAction {
  const factory SearchRecipesAction.search(String query) = SearchRecipes;
  const factory SearchRecipesAction.showFilterBottomSheet() = ShowFilterBottomSheet;
  const factory SearchRecipesAction.applyFilter(FilterSearchState filterSearchState) = ApplyFilter;
}