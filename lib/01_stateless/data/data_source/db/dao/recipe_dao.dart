import 'package:sqflite/sqflite.dart';

import '../db_helper.dart';
import '../entity/recipe_entity.dart';

class RecipeDao {
  final Database _db;

  RecipeDao(this._db);

  // 레시피 추가
  Future<int> insertRecipe(RecipeEntity recipe) async {
    return await _db.insert(
      DbHelper.tableName,
      recipe.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace, // 중복 시 덮어쓰기
    );
  }

  // ID로 레시피 조회
  Future<RecipeEntity?> findRecipeById(int id) async {
    final List<Map<String, dynamic>> maps = await _db.query(
      DbHelper.tableName,
      where: '${DbHelper.colId} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return RecipeEntity.fromMap(maps.first);
    } else {
      return null;
    }
  }

  // 모든 레시피 조회
  Future<List<RecipeEntity>> getAllRecipes() async {
    final List<Map<String, dynamic>> maps = await _db.query(DbHelper.tableName);
    return maps.map((map) => RecipeEntity.fromMap(map)).toList();
  }

  // 레시피 수정
  Future<int> updateRecipe(RecipeEntity recipe) async {
    return await _db.update(
      DbHelper.tableName,
      recipe.toMap(),
      where: '${DbHelper.colId} = ?',
      whereArgs: [recipe.id],
    );
  }

  // 레시피 삭제
  Future<int> deleteRecipe(int id) async {
    return await _db.delete(
      DbHelper.tableName,
      where: '${DbHelper.colId} = ?',
      whereArgs: [id],
    );
  }
}
