import 'package:flutter_recipe_app/feature/search_recipes/presentation/filter_search_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "search_recipes_action.freezed.dart";

@freezed
sealed class SearchRecipesAction with _$SearchRecipesAction {
  const factory SearchRecipesAction.changeSearchValue(String value) =
      ChangeSearchValue;
  const factory SearchRecipesAction.tapFilterButton() = TapFilterButton;
  const factory SearchRecipesAction.selectFilter(FilterSearchState state) =
      SelectFilter;
}
