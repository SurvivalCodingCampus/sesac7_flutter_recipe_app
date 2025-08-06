import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BookmarkDbHelper {
  static const String tableName = 'bookmarkTable';
  static const String id = 'id';
  static const String recipeId = 'recipeId';
  static const String createTableString =
      '''
CREATE TABLE $tableName (
$id INTEGER PRIMARY KEY AUTOINCREMENT,
$recipeId TEXT not null
)
''';

  static Database? _db;

  Future<Database> get database async {
    return _db ??= await _initDb();
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, '$tableName.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(createTableString);
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // 마이그레이션 로직을 구현합니다.
  }

  Future<void> close() async {
    if (_db != null) {
      await _db!.close();
      _db = null;
    }
  }
}
