import 'package:flutter_recipe_app/data/model/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "recipe.freezed.dart";

@freezed
class Recipe with _$Recipe {
  @override
  final String id;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final String imageWithBackgroundUrl;
  @override
  final double rating;
  @override
  final Duration cookingTime;
  @override
  final String creator;
  @override
  final DateTime createdAt;
  @override
  final String? videoUrl;
  @override
  final List<String> ingredients;
  @override
  final Category category;
  @override
  final List<String> tags;
  @override
  final List<String> reviews;
  @override
  final int servings;
  @override
  final List<String> steps;

  const Recipe({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.imageWithBackgroundUrl,
    required this.rating,
    required this.cookingTime,
    required this.creator,
    required this.createdAt,
    required this.videoUrl,
    required this.ingredients,
    required this.category,
    required this.tags,
    required this.reviews,
    required this.servings,
    required this.steps,
  });
}
