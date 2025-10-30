import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'otex_database.db');
    return await openDatabase(path, version: 1, onCreate: _createTables);
  }

  Future<void> _createTables(Database db, int version) async {
    // Categories
    await db.execute('''
      CREATE TABLE categories(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        image_path TEXT NOT NULL
      )
    ''');

    // Products
    await db.execute('''
      CREATE TABLE products(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        original_price TEXT NOT NULL,
        discounted_price TEXT NOT NULL,
        image_path TEXT NOT NULL,
        category_id INTEGER,
        sales_count TEXT NOT NULL
      )
    ''');

    // Packages/Bouquets
    await db.execute('''
      CREATE TABLE packages(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        price TEXT NOT NULL,
        views_count INTEGER,
        is_featured INTEGER DEFAULT 0,
        features TEXT,
        tape_text TEXT
      )
    ''');

    // Filter Options
    await db.execute('''
      CREATE TABLE filter_options(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        filter_type TEXT NOT NULL,
        option_name TEXT NOT NULL,
        is_selected INTEGER DEFAULT 0
      )
    ''');

    // App Text Content
    await db.execute('''
      CREATE TABLE app_texts(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        screen_name TEXT NOT NULL,
        text_key TEXT NOT NULL,
        text_value TEXT NOT NULL
      )
    ''');

    // App Icons
    await db.execute('''
    CREATE TABLE app_icons(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      screen_name TEXT NOT NULL,
      icon_key TEXT NOT NULL,
      icon_path TEXT NOT NULL
    )
  ''');
  }

  Future<void> close() async {
    if (_database != null) {
      await _database!.close();
    }
  }
}
