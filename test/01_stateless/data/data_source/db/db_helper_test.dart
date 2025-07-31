import 'package:flutter_recipe_app/01_stateless/data/data_source/db/db_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {

  test('db_helper.dart', () async {
    var db = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);

    expect(DbHelper().database.hashCode, DbHelper().database.hashCode);

    await db.close();
  });
}