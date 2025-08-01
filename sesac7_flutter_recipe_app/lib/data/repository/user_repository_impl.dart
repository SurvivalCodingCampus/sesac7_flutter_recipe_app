import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/data/data_source/local/db/entity/user_entity.dart';
import 'package:flutter_recipe_app/data/mapper/user_mapper.dart';
import 'package:flutter_recipe_app/domain/model/user.dart';
import 'package:flutter_recipe_app/domain/repository/user_repository.dart';

import '../data_source/local/db/dao/user_dao.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDao _userDao;

  const UserRepositoryImpl({
    required UserDao userDao,
  }) : _userDao = userDao;

  @override
  Future<Result<void, void>> deleteUser() async {
    try {
      final int deleteCount = await _userDao.deleteUser();

      if (deleteCount > 0) {
        return Result.success(null);
      } else {
        return Result.error(null);
      }
    } catch (e) {
      return Result.error(null);
    }
  }

  @override
  Future<Result<User, void>> getUser() async {
    try {
      final UserEntity userEntity = await _userDao.findUser();

      return Success(userEntity.toModel());
    } catch (e) {
      return Result.error(null);
    }
  }

  @override
  Future<Result<void, void>> insetUser(User user) async {
    try {
      final int insertCount = await _userDao.insertUser(user.toEntity());
      if (insertCount > 0) {
        return Result.success(null);
      } else {
        return Result.error(null);
      }
    } catch (e) {
      return Result.error(null);
    }
  }

  @override
  Future<Result<void, void>> updateUser(User user) async {
    try {
      final int updateCount = await _userDao.updateUser(user.toEntity());
      if (updateCount > 0) {
        return Result.success(null);
      } else {
        return Result.error(null);
      }
    } catch (e) {
      return Result.error(null);
    }
  }
}
