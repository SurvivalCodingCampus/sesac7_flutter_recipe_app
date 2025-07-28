import 'package:flutter_recipe_app/domain/model/ingredients.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

@freezed
class Recipe with _$Recipe {
  @override
  final String category;
  @override
  final int id;
  @override
  final String name;
  @override
  final String image;
  @override
  final String chef;
  @override
  final String time;
  @override
  final num rating;
  @override
  final List<Ingredients> ingredients;

  Recipe({
    required this.category,
    required this.id,
    required this.name,
    required this.image,
    required this.chef,
    required this.time,
    required this.rating,
    required this.ingredients,
  });
}
