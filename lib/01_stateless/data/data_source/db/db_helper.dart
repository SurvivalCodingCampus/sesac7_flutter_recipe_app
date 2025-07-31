import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static const String createTable = '''
      CREATE TABLE ${DbHelper.tableName} (
        ${DbHelper.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${DbHelper.colCategory} TEXT NOT NULL,
        ${DbHelper.colName} TEXT NOT NULL,
        ${DbHelper.colImageUrl} TEXT,
        ${DbHelper.colChef} TEXT,
        ${DbHelper.colTime} TEXT,
        ${DbHelper.colRating} REAL,
        ${DbHelper.colCreatedAt} INTEGER
      )
    ''';

  static Database? _db;

  static const String tableName = 'Recipe';
  static const String colId = 'id';
  static const String colCategory = 'category';
  static const String colName = 'name';
  static const String colImageUrl = 'imageUrl';
  static const String colChef = 'chef';
  static const String colTime = 'time';
  static const String colRating = 'rating';
  static const String colCreatedAt = 'createdAt';

  Future<Database> get database async {
    // 데이터베이스가 존재하면 반환하고, 없으면 초기화 후 반환합니다.
    return _db ??= await _initDb();
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'recipe.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  // 테이블 생성
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName (
        $colId INTEGER PRIMARY KEY AUTOINCREMENT,
        $colCategory TEXT NOT NULL,
        $colName TEXT NOT NULL,
        $colImageUrl TEXT,
        $colChef TEXT,
        $colTime TEXT,
        $colRating REAL,
        $colCreatedAt INTEGER
      )
    ''');
  }

  // 테이블 업그레이드
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // 마이그레이션 로직을 구현합니다.
    // 예: 버전 2에서 새 열을 추가하는 경우:
    // if (oldVersion < 2) {
    //   await db.execute('ALTER TABLE $tableName ADD COLUMN new_column TEXT');
    // }
  }

  // 데이터베이스 닫기
  Future<void> close() async {
    if (_db != null) {
      await _db!.close();
      _db = null;
    }
  }
}