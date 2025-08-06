import 'package:flutter_recipe_app/data/data_source/local/db/dao/user_dao.dart';
import 'package:flutter_recipe_app/data/data_source/local/db/database_helper.dart';
import 'package:flutter_recipe_app/data/data_source/local/db/entity/user_entity.dart';
import 'package:flutter_recipe_app/data/mapper/user_mapper.dart';
import 'package:sqflite/sqflite.dart';

class UserDaoImpl implements UserDao {
  final Database _database;

  UserDaoImpl(this._database);

  @override
  Future<int> deleteUser() async {
    return await _database.delete(
      DatabaseHelper.tableName,
    );
  }

  @override
  Future<UserEntity> findUser() async {
    final List<Map<String, dynamic>> maps = await _database.query(
      DatabaseHelper.tableName,
      limit: 1,
    );
    if (maps.isNotEmpty) {
      return UserEntity.fromJson(maps.first);
    } else {
      throw Exception('User not found');
    }
  }

  @override
  Future<int> insertUser(UserEntity user) async {
    return await _database.insert(
      DatabaseHelper.tableName,
      user.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<int> updateUser(UserEntity user) async {
    return await _database.update(
      DatabaseHelper.tableName,
      user.toJson(),
      where: 'id = ?',
      whereArgs: [user.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
