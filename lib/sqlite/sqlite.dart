import 'package:wrok_app_1/models/users_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    // Path to the database
    String path = join(await getDatabasesPath(), 'app_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE users (usrId INTEGER PRIMARY KEY AUTOINCREMENT, usrName TEXT, usrPassword TEXT)",
        );
      },
    );
  }

  // Method for user login
  Future<bool> login(String username, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'usrName = ? AND usrPassword = ?',
      whereArgs: [username, password],
    );

    return results.isNotEmpty; // Return true if a user is found
  }

  // Method for user signup
  Future<void> signup(Users user) async {
    final db = await database;
    await db.insert(
      'users',
      user.toMap(), // Ensure your Users class has a toMap() method
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
