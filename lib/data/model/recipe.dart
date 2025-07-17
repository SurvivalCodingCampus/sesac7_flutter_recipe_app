import 'package:freezed_annotation/freezed_annotation.dart';

part "recipe.freezed.dart";

@freezed
class Recipe with _$Recipe {
  @override
  final String id;
  @override
  final String category;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final String creator;
  @override
  final String cookingTime;
  @override
  final double rating;
  @override
  final List<String> ingredients;

  const Recipe({
    required this.id,
    required this.category,
    required this.name,
    required this.imageUrl,
    required this.creator,
    required this.cookingTime,
    required this.rating,
    required this.ingredients,
  });
}
