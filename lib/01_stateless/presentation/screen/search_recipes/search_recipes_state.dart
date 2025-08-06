import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_recipes_state.freezed.dart';

@freezed
abstract class SearchRecipesState with _$SearchRecipesState {
  const factory SearchRecipesState({
    @Default([]) List<Recipe> recipes,
    @Default(0) int rate,
    @Default({}) Set<String> categories,
    @Default('') String input,
    @Default(false) bool isLoading,
  }) = _SearchRecipesState;
}