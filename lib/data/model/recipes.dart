import 'package:flutter_recipe_app/data/model/ingredients.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipes.freezed.dart';

part 'recipes.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class Recipes with _$Recipes {
  final String category;
  final int id;
  final String name;
  final String image;
  final String chef;
  final int rating;
  final int minute;
  final List<Ingredients> ingredients;

  const Recipes({
    required this.category, required this.id, required this.name, required this.image, required this.chef, required this.rating, required this.minute, required this.ingredients,
  });

  factory Recipes.fromJson(Map<String, Object?> json) => _$RecipesFromJson(json);

  Map<String, dynamic> toJson() => _$RecipesToJson(this);
}