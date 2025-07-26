// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeModel _$RecipeModelFromJson(Map<String, dynamic> json) => _RecipeModel(
  id: json['id'] as String,
  title: json['title'] as String,
  imageUrl: json['imageUrl'] as String,
  description: json['description'] as String,
  ingredients: (json['ingredients'] as List<dynamic>)
      .map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  steps: (json['steps'] as List<dynamic>)
      .map((e) => StepInfo.fromJson(e as Map<String, dynamic>))
      .toList(),
  cookTimeMinutes: (json['cookTimeMinutes'] as num).toInt(),
  servings: (json['servings'] as num).toInt(),
  authorName: json['authorName'] as String,
  averageRating: (json['averageRating'] as num).toDouble(),
  reviewCount: (json['reviewCount'] as num).toInt(),
  category: json['category'] as String,
  isSavedByUser: json['isSavedByUser'] as bool,
);

Map<String, dynamic> _$RecipeModelToJson(_RecipeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'ingredients': instance.ingredients,
      'steps': instance.steps,
      'cookTimeMinutes': instance.cookTimeMinutes,
      'servings': instance.servings,
      'authorName': instance.authorName,
      'averageRating': instance.averageRating,
      'reviewCount': instance.reviewCount,
      'category': instance.category,
      'isSavedByUser': instance.isSavedByUser,
    };
