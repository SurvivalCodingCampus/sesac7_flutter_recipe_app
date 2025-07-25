// 레시피 모델
import 'package:flutter_recipe_app/data/model/ingredient.dart';
import 'package:flutter_recipe_app/data/model/user.dart';

class Recipe {
  final String id;
  final String imageUrl;
  final String recipeName;
  final String userId;
  final User author;
  final double? rating;
  final String cookingTime;
  final List<Ingredient> ingredients;
  final List<String> procedures;
  final bool isBookmarked;

  Recipe({
    required this.id,
    required this.imageUrl,
    required this.recipeName,
    required this.userId,
    required this.author,
    this.rating,
    required this.cookingTime,
    this.ingredients = const [],
    this.procedures = const [],
    this.isBookmarked = false,
  });

  Recipe copyWith({
    String? id,
    String? imageUrl,
    String? recipeName,
    String? userId,
    User? author,
    double? rating,
    String? cookingTime,
    List<Ingredient>? ingredients,
    List<String>? procedures,
    bool? isBookmarked,
  }) {
    return Recipe(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      recipeName: recipeName ?? this.recipeName,
      userId: userId ?? this.userId,
      author: author ?? this.author,
      rating: rating ?? this.rating,
      cookingTime: cookingTime ?? this.cookingTime,
      ingredients: ingredients ?? this.ingredients,
      procedures: procedures ?? this.procedures,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }
}
