import 'package:freezed_annotation/freezed_annotation.dart';

import '../../state_holder/filter_search_state.dart';

part 'search_recipes_action.freezed.dart';

@freezed
sealed class SearchRecipesAction with _$SearchRecipesAction {
  const factory SearchRecipesAction.onCallFilterBottomSheet() = callFilterBottomSheet;
  const factory SearchRecipesAction.onClose() = close;
  const factory SearchRecipesAction.onTextValueChange(String value) = textValueChange;
  const factory SearchRecipesAction.onSavedFilterStatue(FilterSearchState state) = savedFilterStatue;
  const factory SearchRecipesAction.onFetchRecipes() = fetchRecipes;
}