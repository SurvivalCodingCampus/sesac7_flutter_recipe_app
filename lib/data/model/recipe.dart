import 'package:flutter_recipe_app/data/model/ingredients.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

part 'recipe.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class Recipe with _$Recipe {
  final String category;
  final int id;
  final String name;
  final String image;
  final String chef;
  final int rating;
  final int minute;
  final List<Ingredients> ingredients;

  const Recipe({
    required this.category, required this.id, required this.name, required this.image, required this.chef, required this.rating, required this.minute, required this.ingredients,
  });

  factory Recipe.fromJson(Map<String, Object?> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}