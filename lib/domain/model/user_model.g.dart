// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
  name: json['name'] as String,
  profileImageUrl: json['profileImageUrl'] as String,
  savedRecipeIds: (json['savedRecipeIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'profileImageUrl': instance.profileImageUrl,
      'savedRecipeIds': instance.savedRecipeIds,
    };
