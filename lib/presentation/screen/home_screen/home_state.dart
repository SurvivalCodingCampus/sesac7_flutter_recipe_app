import 'package:flutter_recipe_app/data/model/recipe.dart';

class HomeState {
  final bool isLoading;
  final List<Recipe> featuredRecipes;
  final List<Recipe> newRecipes;
  final String? errorMessage;

  HomeState({
    this.isLoading = false,
    this.featuredRecipes = const [],
    this.newRecipes = const [],
    this.errorMessage,
  });

  HomeState copyWith({
    bool? isLoading,
    List<Recipe>? featuredRecipes,
    List<Recipe>? newRecipes,
    String? errorMessage,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      featuredRecipes: featuredRecipes ?? this.featuredRecipes,
      newRecipes: newRecipes ?? this.newRecipes,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
