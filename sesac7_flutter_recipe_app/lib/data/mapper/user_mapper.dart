import 'dart:convert';

import 'package:flutter_recipe_app/data/data_source/local/db/entity/user_entity.dart';

import '../../domain/model/user.dart';

extension UserToUserEntity on User {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      name: name,
      address: address,
      profileImage: profileImage,
      savedRecipes: jsonEncode(savedRecipes),
      myRecipes: jsonEncode(myRecipes),
      followers: jsonEncode(followers),
      following: jsonEncode(following),
      job: job,
      introduce: introduce,
      notifications: jsonEncode(notifications),
    );
  }
}

extension UserEntityToUserAndToJson on UserEntity {
  User toModel() {
    print(jsonDecode(savedRecipes).runtimeType);
    return User(
      id: id,
      email: email,
      name: name,
      address: address,
      profileImage: profileImage,
      savedRecipes: jsonDecode(savedRecipes).cast<List>(),
      myRecipes: jsonDecode(myRecipes).cast<List>(),
      followers: jsonDecode(followers).cast<List>(),
      following: jsonDecode(following).cast<List>(),
      job: job,
      introduce: introduce,
      notifications: jsonDecode(notifications).cast<List>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'address': address,
      'profileImage': profileImage,
      'savedRecipes': jsonEncode(savedRecipes),
      'myRecipes': jsonEncode(myRecipes),
      'followers': jsonEncode(followers),
      'following': jsonEncode(following),
      'job': job,
      'introduce': introduce,
      'notifications': jsonEncode(notifications),
    };
  }
}
