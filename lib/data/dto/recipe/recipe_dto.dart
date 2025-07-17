import 'package:flutter_recipe_app/data/dto/recipe/recipe_ingredient_dto.dart';

class RecipeDto {
  final int? id;
  final String? category;
  final String? name;
  final String? image;
  final String? chef;
  final String? time;
  final double? rating;
  final List<RecipeIngredientDto>? ingredients;

  RecipeDto({
    required this.id,
    required this.category,
    required this.name,
    required this.image,
    required this.chef,
    required this.time,
    required this.rating,
    required this.ingredients,
  });

  factory RecipeDto.fromJson(Map<String, dynamic> json) {
    final List<RecipeIngredientDto>? ingredientsList =
    json['ingredients'] is List
        ? (json['ingredients'] as List<dynamic>)
        .map((e) => RecipeIngredientDto.fromJson(e as Map<String, dynamic>))
        .toList()
        : null;

    return RecipeDto(
      id: json['id'] as int?,
      category: json['category'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      chef: json['chef'] as String?,
      time: json['time'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      ingredients: ingredientsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'name': name,
      'image': image,
      'chef': chef,
      'time': time,
      'rating': rating,
      'ingredients': ingredients?.map((e) => e.toJson()).toList(),
    };
  }
}