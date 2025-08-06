import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/user.dart';

abstract interface class UserRepository {
  Future<Result<User, void>> getUser();

  Future<Result<void, void>> updateUser(User user);

  Future<Result<void, void>> insetUser(User user);

  Future<Result<void, void>> deleteUser();
}
