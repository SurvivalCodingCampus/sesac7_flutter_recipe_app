import 'package:flutter_recipe_app/domain/model/ingredients.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

@freezed
class Recipe with _$Recipe {
  @override
  String category;
  @override
  num id;
  @override
  String name;
  @override
  String image;
  @override
  String chef;
  @override
  String time;
  @override
  num rating;
  @override
  List<Ingredients> ingredients;

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
