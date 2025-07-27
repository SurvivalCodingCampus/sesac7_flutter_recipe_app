import 'package:freezed_annotation/freezed_annotation.dart';

import 'filter_search_bottom_sheet_state.dart';

part 'search_recipes_action.freezed.dart';

@freezed
sealed class SearchRecipesAction with _$SearchRecipesAction {
  const factory SearchRecipesAction.changeQuery(String query) = ChangeQuery;

  const factory SearchRecipesAction.showFilter() = ShowFilter;

  const factory SearchRecipesAction.applyFilter(
    FilterSearchBottomSheetState state,
  ) = ApplyFilter;
}
