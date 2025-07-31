import 'package:flutter_recipe_app/feature/saved_recipes/data/data_source/bookmark_data_source.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/data/data_source/bookmark_db_helper.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/data/dto/bookmark_dto.dart';
import 'package:sqflite/sqflite.dart';

class LocalBookmarkDataSourceImpl implements BookmarkDataSource {
  final Database _db;

  LocalBookmarkDataSourceImpl({required Database db}) : _db = db;

  @override
  Future<int> deleteBookmark(BookmarkDto dto) async {
    return await _db.delete(
      BookmarkDbHelper.tableName,
      where: '${BookmarkDbHelper.id} = ?',
      whereArgs: [dto.id],
    );
  }

  @override
  Future<List<BookmarkDto>> findBookmarks() async {
    final jsons = await _db.query(BookmarkDbHelper.tableName);

    return jsons.map((e) => BookmarkDto.fromJson(e)).toList();
  }

  @override
  Future<int> insertBookmark(BookmarkDto dto) async {
    return await _db.insert(BookmarkDbHelper.tableName, dto.toJson());
  }
}
