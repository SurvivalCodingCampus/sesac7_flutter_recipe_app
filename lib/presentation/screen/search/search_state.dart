import 'package:flutter_recipe_app/data/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default(false) bool isLoading,
    @Default([]) List<Recipe> recipes,
    @Default('') String filterOption,
    @Default('') String listTitle,
    @Default('') String theNumberOfSearchResult,
    @Default('') String keyword,
    @Default('') String errorMessage,
  }) = _SearchState;
}
