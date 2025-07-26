// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => _ReviewModel(
  id: json['id'] as String,
  recipeId: json['recipeId'] as String,
  userId: json['userId'] as String,
  userProfileImageUrl: json['userProfileImageUrl'] as String?,
  rating: (json['rating'] as num).toInt(),
  comment: json['comment'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$ReviewModelToJson(_ReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipeId': instance.recipeId,
      'userId': instance.userId,
      'userProfileImageUrl': instance.userProfileImageUrl,
      'rating': instance.rating,
      'comment': instance.comment,
      'timestamp': instance.timestamp.toIso8601String(),
    };
