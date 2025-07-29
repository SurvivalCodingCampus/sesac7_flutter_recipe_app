import 'package:flutter_recipe_app/01_stateless/data/model/detailed_recipe.dart';
import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';
import 'package:flutter_recipe_app/01_stateless/data/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_detail_state.freezed.dart';

@freezed
abstract class RecipeDetailState with _$RecipeDetailState {
  const factory RecipeDetailState({
    @Default(
      DetailedRecipe(
        id: 0,
        recipe: Recipe(
          name: "error",
          author: "error",
          image: "error",
          duration: 0,
          rating: 0.0,
          id: 0,
          categories: {},
        ),
        author: User(
          id: 0,
          name: "error",
          image: "error",
          address: "error",
        ),
        procedures: [],
        ingredients: [],
        reviewCount: 0,
      ),
    )
    DetailedRecipe currentRecipe,
    @Default(false) bool isLoading,
  }) = _RecipeDetailState;
}
