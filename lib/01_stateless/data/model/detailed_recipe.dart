import 'package:flutter_recipe_app/01_stateless/data/model/ingredient.dart';
import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';
import 'package:flutter_recipe_app/01_stateless/data/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detailed_recipe.freezed.dart';

@freezed
abstract class DetailedRecipe with _$DetailedRecipe {
  const factory DetailedRecipe({
    required int id,
    required Recipe recipe,
    required User author,
    required List<String> procedures,
    required List<Ingredient> ingredients,
    required int reviewCount,

  }) = _DetailedRecipe;

}