// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IngredientModel _$IngredientModelFromJson(Map<String, dynamic> json) =>
    _IngredientModel(
      name: json['name'] as String,
      quantity: json['quantity'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$IngredientModelToJson(_IngredientModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
      'imageUrl': instance.imageUrl,
    };
