import 'package:flutter_recipe_app/data/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_recipes_state.freezed.dart';

@freezed
class SearchRecipesState with _$SearchRecipesState {
  @override
  final List<Recipe> allRecipes;
  @override
  final List<Recipe> searchedRecipes;
  @override
  final List<Recipe> filteredRecipes;
  @override
  final bool isRecipesLoading;

  @override
  final String keyword;

  const SearchRecipesState({
    this.allRecipes = const [],
    this.searchedRecipes = const [],
    this.filteredRecipes = const [],
    this.isRecipesLoading = false,
    this.keyword = '',
  });
}