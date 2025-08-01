import 'package:flutter_recipe_app/data/data_source/local/db/entity/user_entity.dart';

abstract interface class UserDao {
  Future<int> insertUser(UserEntity user);
  Future<int> updateUser(UserEntity user);
  Future<int> deleteUser();
  Future<UserEntity> findUser();
}
