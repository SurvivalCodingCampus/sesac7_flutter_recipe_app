import 'package:flutter_recipe_app/01_stateless/data/model/user.dart';

abstract interface class UserRepository {
  Future<List<User>> getUsers();
  Future<User> getUserById(int id);
}