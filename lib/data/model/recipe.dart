import 'ingredient.dart';

class Recipe {
  final String id;
  final String imageUrl;
  final String recipeName;
  final String userId;
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
      rating: rating ?? this.rating,
      cookingTime: cookingTime ?? this.cookingTime,
      ingredients: ingredients ?? this.ingredients,
      procedures: procedures ?? this.procedures,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }
}
