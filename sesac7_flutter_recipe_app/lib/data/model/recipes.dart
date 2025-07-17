import 'package:flutter_recipe_app/data/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipes.freezed.dart';

@freezed
class Recipes with _$Recipes{
  @override
  final List<Recipe> recipes;

  const Recipes({
    required this.recipes,
  });
}