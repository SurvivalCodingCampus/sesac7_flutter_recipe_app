import 'package:freezed_annotation/freezed_annotation.dart';

part "search_recipe_state.freezed.dart";

@freezed
abstract class SearchRecipeState with _$SearchRecipeState {
  static const String recentSearch = 'Recent Search';
  static const String searchResult = 'Search Result';

  const factory SearchRecipeState({
    @Default(SearchRecipeState.recentSearch) String searchState,
    @Default('') String fieldValue,
    @Default(0) int resultCount,
  }) = _SearchRecipeState;
}
